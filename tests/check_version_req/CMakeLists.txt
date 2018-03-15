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
# - Test the check_version_req function
#

cmake_minimum_required(VERSION 3.0)

project(CHECK_VERSION_REQ_TEST
        LANGUAGES CXX)

# add the project specific cmake files to module path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
                      ${PROJECT_SOURCE_DIR}
                      ${PROJECT_SOURCE_DIR}/../..)

# include the function
include(${PROJECT_SOURCE_DIR}/../../check_version_req.cmake)

#
# test passing special string
#
set(TEST_VERSION_STRING "none")
set(TEST_RESPONSE_FLAG -1)

CHECK_VERSION_REQ(cvr ${TEST_VERSION_STRING})
if ( NOT (TEST_RESPONSE_FLAG EQUAL cvr) )
  message(ERROR " For value ${TEST_VERSION_STRING}"
                " expected ${TEST_RESPONSE_FLAG} but got ${cvr}")
else()
  message(STATUS "Received correct"
                 " flag for ${TEST_VERSION_STRING}")
endif()

#
# test passing special string
#
set(TEST_VERSION_STRING "System")
set(TEST_RESPONSE_FLAG 0)

CHECK_VERSION_REQ(cvr ${TEST_VERSION_STRING})
if ( NOT (TEST_RESPONSE_FLAG EQUAL cvr) )
  message(ERROR " For value ${TEST_VERSION_STRING}"
                " expected ${TEST_RESPONSE_FLAG} but got ${cvr}")
else()
  message(STATUS "Received correct flag for ${TEST_VERSION_STRING}")
endif()

#
# test passing special string
#
set(TEST_VERSION_STRING "LATEST")
set(TEST_RESPONSE_FLAG 1)

CHECK_VERSION_REQ(cvr ${TEST_VERSION_STRING})
if ( NOT (TEST_RESPONSE_FLAG EQUAL cvr) )
  message(ERROR " For value ${TEST_VERSION_STRING}"
                " expected ${TEST_RESPONSE_FLAG} but got ${cvr}")
else()
  message(STATUS "Received correct flag for ${TEST_VERSION_STRING}")
endif()

#
# test passing version-like string
#
set(TEST_VERSION_STRING "2018.08.12")
set(TEST_RESPONSE_FLAG 2)

CHECK_VERSION_REQ(cvr ${TEST_VERSION_STRING})
if ( NOT (TEST_RESPONSE_FLAG EQUAL cvr) )
  message(ERROR " For value ${TEST_VERSION_STRING}"
                " expected ${TEST_RESPONSE_FLAG} but got ${cvr}")
else()
  message(STATUS "Received correct flag for ${TEST_VERSION_STRING}")
endif()

