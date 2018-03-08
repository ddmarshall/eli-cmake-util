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
# - Looks for particular version of googletest
#
# This module searches for a particular version of googletest. First a 
# pre-installed version is searched for, if one isn't found (or it is not the 
# requested version), then a version from the list of internal copies of the 
# library is used. To use version x.y.z
# of googletest call:
#   find_package(GTest x.y.z)
# To use any version supported call:
#   find_package(GTest)
# To use the latest version of the version x releases call:
#   find_package(GTest x)
# Similarly to use the latest version of the version x.y releases call:
#   find_package(GTest x.y)
#
# This module will define the same variables that the FindGTest module defines.
# Specifically the following variables are defined:
#   GTEST_FOUND          - TRUE if found requested version else FALSE 
#   GTEST_INCLUDE_DIRS   - all directories containing the header files
#   GTEST_LIBRARIES      - libraries that do not contain the default 
#                          main() function.
#   GTEST_MAIN_LIBRARIES - libraries containing the main() function for link
#                          phase when relying on googletest to provide it
#   GTEST_BOTH_LIBRARIES - all libraries needed for link phase of build
#                          (contains both GTEST_MAIN_LIBRARIES and
#                          GTEST_LIBRARIES)
#
# The initial implementation came from the googletest README.md instructions 
################################################################################

cmake_minimum_required(VERSION 3.1)

