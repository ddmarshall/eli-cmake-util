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
# - Enables C++ Language version for compiler
#
#   This function simplifies the setting of the compiler flag needed for a 
#   particular C++ language version. User passes in the variable name to store 
#   the compiler flag and the desired version number.
#   * flag_name_ - the name of the variable that the required compiler flag 
#                  needs to be stored if successful. If unsuccessful then the 
#                  variable will contain "NOT_FOUND".
#   * version_number_ - the C++ language version number needed. If the compiler 
#                       only supports a subset of that language, then the flag 
#                       needed to enable that partial support will be provided. 
#                       The available options are:
#                       * 1998
#                       * 2003
#                       * 2011
#                       * 2014
#                       * 2017
#                       * 2020
#
################################################################################

include(CheckCXXCompilerFlag)

#
# enable compiler support for specific language version
#
function(ENABLE_CXX_LANGUAGE_VERSION flag_name_ version_number_)

  # default setting of result
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)

  # flag for C++98
  if(version_number_ EQUAL 1998)
    set(FLAG_STRING "-std=c++98") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX98_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_CXX98_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    endif()
  # flag for C++03
  elseif(version_number_ EQUAL 2003)
    set(FLAG_STRING "-std=c++03") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX03_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_CXX03_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    endif()
  # flag for C++11
  elseif(version_number_ EQUAL 2011)
    set(FLAG_STRING "-std=c++11") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX11_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_CXX11_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c++0x") # g++, clang++
      check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX0X_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_CXX0X_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  elseif(version_number_ EQUAL 2014)
    set(FLAG_STRING "-std=c++14") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX14_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_CXX14_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c++1y") # g++, clang++
      check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX1Y_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_CXX1Y_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  elseif(version_number_ EQUAL 2017)
    set(FLAG_STRING "-std=c++17") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX17_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_CXX17_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c++1z") # g++, clang++
      check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX1Z_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_CXX1Z_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  elseif(version_number_ EQUAL 2020)
    set(FLAG_STRING "-std=c++20") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX20_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_CXX20_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c++2a") # g++, clang++
      check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX2A_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_CXX2A_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  else()
    message(WARNING "Unsupported/Invalid C++ language version "
                    "->${version_number_}<- provided")
  endif()
endfunction()

