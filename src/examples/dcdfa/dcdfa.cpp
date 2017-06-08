#include <iostream>
#include <iomanip>
#include <string>
#include <array>
#include <queue>
#include <vector>
#include <algorithm>
#include <chrono>
#include <functional>
#include "Eigen/Core"
#include "mnist/mnist_reader.hpp"

#include "brica2.hpp"

auto sigmoid = [](const float x)->float { return tanh(x * 0.5f) * 0.5f + 0.5f; };
auto dsigmoid = [](const float y)->float { return y * (1.0f - y); };

auto mtanh = [](const float x)->float { return tanh(x); };
auto dtanh = [](const float y)->float { return 1 - (y * y); };

auto relu = [](const float x)->float { return std::max(0.0f, x); };
auto frelu = [](const float x)->float { return std::min(std::max(0.0f, x), 1.0f); };
auto drelu = [](const float y)->float { return y > 0.0f ? 1.0f : 0.0f; };

void print_size(Eigen::MatrixXf m) {
  std::cout << m.rows() << " " << m.cols() <<std::endl;
}

Eigen::MatrixXf softmax(Eigen::MatrixXf y) {
  const std::size_t N = y.rows();
  const std::size_t M = y.cols();
  const float max = y.maxCoeff();
  Eigen::MatrixXf ret(N, M);
  for(std::size_t i = 0; i < N; ++i) {
      ret.row(i) = (y.row(i).array() - max).exp();
      ret.row(i) /= ret.row(i).sum();
  }
  return ret;
}

float mean_squared_error(Eigen::MatrixXf y, Eigen::MatrixXf t) {
  Eigen::MatrixXf d = y - t;
  Eigen::VectorXf f(Eigen::Map<Eigen::VectorXf>(d.data(), d.cols()*d.rows()));
  return f.dot(f) / d.size();
}

float cross_entropy(Eigen::MatrixXf y, Eigen::MatrixXf t) {
  return -(y.array() * ((t.array() + 1e-10f).log())).sum() / t.rows();
}

float accuracy(Eigen::MatrixXf y, Eigen::MatrixXf t) {
  float total = 0.0f;
  for(std::size_t i = 0; i < y.rows(); ++i) {
    Eigen::MatrixXf::Index max_y, max_t, tmp;
    y.row(i).maxCoeff(&tmp, &max_y);
    t.row(i).maxCoeff(&tmp, &max_t);
    if(max_y == max_t) {
      total += 1.0;
    }
  }
  return total / y.rows();
}

class Layer {
public:
  Layer(std::size_t n_input, std::size_t n_output) {
    {
      W = Eigen::MatrixXf::Random(n_input, n_output);
      float max = W.maxCoeff();
      W /= (max * sqrt(static_cast<float>(n_input)));
    }
  }

  virtual Eigen::MatrixXf operator ()(Eigen::MatrixXf x) {
    return (x * W).unaryExpr(sigmoid);
  }

  virtual void update(Eigen::MatrixXf e, Eigen::MatrixXf x, Eigen::MatrixXf y, float lr) {
    Eigen::MatrixXf d_W = -x.transpose() * e;
    W += d_W * lr;
  }
protected:
  Eigen::MatrixXf W;
};

class DFALayer {
public:
  DFALayer(std::size_t n_input, std::size_t n_output, std::size_t n_final) {
    {
      W = Eigen::MatrixXf::Random(n_input, n_output);
      float max = W.maxCoeff();
      W /= (max * sqrt(static_cast<float>(n_input)));
    }
    {
      B = Eigen::MatrixXf::Random(n_final, n_output);
      float max = B.maxCoeff();
      B /= (max * sqrt(static_cast<float>(n_output)));
    }
  }

