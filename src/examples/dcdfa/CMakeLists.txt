include_directories(eigen)

file(COPY mnist DESTINATION ${CMAKE_BINARY_DIR})

include_directories("mnist/include")

add_executable(dcdfa dcdfa.cpp)
target_link_libraries(dcdfa brica2-core brica2-scheduler ${CMAKE_THREAD_LIBS_INIT})
