# DCDFA
BriCA2 code tweaked for Decoupled Direct Feedback Alignment (DCDFA) training.

## Usage
```
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -Dtest=true ..
make
./src/examples/dcdfa/dcdfa
```

## About DCDFA
Decoupled direct feedback alignment is an algorithm for training deep neural
networks. Each layer is trained in a semi-supervised fashion by autoencoding
each input fed and performing direct feedback alignment using errors fed back
from the output layer. Individual layers can be trained in a concurrent manner
thus 'decoupled' from the rest of the network. An example included in this
repository demonstrates the parallel training of a 100 layer fully-connected
neural network implemented atop the BriCA2 framework.
