include_directories(eigen)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/external)
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIR})

file(COPY mnist DESTINATION ${CMAKE_BINARY_DIR})

include_directories("mnist/include")

add_executable(dcdfa dcdfa.cpp)
target_link_libraries(dcdfa brica2-core brica2-scheduler ${CMAKE_THREAD_LIBS_INIT} ${OpenCV_LIBS})
