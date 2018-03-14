################################################################################
# Copyright (c) 2015-2018 David D. Marshall <ddmarsha@calpoly.edu>
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
# - Looks for particular version of Eigen3
#
# This module searches for a particular version of Eigen3. First a 
# pre-installed version is searched for, if one isn't found (or it is not the 
# requested version), then a version from the list of internal copies of the 
# library is used. To use version 3.x.y
# of googletest call:
#   find_package(Eigen3 3.x.y)
# To use any version supported call:
#   find_package(Eigen3)
# To use the latest version of the version 3.x releases call:
#   find_package(Eigen3 3.x)
#
# This module will define the same variables that the FindEigen3 module defines.
# Specifically the following variables are defined:
#   EIGEN3_FOUND           - TRUE if found requested version else FALSE
#   EIGEN3_INCLUDE_DIRS    - all directories containing the header files
#   EIGEN3_VERSION         - the version number found and using
#   EIGEN3_DEPENDENCY_NAME - name of dependency for this project

cmake_minimum_required(VERSION 3.1)

#
# Only need to search if it hasn't already been found
#
if(NOT EIGEN3_FOUND)
  #
  # determine the location of this file
  #
  set(_this_dir "${CMAKE_CURRENT_LIST_DIR}")

  #
  # set the name of the dependency
  #
  set(EIGEN3_DEPENDENCY_NAME Eigen3)

  #
  # include required functions
  #
  include(${_this_dir}/check_version_req.cmake)
  include(${_this_dir}/parse_version.cmake)
  include(FindPackageHandleStandardArgs)
  include(ExternalProject)

  #
  # set the hash information
  #
  set(EIGEN3_SHA512_306 "babaee894b929b3d899448ace1d207f36eb6a72a50b9d88c954f2e82ae857772caed60334d6fbf5c68b674203dc82311ebbe1a6eed95afb01df2de6550eed0a3")
  set(EIGEN3_SHA512_307 "b89ce9a82b3b3c45685b74ce067cb070980dc695cdcd4416d04d32e450cf0e7f30932c0cbefe6b7c6bf08d111772e6fe2686ef1962bfba88f4a5cbfc3643ab36")
  set(EIGEN3_SHA512_310 "0e1531c7164bea5e6a80e1f16d75286df709a40eb521a04cd069c1b59a23de6ff05127830d0b5a789c217b61eaad2ec985dda25c63dd607796ee13ffd2e55ee0")
  set(EIGEN3_SHA512_311 "5388e2df9bcb7080e401db5558d45bb775c1a246b22c395920c17bafeade427cb54721230f196f484eb8bdc618a1c6d6a8f748dd6753de02eb02f0c625cb7bdb")
  set(EIGEN3_SHA512_312 "ff5f3a20aa05a791e33ae752032b8d90e06081d7e7a943e786c69d4cd56d6508f671d612057429d3680bb4e41f1d9b8d152ea016977babf486310f138a5ef3ec")
  set(EIGEN3_SHA512_313 "970da0bb26de6fc18d08788d22b27752eacd733da7e48058738602d0015113eb19c1d17f7ba6818d1a807a8710de3f2f206b4bbe4838ac34febec5a9382d8d44")
  set(EIGEN3_SHA512_314 "a6b9cb3d1417c5774025de365aa39c9c974f9acacab4678576f36353de184bba2fa525883271499bfbc365d02c107f8732b1975963f93be561e4b205173121d8")
  set(EIGEN3_SHA512_320 "f2c69d77f078f4ca5d8f03eafc87548709b86b93b2121df26a77674228a71e89bab22b64f3f96549d5a2feaee626e6ad5701cdbb021a4966b71b20a41709bf40")
  set(EIGEN3_SHA512_321 "4e89af28801f0a8f8e4ecb6d228d246f84b44e611dfd7e9cd383f8488002916551f7493b517c37f90214d50d35603628f5b09d07d546e1ed3b6f62320f467a9f")
  set(EIGEN3_SHA512_322 "39ce0846bfdfc1c2789779f07b0e6b877040b3e69cd75ea3afd9dc0627e301488797870bafd4378ecd3cdfc3ddc49949577f24d2e372e5f13eeaa5492d506539")
  set(EIGEN3_SHA512_323 "00f1d473d42e0fd030e8b58d3e20e3fc98832b33440ca8fd6a4e50b8b143d42c490c2cd0ffbf89a325066efff174f6185194c78a36671a38a59bf125a0c5a0c4")
  set(EIGEN3_SHA512_324 "f6dd5cd6807394aa09bfeeeee995d5dbd797232013faf1fcef40adefa658be28a34a06e9b1d19a38ecce79d4d7c104805b207db0cf8d14440ab50055a762ee0c")
  set(EIGEN3_SHA512_325 "79333c7e29ab9468405d9e648c785241a6711ec834f4a6cc2d35dac6e6027767ccab74973797a098770c0204e6cdf33675e27decd72d365c26d30c8ce06cda3a")
  set(EIGEN3_SHA512_326 "c9e59700fbf3b925e0d5b5e8638ba7f8574612495612c413258f84dd019dd22ce0928f2292c14d5f0bd211549edf25a4ff5c208a1dc34375747f1c710eed7295")
  set(EIGEN3_SHA512_327 "77b7cd32476cde45d4a4cd5524cd6b61dd54259f18b2a044d7b185ca073aea992b0b9d799995306e4041e537e8e08beea20aa1cc5a02eba693931bf35c1d47ae")
  set(EIGEN3_SHA512_328 "be52b81de726938e81ad4d2ef6d65e8d3ee9dc70038f22a4fd0b5df98bd2d4a4d1bc5f78e6580e81abaff389b8003f9239b0e1476f93ee9236c946ae215896b7")
  set(EIGEN3_SHA512_329 "bf669ec777ce4756ad6033e21bcf5d490cd3488159913fc24a08019fc59aed3e2b55a5732cfd66d88d72eedf939b26f71366d5ade1e9c6ed6bf765da5639c3fa")
  set(EIGEN3_SHA512_3210 "d494995d5e5a264147141e84fda754950dcb41c6eff94ef3bf14411d8e3eaad4376bc3f634a5edcaa5f13c8be1d845784071f5b181e267c8fad9982fdb1a2d37")
  set(EIGEN3_SHA512_330 "3a3580a5a63a1ab8a5dd5e894bb6acd04d2061189d01080087f011e0fa3f76c098aa9a072a6b055a091d10d9a328d1ecafc683bd210ae753dbc1ac8ef36b538e")
  set(EIGEN3_SHA512_331 "83148ccaed08fcd48706f0c73a75b1fa4e3263bd1362a90797f8763b60646ae1a6d6bb1d51eaf477a54db7a428e8c4a71d1c2648628b348e53b6c8486422d650")
  set(EIGEN3_SHA512_332 "d14b9d7ba76bd4d12589d926c05ddf0fb58e89982c262424d15d7ad3af06dbaaa86994371725cad8d5b41211d6352dcb68ca561e76f9ed9260bb196356ccf792")
  set(EIGEN3_SHA512_333 "72f42584ed6ea8178c84eded59327254b3143acd65237a6faafc777f262aca4d0ebb44fd3d134b65558deec1136df83751dc1e4c8b78260291e08e03d0fdaf52")
  set(EIGEN3_SHA512_334 "4077a5c3b95e3573774ccd3fe6c7233cb4b83db2358c19b43ea796925bd0201451d8632bddc5d68b1b57bbf67c5473a8908926eed065a745689a2acec9711d5c")

  #
  # set the general versions
  #
  set(EIGEN3_VERSION_LATEST   "3.3.4")
  set(EIGEN3_3_VERSION_LATEST "3.3.4")
  set(EIGEN3_2_VERSION_LATEST "3.2.10")
  set(EIGEN3_1_VERSION_LATEST "3.1.4")
  set(EIGEN3_0_VERSION_LATEST "3.0.7")

  #
  # figure out what the user wants
  #
  if (DEFINED  Eigen3_Local_FIND_VERSION)
    CHECK_VERSION_REQ(_eigen3_local_use ${Eigen3_Local_FIND_VERSION})
  else()
    set(_eigen3_local_use 0)
  endif()
  
  #
  # determine which version to pass into find_package()
  #
  if (_eigen3_local_use EQUAL -1)
    find_package_handle_standard_args(Eigen3 DEFAULT_MSG EIGEN3_FOUND
                                                         EIGEN3_INCLUDE_DIR 
                                                         EIGEN3_VERSION
                                                         EIGEN3_DEPENDENCY_NAME)
    return()
  elseif (_eigen3_local_use EQUAL 0)
    set(_eigen3_version "")
  elseif (_eigen3_local_use EQUAL 1)
    set(_eigen3_version ${EIGEN3_VERSION_LATEST})
  elseif (_eigen3_local_use EQUAL 2)
    if (Eigen3_Local_FIND_VERSION STREQUAL "3")
      set(_eigen3_version ${EIGEN3_VERSION_LATEST})
    elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.0")
      set(_eigen3_version ${EIGEN3_0_VERSION_LATEST})
    elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.1")
      set(_eigen3_version ${EIGEN3_1_VERSION_LATEST})
    elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.2")
      set(_eigen3_version ${EIGEN3_2_VERSION_LATEST})
    elseif (Eigen3_Local_FIND_VERSION STREQUAL "3.3")
      set(_eigen3_version ${EIGEN3_3_VERSION_LATEST})
    else()
      set(_eigen3_version ${Eigen3_Local_FIND_VERSION})
    endif()
  else()
    message(FATAL_ERROR " Unknown Eigen3 version ->${Eigen3_Local_FIND_VERSION}<- requested.")
  endif()

  #
  # try and find the system installed version requested
  #
  if (_eigen3_version)
    find_package(Eigen3 ${_eigen3_version} EXACT QUIET)
  else()
    find_package(Eigen3 QUIET)
  endif()

  #
  # if found package using standard search then add dummy target
  #
  if (EIGEN3_FOUND)
    add_custom_target(${EIGEN3_DEPENDENCY_NAME})
  #
  # else couldn't find package using standard search then use local version
  #
  else()
    set(EIGEN3_FOUND false)
    unset(EIGEN3_INCLUDE_DIRS)
    unset(EIGEN3_VERSION)

    #
    # if user did specify desired version and we need to use our own,
    # use the latest version
    #
    if (_eigen3_local_use EQUAL 0)
      set(_eigen3_version ${EIGEN3_VERSION_LATEST})
    endif()

    #
    # parse the version to set the correct hash value
    #
    PARSE_VERSION(eigen3_req ${_eigen3_version})
    if (eigen3_req_MAJOR_VERSION EQUAL 3)
      if (eigen3_req_MINOR_VERSION EQUAL 0)
        if (eigen3_req_PATCH_VERSION EQUAL 6)
          set(_eigen3_sha512  ${EIGEN3_SHA512_306})
        elseif (eigen3_req_PATCH_VERSION EQUAL 7)
          set(_eigen3_sha512  ${EIGEN3_SHA512_307})
        else()
          message(FATAL_ERROR " Unknown Eigen3 vesion ->${_eigen3_version}<- for hash setting.")
        endif()
      elseif (eigen3_req_MINOR_VERSION EQUAL 1)
        if (eigen3_req_PATCH_VERSION EQUAL 0)
          set(_eigen3_sha512  ${EIGEN3_SHA512_310})
        elseif (eigen3_req_PATCH_VERSION EQUAL 1)
          set(_eigen3_sha512  ${EIGEN3_SHA512_311})
        elseif (eigen3_req_PATCH_VERSION EQUAL 2)
          set(_eigen3_sha512  ${EIGEN3_SHA512_312})
        elseif (eigen3_req_PATCH_VERSION EQUAL 3)
          set(_eigen3_sha512  ${EIGEN3_SHA512_313})
        elseif (eigen3_req_PATCH_VERSION EQUAL 4)
          set(_eigen3_sha512  ${EIGEN3_SHA512_314})
        else()
          message(FATAL_ERROR " Unknown Eigen3 vesion ->${_eigen3_version}<- for hash setting.")
        endif()
      elseif (eigen3_req_MINOR_VERSION EQUAL 2)
        if (eigen3_req_PATCH_VERSION EQUAL 0)
          set(_eigen3_sha512  ${EIGEN3_SHA512_320})
        elseif (eigen3_req_PATCH_VERSION EQUAL 1)
          set(_eigen3_sha512  ${EIGEN3_SHA512_321})
        elseif (eigen3_req_PATCH_VERSION EQUAL 2)
          set(_eigen3_sha512  ${EIGEN3_SHA512_322})
        elseif (eigen3_req_PATCH_VERSION EQUAL 3)
          set(_eigen3_sha512  ${EIGEN3_SHA512_323})
        elseif (eigen3_req_PATCH_VERSION EQUAL 4)
          set(_eigen3_sha512  ${EIGEN3_SHA512_324})
        elseif (eigen3_req_PATCH_VERSION EQUAL 5)
          set(_eigen3_sha512  ${EIGEN3_SHA512_325})
        elseif (eigen3_req_PATCH_VERSION EQUAL 6)
          set(_eigen3_sha512  ${EIGEN3_SHA512_326})
        elseif (eigen3_req_PATCH_VERSION EQUAL 7)
          set(_eigen3_sha512  ${EIGEN3_SHA512_327})
        elseif (eigen3_req_PATCH_VERSION EQUAL 8)
          set(_eigen3_sha512  ${EIGEN3_SHA512_328})
        elseif (eigen3_req_PATCH_VERSION EQUAL 9)
          set(_eigen3_sha512  ${EIGEN3_SHA512_329})
        elseif (eigen3_req_PATCH_VERSION EQUAL 10)
          set(_eigen3_sha512  ${EIGEN3_SHA512_3210})
        else()
          message(FATAL_ERROR " Unknown Eigen3 vesion ->${_eigen3_version}<- for hash setting.")
        endif()
      elseif (eigen3_req_MINOR_VERSION EQUAL 3)
        if (eigen3_req_PATCH_VERSION EQUAL 0)
          set(_eigen3_sha512  ${EIGEN3_SHA512_330})
        elseif (eigen3_req_PATCH_VERSION EQUAL 1)
          set(_eigen3_sha512  ${EIGEN3_SHA512_331})
        elseif (eigen3_req_PATCH_VERSION EQUAL 2)
          set(_eigen3_sha512  ${EIGEN3_SHA512_332})
        elseif (eigen3_req_PATCH_VERSION EQUAL 3)
          set(_eigen3_sha512  ${EIGEN3_SHA512_333})
        elseif (eigen3_req_PATCH_VERSION EQUAL 4)
          set(_eigen3_sha512  ${EIGEN3_SHA512_334})
        else()
          message(FATAL_ERROR " Unknown Eigen3 vesion ->${_eigen3_version}<- for hash setting.")
        endif()
      else()
        message(FATAL_ERROR " Unknown Eigen3 vesion ->${_eigen3_version}<- for hash setting.")
      endif()
    else()
      message(FATAL_ERROR " Unknown Eigen3 vesion ->${_eigen3_version}<- for hash setting.")
    endif()
      
    #
    # setup the items needed to build local version
    #
    set (EIGEN3_PACKAGE_FILENAME "${_this_dir}/external/eigen/eigen-${_eigen3_version}.tar.gz")
    set (EIGEN3_BINARY_DIR "${PROJECT_BINARY_DIR}/external/eigen")
    if (NOT EXISTS ${EIGEN3_PACKAGE_FILENAME})
      if (NOT Eigen3_Local_FIND_QUIETLY)
        message(ERROR " Could not find Eigen3 version ${_eigen3_version}"
                      " that was requested")
      endif()
      set(EIGEN3_VERSION_OK false)
    else()
      set(EIGEN3_VERSION_OK true)
    endif()

    #
    # configure the project
    #
    if (EIGEN3_VERSION_OK)
      ExternalProject_Add(${EIGEN3_DEPENDENCY_NAME}
                          URL             ${EIGEN3_PACKAGE_FILENAME}
                          PREFIX          ${EIGEN3_BINARY_DIR}
                          URL_HASH SHA512=${_eigen3_sha512}
                          CMAKE_ARGS      -DCMAKE_INSTALL_PREFIX=${EIGEN3_BINARY_DIR}
                                          -DCMAKE_INSTALL_MESSAGE=NEVER
                                          -Wno-dev
                          INSTALL_COMMAND ${CMAKE_COMMAND}
                                          --build ${EIGEN3_BINARY_DIR}/src/Eigen3-build
                                          --target install)

      #
      # Set the variables that are needed out of this
      #
      ExternalProject_Get_Property(Eigen3 INSTALL_DIR)
      set(EIGEN3_FOUND true)
      set(EIGEN3_INCLUDE_DIR ${INSTALL_DIR}/include/eigen3)
      set(EIGEN3_VERSION ${_eigen3_version})
    endif()
  endif()

  #
  # report the final results of the searches
  # This will set the variable EIGEN3_FOUND to true/false. It also
  # handles the QUIETLY and REQUIRED arguments automatically.
  #
  find_package_handle_standard_args(Eigen3 DEFAULT_MSG EIGEN3_VERSION
                                                       EIGEN3_FOUND
                                                       EIGEN3_INCLUDE_DIR
                                                       EIGEN3_DEPENDENCY_NAME)
endif()
