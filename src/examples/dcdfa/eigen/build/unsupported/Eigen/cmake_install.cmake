# Install script for directory: /home/kotone/dfa/eigen/unsupported/Eigen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/kotone")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/kotone/dfa/eigen/unsupported/Eigen/AdolcForward"
    "/home/kotone/dfa/eigen/unsupported/Eigen/AlignedVector3"
    "/home/kotone/dfa/eigen/unsupported/Eigen/ArpackSupport"
    "/home/kotone/dfa/eigen/unsupported/Eigen/AutoDiff"
    "/home/kotone/dfa/eigen/unsupported/Eigen/BVH"
    "/home/kotone/dfa/eigen/unsupported/Eigen/FFT"
    "/home/kotone/dfa/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/kotone/dfa/eigen/unsupported/Eigen/KroneckerProduct"
    "/home/kotone/dfa/eigen/unsupported/Eigen/LevenbergMarquardt"
    "/home/kotone/dfa/eigen/unsupported/Eigen/MatrixFunctions"
    "/home/kotone/dfa/eigen/unsupported/Eigen/MoreVectorization"
    "/home/kotone/dfa/eigen/unsupported/Eigen/MPRealSupport"
    "/home/kotone/dfa/eigen/unsupported/Eigen/NonLinearOptimization"
    "/home/kotone/dfa/eigen/unsupported/Eigen/NumericalDiff"
    "/home/kotone/dfa/eigen/unsupported/Eigen/OpenGLSupport"
    "/home/kotone/dfa/eigen/unsupported/Eigen/Polynomials"
    "/home/kotone/dfa/eigen/unsupported/Eigen/Skyline"
    "/home/kotone/dfa/eigen/unsupported/Eigen/SparseExtra"
    "/home/kotone/dfa/eigen/unsupported/Eigen/Splines"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/kotone/dfa/eigen/build/unsupported/Eigen/src/cmake_install.cmake")

endif()