  virtual Eigen::MatrixXf operator ()(Eigen::MatrixXf x) {
    Eigen::MatrixXf y = (x * W).unaryExpr(sigmoid);
    Eigen::MatrixXf z = (y * W.transpose()).unaryExpr(sigmoid);
    error = mean_squared_error(x, z);
    {
      Eigen::MatrixXf d_h2 = x - z;
      Eigen::MatrixXf d_h1 = (d_h2 * W).array() * y.array() * (1 - y.array());
      Eigen::MatrixXf d_W = (x.transpose() * d_h1) + (d_h2.transpose() * y);
      W += d_W * 0.01;
    }
    return y;
  }

  virtual void update(Eigen::MatrixXf e, Eigen::MatrixXf x, Eigen::MatrixXf y, float lr) {
    Eigen::MatrixXf d_x = (e * B).array() * y.unaryExpr(dsigmoid).array();
    Eigen::MatrixXf d_W = -x.transpose() * d_x;
    W += d_W * lr;
  }

  const float& internal_error() const {
    return error;
  }
protected:
  float error;
  Eigen::MatrixXf W;
  Eigen::MatrixXf B;
};

class Autoencoder {
public:
  Autoencoder(std::size_t n_input, std::size_t n_output) {
    W = Eigen::MatrixXf::Random(n_input, n_output);
    float max = W.maxCoeff();
    W /= (max * sqrt(static_cast<float>(n_input)));
  }

  virtual Eigen::MatrixXf operator()(Eigen::MatrixXf input) {
    x = input;
    y = encode(input);
    z = decode(y);
    return z;
  }

  virtual Eigen::MatrixXf encode(Eigen::MatrixXf input) {
    return (input * W).unaryExpr(sigmoid);
  }

  virtual Eigen::MatrixXf decode(Eigen::MatrixXf input) {
    return (input * W.transpose()).unaryExpr(sigmoid);
  }

  virtual void update(float lr) {
    Eigen::MatrixXf d_h2 = x - z;
    Eigen::MatrixXf d_h1 = (d_h2 * W).array() * y.array() * (1 - y.array());
    Eigen::MatrixXf d_W = (x.transpose() * d_h1) + (d_h2.transpose() * y);
    W += d_W * lr;
  }
private:
  Eigen::MatrixXf x;
  Eigen::MatrixXf y;
  Eigen::MatrixXf z;
  Eigen::MatrixXf W;
};

template<std::size_t N>
class Accumulator : public brica2::core::Component {
public:
  Accumulator() : index(0) {
    make_in_port("input");
    make_in_port("label");
    for(std::size_t i = 0; i < N; ++i) {
      make_out_port("layer" + std::to_string(i));
    }
    make_out_port("loss");
    make_out_port("accuracy");
  }

  virtual brica2::core::Dictionary operator()(brica2::core::Dictionary& inputs) {
    brica2::core::Cargo input = inputs["input"];
    brica2::core::Cargo label = inputs["label"];

    brica2::core::Dictionary outputs;

    if(!input.empty() && !label.empty()) {
      Eigen::MatrixXf& x = input;
      Eigen::MatrixXf& y = label;
      Eigen::MatrixXf e = x - y;

      buffer[index] = brica2::core::Cargo(e);
      outputs["loss"] = brica2::core::Cargo(cross_entropy(input, label));
      outputs["accuracy"] = brica2::core::Cargo(accuracy(input, label));
      index += 1;
      index %= N;
      for(std::size_t i = 0; i < N; ++i) {
        outputs["layer" + std::to_string(i)] = brica2::core::Cargo(buffer[(index + i) % N]);
      }
    }
    return outputs;
  }
private:
  std::size_t index;
  std::array<brica2::core::Cargo, N> buffer;
};

class LayerComponent : public brica2::core::Component {
public:
  LayerComponent(std::size_t n_input, std::size_t n_output) : layer(n_input, n_output) {
    make_in_port("input");
    make_in_port("label");
    make_in_port("error");
    make_out_port("output");
    make_out_port("label");
  }

