################################################################################
# Copyright (c) 2018 David D. Marshall <ddmarsha@calpoly.edu>
#
# All rights reserved. Licensed under the MIT License. See LICENSE file in the
# project root for full license information.
################################################################################

################################################################################
# Setup Google Test 
#   Instructions come from googletest README.md
################################################################################


# Only need to search if it hasn't already been found
if(NOT GTEST_FOUND)

  # try and find any version locally
  find_package(GTest ${GTest_Local_FIND_VERSION} QUIET)
  
  #
  # if couldn't find package using standard search then use local version
  #
  if (NOT GTEST_FOUND)
    #
    # parse out the version string to determine the precise version that is requested
    #
    set(GTEST_VERSION_LATEST   "1.8.0")
    set(GTEST_1_VERSION_LATEST "1.8.0")

    if (NOT DEFINED GTest_Local_FIND_VERSION)
      set(GTEST_VERSION_REQ "${GTEST_VERSION_LATEST}")
    elseif (GTest_Local_FIND_VERSION STREQUAL "1")
      set(GTEST_VERSION_REQ "${GTEST_VERSION_LATEST}")
    else()
      set(GTEST_VERSION_REQ "${GTest_Local_FIND_VERSION}")
    endif()

    #
    # determine the correct file name to be used for installation
    #
    set (GTEST_PACKAGE_FILENAME "${PROJECT_SOURCE_DIR}/cmake/external/googletest/googletest-release-${GTEST_VERSION_REQ}.tar.gz")
    set (GTEST_BINARY_DIR "${PROJECT_BINARY_DIR}/external/googletest/")
    if (NOT EXISTS ${GTEST_PACKAGE_FILENAME})
      if (NOT GTest_Local_FIND_QUIETLY)
        message(ERROR " Could not find GTest version ${GTEST_VERSION_REQ} that was requested")
      endif()
      set(GTEST_VERSION_OK false)
    else()
      set(GTEST_VERSION_OK true)
    endif()
    
    # configure the project
    if (GTEST_VERSION_OK)
      configure_file(cmake/googletest-CMakeLists.txt.in
                     ${GTEST_BINARY_DIR}/CMakeLists.txt)
      message(STATUS "Need to download specific version if asked")
      execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
                      RESULT_VARIABLE result
                      WORKING_DIRECTORY ${GTEST_BINARY_DIR})
      if(result)
        if (NOT GTest_Local_FIND_QUIETLY)
          message(ERROR " Configure step failed for googletest: ${result}")
        endif()
      else()
        # build project
        execute_process(COMMAND ${CMAKE_COMMAND} --build .
                        RESULT_VARIABLE result
                        WORKING_DIRECTORY ${GTEST_BINARY_DIR})
        if(result)
          if (NOT GTest_Local_FIND_QUIETLY)
            message(ERROR " Build step failed for googletest: ${result}")
          endif()
        else()
          set(GTEST_FOUND true)
          set(GTEST_INCLUDE_DIRS "${GTEST_BINARY_DIR}/src/googletest/googletest/include/")
          set(GTEST_LIBRARIES "${GTEST_BINARY_DIR}/src/googletest/googletest-build/libgtest.a")
          set(GTEST_MAIN_LIBRARIES "${GTEST_BINARY_DIR}/src/googletest/googletest-build/libgtest_main.a")
          set(GTEST_BOTH_LIBRARIES "${GTEST_BINARY_DIR}/src/googletest/googletest-build/libgtest.a")
          
          # Prevent overriding the parent project's compiler/linker
          # settings on Windows
          set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
          
          # Add googletest directly to our build. This defines
          # the gtest and gtest_main targets.
          add_subdirectory(${GTEST_BINARY_DIR}/src/googletest/googletest
                           ${GTEST_BINARY_DIR}/src/googletest/googletest-build
                           EXCLUDE_FROM_ALL)

          # The gtest/gtest_main targets carry header search path
          # dependencies automatically when using CMake 2.8.11 or
          # later. Otherwise we have to add them here ourselves.
          if (CMAKE_VERSION VERSION_LESS 2.8.11)
            include_directories("${gtest_SOURCE_DIR}/include")
          endif()
        endif()
      endif()
    endif()
  endif()

  # report the final results of the searches
#  include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest_Local DEFAULT_MSG GTEST_FOUND 
                                                            GTEST_INCLUDE_DIRS
                                                            GTEST_LIBRARIES
                                                            GTEST_MAIN_LIBRARIES
                                                            GTEST_BOTH_LIBRARIES)

endif()

