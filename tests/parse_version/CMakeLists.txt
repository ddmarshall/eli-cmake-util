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
# - Test the parse_version function
#

cmake_minimum_required(VERSION 3.0)

# add the project specific cmake files to module path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
                      ${PROJECT_SOURCE_DIR}
                      ${PROJECT_SOURCE_DIR}/..)

# include the function
include(${PROJECT_SOURCE_DIR}/../parse_version.cmake)

#
# test passing 3 number version
#
set(TEST_VERSION_STRING 3.10.11)
set(TEST_MAJOR_VERSION 3)
set(TEST_MINOR_VERSION 10)
set(TEST_PATCH_VERSION 11)

PARSE_VERSION(major_out_ minor_out_ patch_out_ ${TEST_VERSION_STRING})
if ( NOT (TEST_MAJOR_VERSION EQUAL major_out_)
  OR NOT (TEST_MINOR_VERSION EQUAL minor_out_)
  OR NOT (TEST_PATCH_VERSION EQUAL patch_out_) )
  message(ERROR " Expected ${TEST_VERSION_STRING}"
                " but got ${major_out_}.${minor_out_}.${patch_out_}")
else()
  message(STATUS " Received correct parsed version ${TEST_VERSION_STRING}")
endif()

#
# test passing 2 number version
#
set(TEST_VERSION_STRING 4.123)
set(TEST_MAJOR_VERSION 4)
set(TEST_MINOR_VERSION 123)
set(TEST_PATCH_VERSION "")

PARSE_VERSION(major_out_ minor_out_ patch_out_ ${TEST_VERSION_STRING})
if (patch_out_)
  message(ERROR " Patch version received was ${patch_out_}"
                " but should not have been set")
endif()

if ( NOT (TEST_MAJOR_VERSION EQUAL major_out_)
  OR NOT (TEST_MINOR_VERSION EQUAL minor_out_) )
  message(ERROR " Expected ${TEST_VERSION_STRING}"
                " but got ${major_out_}.${minor_out_}")
else()
  message(STATUS " Received correct parsed version ${TEST_VERSION_STRING}")
endif()

#
# test passing 1 number version
#
set(TEST_VERSION_STRING 20180120)
set(TEST_MAJOR_VERSION 20180120)
set(TEST_MINOR_VERSION "")
set(TEST_PATCH_VERSION "")

PARSE_VERSION(major_out_ minor_out_ patch_out_ ${TEST_VERSION_STRING})
if (minor_out_)
  message(ERROR " Minor version received was ${minor_out_}"
                " but should not have been set")
endif()
if (patch_out_)
  message(ERROR " Patch version received was ${patch_out_}"
                " but should not have been set")
endif()

if ( NOT (TEST_MAJOR_VERSION EQUAL major_out_) )
  message(ERROR " Expected ${TEST_VERSION_STRING} but got ${major_out_}")
else()
  message(STATUS " Received correct parsed version ${TEST_VERSION_STRING}")
endif()