  virtual brica2::core::Dictionary operator()(brica2::core::Dictionary& inputs) {
    brica2::core::Cargo input = inputs["input"];
    brica2::core::Cargo label = inputs["label"];
    brica2::core::Cargo error = inputs["error"];

    brica2::core::Dictionary outputs;

    if(!error.empty()) {
      Eigen::MatrixXf& e = error;
      Eigen::MatrixXf& x = x_queue.front();
      Eigen::MatrixXf& y = y_queue.front();
      layer.update(e, x, y, 0.01);
      x_queue.pop();
      y_queue.pop();
    }

    if(!input.empty() && !label.empty()) {
      Eigen::MatrixXf& x = input;
      Eigen::MatrixXf y = layer(x);
      x_queue.push(x);
      y_queue.push(y);
      outputs["output"] = brica2::core::Cargo(y);
      outputs["label"] = label;
    }

    return outputs;
  }
private:
  std::queue<Eigen::MatrixXf> x_queue;
  std::queue<Eigen::MatrixXf> y_queue;
  Layer layer;
};

class DFALayerComponent : public brica2::core::Component {
public:
  DFALayerComponent(std::size_t n_input, std::size_t n_output, std::size_t n_final) : layer(n_input, n_output, n_final) {
    make_in_port("input");
    make_in_port("label");
    make_in_port("error");
    make_out_port("output");
    make_out_port("label");
    make_out_port("error");
  }

  virtual brica2::core::Dictionary operator()(brica2::core::Dictionary& inputs) {
    brica2::core::Cargo input = inputs["input"];
    brica2::core::Cargo label = inputs["label"];
    brica2::core::Cargo error = inputs["error"];

    brica2::core::Dictionary outputs;

    if(!error.empty()) {
      Eigen::MatrixXf& e = error;
      Eigen::MatrixXf& x = x_queue.front();
      Eigen::MatrixXf& y = y_queue.front();
      layer.update(e, x, y, 0.01);
      x_queue.pop();
      y_queue.pop();
    }

    if(!input.empty() && !label.empty()) {
      Eigen::MatrixXf& x = input;
      Eigen::MatrixXf y = layer(x);
      x_queue.push(x);
      y_queue.push(y);
      outputs["output"] = brica2::core::Cargo(y);
      outputs["label"] = label;
      outputs["error"] = brica2::core::Cargo(layer.internal_error());
    }

    return outputs;
  }
private:
  std::queue<Eigen::MatrixXf> x_queue;
  std::queue<Eigen::MatrixXf> y_queue;
  DFALayer layer;
};

std::string lname(std::size_t i) {
  return "layer" + std::to_string(i);
}

std::string ename(std::size_t i) {
  return "error" + std::to_string(i);
}

template<std::size_t N>
class DCDFA : public brica2::core::Module {
public:
  static constexpr std::size_t size = N;

  DCDFA(std::size_t n_input, std::size_t n_hidden, std::size_t n_output) {
    Accumulator<N + 1> accu;

    make_out_port("loss");
    make_out_port("accuracy");
    alias_out_port(accu, "loss", *this, "loss");
    alias_out_port(accu, "accuracy", *this, "accuracy");

    add_component("accumulator", accu);

    DFALayerComponent first(n_input, n_hidden, n_output);
    connect(accu, "layer0", first, "error");
    add_component("layer0", first);

    make_in_port("input");
    make_in_port("label");
    make_out_port("error0");
    alias_in_port(*this, "input", first, "input");
    alias_in_port(*this, "label", first, "label");
    alias_out_port(*this, "error0", first, "error");

    for(std::size_t i = 1; i < N; ++i) {
      DFALayerComponent prev = get_component<DFALayerComponent>(lname(i - 1));
      DFALayerComponent curr = DFALayerComponent(n_hidden, n_hidden, n_output);
      connect(prev, "output", curr, "input");
      connect(prev, "label",  curr, "label");
      connect(accu, lname(i), curr, "error");
      add_component(lname(i), curr);
      make_out_port(ename(i));
      alias_out_port(*this, ename(i), first, "error");
    }

    DFALayerComponent prev = get_component<DFALayerComponent>(lname(N - 1));
    LayerComponent last(n_hidden, n_output);
    connect(prev, "output", last, "input");
    connect(prev, "label",  last, "label");
    connect(last, "output", accu, "input");
    connect(last, "label",  accu, "label");
    connect(accu, lname(N), last, "error");
    add_component(lname(N), last);
  }
};

