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
# - Test the FindGTest_Local function
#

cmake_minimum_required(VERSION 3.0)

project(GTEST_DEFAULT_TEST
        LANGUAGES CXX)

# add the project specific cmake files to module path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
                      ${PROJECT_SOURCE_DIR}
                      ${PROJECT_SOURCE_DIR}/../../..)

# test finding googletest
find_package(GTest_Local)

if (NOT GTEST_FOUND)
  message(FATAL_ERROR " Could not find googletest")
endif()

message(STATUS "GTEST_FOUND=${GTEST_FOUND}")
message(STATUS "GTEST_INCLUDE_DIRS=${GTEST_INCLUDE_DIRS}")
message(STATUS "GTEST_LIBRARIES=${GTEST_LIBRARIES}")
message(STATUS "GTEST_MAIN_LIBRARIES=${GTEST_MAIN_LIBRARIES}")
message(STATUS "GTEST_BOTH_LIBRARIES=${GTEST_BOTH_LIBRARIES}")

