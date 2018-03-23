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
# - Enables Fortran Language version for compiler
#
#   This function simplifies the setting of the compiler flag needed for a 
#   particular Fortran language version. User passes in the variable name to 
#   store the compiler flag and the desired version number.
#   * flag_name_ - the name of the variable that the required compiler flag 
#                  needs to be stored if successful. If unsuccessful then the 
#                  variable will contain "NOT_FOUND".
#   * version_number_ - the Fortran language version number needed. If the 
#                       compiler only supports a subset of that language, then 
#                       the flag needed to enable that partial support will be 
#                       provided. The available options are:
#                       * 1995
#                       * 2003
#                       * 2008
#                       * 2018
#
################################################################################

include(CheckFortranCompilerFlag)

#
# enable compiler support for specific language version
#
function(ENABLE_FORTRAN_LANGUAGE_VERSION flag_name_ version_number_)

  # default setting of result
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)

  # flag for f95
  if(version_number_ EQUAL 1995)
    set(FLAG_STRING "-std=f95") # gcc
    check_fortran_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_F95_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_F95_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    endif()
  # flag for f2003
  elseif(version_number_ EQUAL 2003)
    set(FLAG_STRING "-std=f2003") # gcc
    check_fortran_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_F2003_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_F2003_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    endif()
  # flag for f2008
  elseif(version_number_ EQUAL 2008)
    set(FLAG_STRING "-std=f2008") # gcc
    check_fortran_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_F2008_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_F2008_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    endif()
  # flag for f2018
  elseif(version_number_ EQUAL 2018)
    set(FLAG_STRING "-std=f2018") # gcc
    check_fortran_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_F2018_LANGUAGE_SETTING)
    if (COMPILER_SUPPORT_F2018_LANGUAGE_SETTING)
      set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
    endif()
  else()
    message(WARNING "Unsupported/Invalid Fortran language version "
                    "->${version_number_}<- provided")
  endif()
endfunction()