int main() {
  auto mnist = mnist::read_dataset<std::vector, std::vector, unsigned char, unsigned char>();

  std::vector<std::vector<unsigned char> > train_images = mnist.training_images;
  std::vector<unsigned char> train_labels = mnist.training_labels;

  std::vector<std::vector<unsigned char> > test_images = mnist.test_images;
  std::vector<unsigned char> test_labels = mnist.test_labels;

  std::size_t N_train = train_images.size();
  std::size_t N_test = test_images.size();
  std::size_t x_shape = train_images[0].size();
  std::size_t y_shape = 10;
  std::size_t n_epoch = 200;

  Eigen::MatrixXf x_train(N_train, x_shape);
  Eigen::MatrixXf y_train(N_train, y_shape);

  Eigen::MatrixXf x_test(N_test, x_shape);
  Eigen::MatrixXf y_test(N_test, y_shape);

  for(std::size_t i = 0; i < N_train; ++i) {
    for(std::size_t j = 0; j < x_shape; ++j) {
      x_train(i, j) = static_cast<float>(train_images[i][j]) / 255.0;
    }
    for(std::size_t j = 0; j < y_shape; ++j) {
      y_train(i, j) = train_labels[i] == j ? 1.0f : 0.0f;
    }
    if(i < N_test) {
      for(std::size_t j = 0; j < x_shape; ++j) {
        x_test(i, j) = static_cast<float>(test_images[i][j]) / 255.0;
      }
      for(std::size_t j = 0; j < y_shape; ++j) {
        y_test(i, j) = test_labels[i] == j ? 1.0f : 0.0f;
      }
    }
  }

  std::vector<std::size_t> perm;
  for(std::size_t i = 0; i < N_train; ++i) {
    perm.push_back(i);
  }

  std::size_t batchsize = 100;

  DCDFA<100> dcdfa(784, 240, 10);

  brica2::scheduler::VirtualTimeSyncScheduler s(dcdfa, 32);

  for(std::size_t epoch = 0; epoch < n_epoch; ++epoch) {
    std::cout << "Epoch: " << epoch + 1 << std::endl;
    std::random_shuffle(perm.begin(), perm.end());

    { /* Training */
      float acc = 0.0f;
      float loss = 0.0f;
      double time = 0.0;
      std::size_t count = 0;

      for(std::size_t i = 0; i < N_train; i += batchsize) {
        std::vector<std::size_t> indices(perm.begin() + i, perm.begin() + i + batchsize);

        Eigen::MatrixXf x(batchsize, x_shape);
        Eigen::MatrixXf t(batchsize, y_shape);

        for(std::size_t i = 0; i < batchsize; ++i) {
          x.row(i) = x_train.row(indices[i]);
          t.row(i) = y_train.row(indices[i]);
        }

        brica2::core::Cargo input = x;
        brica2::core::Cargo label = t;

        dcdfa.get_in_port("input").set_buffer(input);
        dcdfa.get_in_port("label").set_buffer(label);

        time = s.step();

        brica2::core::Cargo loss_cargo = dcdfa.get_out_port("loss").get_buffer();
        brica2::core::Cargo accuracy_cargo = dcdfa.get_out_port("accuracy").get_buffer();

        if(!loss_cargo.empty() && !accuracy_cargo.empty()) {
          loss += loss_cargo.get<float>();
          acc += accuracy_cargo.get<float>();
          ++count;
        }
      }
      std::cout << "Train\tLoss: " << std::setprecision(7) << loss / count << "\tAccuracy: " <<std::setprecision(4) <<  acc / count * 100  << "%" << std::endl;
    }
  }

  return 0;
}