#
# Only need to search if it hasn't already been found
#
if(NOT GTEST_FOUND)
  #
  # determine the location of this file
  #
  set(_this_dir "${CMAKE_CURRENT_LIST_DIR}")

  #
  # include required functions
  #
  include(${_this_dir}/check_version_req.cmake)
  include(${_this_dir}/parse_version.cmake)
  include(ExternalProject)

  #
  # set the hash information
  #
  set(GTEST_SHA512_180 "1dbece324473e53a83a60601b02c92c089f5d314761351974e097b2cf4d24af4296f9eb8653b6b03b1e363d9c5f793897acae1f0c7ac40149216035c4d395d9d")

  #
  # set the general versions
  #
  set(GTEST_VERSION_LATEST    "1.8.0")
  set(GTEST_1_VERSION_LATEST  "1.8.0")
  set(GTEST_18_VERSION_LATEST "1.8.0")

  #
  # figure out what the user wants
  #
  if (DEFINED  GTest_Local_VERSION_REQ)
    CHECK_VERSION_REQ(_gtest_local_use ${GTest_Local_FIND_VERSION})
  else()
    set(_gtest_local_use 0)
  endif()
  
  #
  # determine which version to pass into find_package()
  #
  if (_gtest_local_use EQUAL -1)
    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest_Local DEFAULT_MSG GTEST_FOUND 
                                                              GTEST_VERSION
                                                              GTEST_INCLUDE_DIRS
                                                              GTEST_LIBRARIES
                                                              GTEST_MAIN_LIBRARIES
                                                              GTEST_BOTH_LIBRARIES)
    return()
  elseif (_gtest_local_use EQUAL 0)
    set(_gtest_version "")
  elseif (_gtest_local_use EQUAL 1)
    set(_gtest_version ${GTEST_VERSION_LATEST})
  elseif (_gtest_local_use EQUAL 2)
    if (GTest_Local_FIND_VERSION STREQUAL "1")
      set(_gtest_version ${GTEST_1_VERSION_LATEST})
    elseif (GTest_Local_FIND_VERSION STREQUAL "1.8")
      set(_gtest_version ${GTEST_18_VERSION_LATEST})
    else()
      set(_gtest_version ${GTest_Local_FIND_VERSION})
    endif()
  else()
    message(FATAL_ERROR " Unknown GTest version ->${GTest_Local_FIND_VERSION}<- requested.")
  endif()

  #
  # try and find the system installed version requested
  #
  if (_gtest_version)
    find_package(GTest ${_gtest_version} EXACT QUIET)
  else()
    find_package(GTest QUIET)
  endif()

  #
  # if found package using standard search then add default targets
  #
  if (GTEST_FOUND)
    add_custom_target(gtest)
    add_custom_target(gtest_main)
    
    message(ERROR "Need to determine what version number was found.")
  #
  # else couldn't find package using standard search then use local version
  #
  else()
    set(GTEST_FOUND false)
    unset(GTEST_VERSION)
    unset(GTEST_INCLUDE_DIRS)
    unset(GTEST_LIBRARIES)
    unset(GTEST_MAIN_LIBRARIES)
    unset(GTEST_BOTH_LIBRARIES)

    #
    # if user did specify desired version and we need to use our own,
    # use the latest version
    #
    if (_gtest_local_use EQUAL 0)
      set(_gtest_version ${GTEST_VERSION_LATEST})
    endif()

    #
    # parse the version to set the correct hash value
    #
    PARSE_VERSION(gtest_req ${_gtest_version})
    if (gtest_req_MAJOR_VERSION EQUAL 1)
      if (gtest_req_MINOR_VERSION EQUAL 8)
        if (gtest_req_PATCH_VERSION EQUAL 0)
          set(_gtest_sha512  ${GTEST_SHA512_180})
        else()
          message(FATAL_ERROR " Unknown GTest vesion ->${_gtest_version}<- for hash setting.")
        endif()
      else()
        message(FATAL_ERROR " Unknown GTest vesion ->${_gtest_version}<- for hash setting.")
      endif()
    else()
      message(FATAL_ERROR " Unknown GTest vesion ->${_gtest_version}<- for hash setting.")
    endif()

    #
    # setup the items needed to build local version
    #
    set (GTEST_PACKAGE_FILENAME "${_this_dir}/external/googletest/googletest-release-${_gtest_version}.tar.gz")
    set (GTEST_BINARY_DIR "${PROJECT_BINARY_DIR}/external/googletest")
    if (NOT EXISTS ${GTEST_PACKAGE_FILENAME})
      if (NOT GTest_Local_FIND_QUIETLY)
        message(ERROR " Could not find GTest version ${_gtest_version}"
                      " that was requested")
      endif()
      set(GTEST_VERSION_OK false)
    else()
      set(GTEST_VERSION_OK true)
    endif()

    #
    # configure the project
    #
    if (GTEST_VERSION_OK)
      ExternalProject_Add(googletest
                          URL             ${GTEST_PACKAGE_FILENAME}
                          PREFIX          ${GTEST_BINARY_DIR}
                          URL_HASH SHA512=${_gtest_sha512}
                          CMAKE_ARGS      -DCMAKE_INSTALL_PREFIX=${GTEST_BINARY_DIR}
                                          -DCMAKE_INSTALL_MESSAGE=NEVER
                                          -Wno-dev
                          INSTALL_COMMAND ${CMAKE_COMMAND} 
                                          --build ${GTEST_BINARY_DIR}/src/googletest-build
                                          --target install)

      #
      # set the variables that are needed out of this
      #
      ExternalProject_Get_Property(googletest INSTALL_DIR)
      set(GTEST_FOUND true)
      set(GTEST_VERSION ${_gtest_version})
      set(GTEST_INCLUDE_DIRS "${INSTALL_DIR}/include/")
      set(GTEST_LIBRARIES "${INSTALL_DIR}/lib/libgtest.a")
      set(GTEST_MAIN_LIBRARIES "${INSTALL_DIR}/lib/libgtest_main.a")
      set(GTEST_BOTH_LIBRARIES "${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES}")

      #
      # Prevent overriding the parent project's compiler/linker
      # settings on Windows
      #
      set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    endif()
  endif()

  if (NOT GTest_Local_FIND_QUIETLY)
    message(STATUS "Found GTest: ${_gtest_version}")
    set(GTest_Local_FIND_QUIETLY true)
  endif()
  
  #
  # report the final results of the searches
  #
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest_Local DEFAULT_MSG GTEST_FOUND
                                                            GTEST_VERSION
                                                            GTEST_INCLUDE_DIRS
                                                            GTEST_LIBRARIES
                                                            GTEST_MAIN_LIBRARIES
                                                            GTEST_BOTH_LIBRARIES)

endif()

