# Install script for directory: /home/kotone/dfa/eigen/Eigen

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE FILE FILES
    "/home/kotone/dfa/eigen/Eigen/Core"
    "/home/kotone/dfa/eigen/Eigen/StdVector"
    "/home/kotone/dfa/eigen/Eigen/OrderingMethods"
    "/home/kotone/dfa/eigen/Eigen/Householder"
    "/home/kotone/dfa/eigen/Eigen/Eigen2Support"
    "/home/kotone/dfa/eigen/Eigen/Dense"
    "/home/kotone/dfa/eigen/Eigen/SparseCore"
    "/home/kotone/dfa/eigen/Eigen/SVD"
    "/home/kotone/dfa/eigen/Eigen/Eigen"
    "/home/kotone/dfa/eigen/Eigen/Array"
    "/home/kotone/dfa/eigen/Eigen/SPQRSupport"
    "/home/kotone/dfa/eigen/Eigen/Sparse"
    "/home/kotone/dfa/eigen/Eigen/Eigenvalues"
    "/home/kotone/dfa/eigen/Eigen/UmfPackSupport"
    "/home/kotone/dfa/eigen/Eigen/SparseCholesky"
    "/home/kotone/dfa/eigen/Eigen/StdDeque"
    "/home/kotone/dfa/eigen/Eigen/PardisoSupport"
    "/home/kotone/dfa/eigen/Eigen/SparseLU"
    "/home/kotone/dfa/eigen/Eigen/Geometry"
    "/home/kotone/dfa/eigen/Eigen/LU"
    "/home/kotone/dfa/eigen/Eigen/CholmodSupport"
    "/home/kotone/dfa/eigen/Eigen/StdList"
    "/home/kotone/dfa/eigen/Eigen/SuperLUSupport"
    "/home/kotone/dfa/eigen/Eigen/SparseQR"
    "/home/kotone/dfa/eigen/Eigen/QtAlignedMalloc"
    "/home/kotone/dfa/eigen/Eigen/MetisSupport"
    "/home/kotone/dfa/eigen/Eigen/Jacobi"
    "/home/kotone/dfa/eigen/Eigen/IterativeLinearSolvers"
    "/home/kotone/dfa/eigen/Eigen/LeastSquares"
    "/home/kotone/dfa/eigen/Eigen/QR"
    "/home/kotone/dfa/eigen/Eigen/Cholesky"
    "/home/kotone/dfa/eigen/Eigen/PaStiXSupport"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/kotone/dfa/eigen/build/Eigen/src/cmake_install.cmake")

endif()

