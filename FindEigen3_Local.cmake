################################################################################
# Copyright (c) 2015-2017 David D. Marshall <ddmarsha@calpoly.edu>
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#    David D. Marshall - initial code and implementation
################################################################################
#
# - Looks for particular version of Eigen3
#
# This module searches for a particular version of Eigen3 from the
# list of internal copies of the Eigen3 library. To use version 3.x.y
# of Eigen3 call:
#   find_package(Eigen 3.x.y)
# To use the latest version of Eigen3 call:
#   find_package(Eigen 3)
#
# This module will define the following variables:
#   EIGEN_FOUND - Eigen3 has been found and installed
#   EIGEN_INCLUDE_DIRS - directory holding the Eigen3 headers
#   EIGEN_VERSION - the version number found and installed

if(EIGEN3_INCLUDE_DIR)
  set(EIGEN3_FOUND TRUE)
else()
  #
  # parse out the version string to determine the precise version that is requested
  #
  set(EIGEN3_VERSION_LATEST   "3.3.2")
  set(EIGEN3_3_VERSION_LATEST "3.3.2")
  set(EIGEN3_2_VERSION_LATEST "3.2.10")
  set(EIGEN3_1_VERSION_LATEST "3.1.4")
  set(EIGEN3_0_VERSION_LATEST "3.0.7")

  if (NOT DEFINED Eigen3_Local_FIND_VERSION)
    set(EIGEN3_VERSION_REQ "${EIGEN3_VERSION_LATEST}")
  elseif (Eigen3_Local_FIND_VERSION STREQUAL "3")
    set(EIGEN3_VERSION_REQ "${EIGEN3_VERSION_LATEST}")
  elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.3")
    set(EIGEN3_VERSION_REQ "${EIGEN3_3_VERSION_LATEST}")
  elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.2")
    set(EIGEN3_VERSION_REQ "${EIGEN3_2_VERSION_LATEST}")
  elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.1")
    set(EIGEN3_VERSION_REQ "${EIGEN3_1_VERSION_LATEST}")
  elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.0")
    set(EIGEN3_VERSION_REQ "${EIGEN3_0_VERSION_LATEST}")
  else()
    set(EIGEN3_VERSION_REQ "${Eigen3_Local_FIND_VERSION}")
  endif()

  # determine the correct file name to be used for installation
  set (EIGEN3_PACKAGE_FILENAME "${ELI_SOURCE_DIR}/external/eigen/eigen-${EIGEN3_VERSION_REQ}.tar.gz")
  if (NOT EXISTS ${EIGEN3_PACKAGE_FILENAME})
    if (NOT Eigen3_Local_FIND_QUIETLY)
      message(ERROR " Could not find Eigen3 version ${EIGEN3_VERSION_REQ} that was requested")
    endif()
    set(EIGEN3_VERSION_OK false)
  else()
    set(EIGEN3_VERSION_OK true)
  endif()

  # if found source file to extract then create project
  if (EIGEN3_VERSION_OK)
    # install specified version of Eigen3
    include(ExternalProject)
    ExternalProject_Add(Eigen3
                        URL ${EIGEN3_PACKAGE_FILENAME}
                        PREFIX ${ELI_BINARY_DIR}/external/eigen3
                        CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
                                   -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
                                   -DCMAKE_CXX_FLAGS_DEBUG=${CMAKE_CXX_FLAGS_DEBUG}
                                   -DCMAKE_CXX_FLAGS_RELEASE=${CMAKE_CXX_FLAGS_RELEASE}
                                   -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
                                   -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
                                   -DCMAKE_C_FLAGS_DEBUG=${CMAKE_C_FLAGS_DEBUG}
                                   -DCMAKE_C_FLAGS_RELEASE=${CMAKE_C_FLAGS_RELEASE}
                                   -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER}
                                   -DCMAKE_Fortran_FLAGS=${CMAKE_Fortran_FLAGS}
                                   -DCMAKE_Fortran_FLAGS_DEBUG=${CMAKE_Fortran_FLAGS_DEBUG}
                                   -DCMAKE_Fortran_FLAGS_RELEASE=${CMAKE_Fortran_FLAGS_RELEASE}
                                   -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                                   -DCMAKE_INSTALL_PREFIX=${ELI_BINARY_DIR}/external/eigen3
                                   -Wno-dev
                        UPDATE_COMMAND ""
                        BUILD_COMMAND ""
                        INSTALL_COMMAND make install > /dev/null
                        )

    # Set the variables that are needed out of this
    ExternalProject_Get_Property(Eigen3 INSTALL_DIR)
    set(EIGEN3_INCLUDE_DIR ${INSTALL_DIR}/include/eigen3)
    set(EIGEN3_VERSION ${EIGEN3_VERSION_REQ})
  else()
    set(EIGEN3_INCLUDE_DIR "")
    set(EIGEN3_VERSION "")
  endif()

  # This will set the variable EIGEN3_FOUND to true/false. It also
  # handles the QUIETLY and REQUIRED arguments automatically.
  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(Eigen3 DEFAULT_MSG EIGEN3_INCLUDE_DIR EIGEN3_VERSION)

  mark_as_advanced(EIGEN3_INCLUDE_DIR)
endif()
