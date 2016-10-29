# Install script for directory: /home/kotone/dfa/eigen/Eigen/src/Geometry

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen/src/Geometry" TYPE FILE FILES
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Scaling.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/EulerAngles.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/ParametrizedLine.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Hyperplane.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/RotationBase.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Translation.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Transform.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/AlignedBox.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/OrthoMethods.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Umeyama.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Homogeneous.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/AngleAxis.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Rotation2D.h"
    "/home/kotone/dfa/eigen/Eigen/src/Geometry/Quaternion.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/kotone/dfa/eigen/build/Eigen/src/Geometry/arch/cmake_install.cmake")

endif()

