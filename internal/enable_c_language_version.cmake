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
# - Enables C Language version for compiler
#
#   This function simplifies the setting of the compiler flag needed for a 
#   particular C language version. User passes in the variable name to store 
#   the compiler flag and the desired version number.
#   * flag_name_ - the name of the variable that the required compiler flag 
#                  needs to be stored if successful. If unsuccessful then the 
#                  variable will contain "NOT_FOUND".
#   * version_number_ - the C language version number needed. If the compiler 
#                       only supports a subset of that language, then the flag 
#                       needed to enable that partial support will be provided. 
#                       The available options are:
#                       * 1990
#                       * 1999
#                       * 2011
#                       * 2018
#
################################################################################

include(CheckCCompilerFlag)

#
# enable compiler support for specific language version
#
function(ENABLE_C_LANGUAGE_VERSION flag_name_ version_number_)

  # default setting of result
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)

  # flag for C90
  if(version_number_ EQUAL 1990)
    set(FLAG_STRING "-std=c90") # gcc, clang
    check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C90_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_C90_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c89") # gcc, clang
      check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C89_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_C89_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  # flag for C99
  elseif(version_number_ EQUAL 1999)
    set(FLAG_STRING "-std=c99") # gcc, clang
    check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C99_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_C99_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c9x") # gcc, clang
      check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C9X_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_C9X_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  # flag for C11
  elseif(version_number_ EQUAL 2011)
    set(FLAG_STRING "-std=c11") # gcc, clang
    check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C11_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_C11_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c1x") # gcc, clang
      check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C1X_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_C1X_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  # flag for C18
  elseif(version_number_ EQUAL 2018)
    set(FLAG_STRING "-std=c18") # gcc, clang
    check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C18_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_C18_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    else()
      set(FLAG_STRING "-std=c17") # gcc, clang
      check_c_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_C17_LANGUAGE_SETTING)
      if (COMPILER_SUPPORT_C17_LANGUAGE_SETTING)
        set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
      endif()
    endif()
  else()
    message(WARNING "Unsupported/Invalid C language version "
                    "->${version_number_}<- provided")
  endif()
endfunction()

