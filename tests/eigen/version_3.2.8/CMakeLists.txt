################################################################################
# Copyright (c) 2018 David D. Marshall <ddmarsha@calpoly.edu>
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# See LICENSE.md file in the project root for full license information.
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#    David D. Marshall - initial code and implementation
################################################################################
#
# - Test the FindEigen3_Local function
#

cmake_minimum_required(VERSION 3.0)

project(EIGEN3_V328_TEST
        LANGUAGES CXX)

# add the project specific cmake files to module path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
                      ${PROJECT_SOURCE_DIR}
                      ${PROJECT_SOURCE_DIR}/../../..)

# test finding eigen3
set(_e3_version "3.2.8")
find_package(Eigen3_Local ${_e3_version})

if (NOT EIGEN3_FOUND)
  message(FATAL_ERROR " Could not find Eigen3")
endif()

if (NOT (EIGEN3_VERSION VERSION_EQUAL _e3_version) )
  message(FATAL_ERROR " Found Eigen3 version ${EIGEN3_VERSION}"
                      " but wanted version ${_e3_version}")
endif()
message(STATUS "EIGEN3_FOUND=${EIGEN3_FOUND}")
message(STATUS "EIGEN3_INCLUDE_DIR=${EIGEN3_INCLUDE_DIR}")
message(STATUS "EIGEN3_VERSION=${EIGEN3_VERSION}")

