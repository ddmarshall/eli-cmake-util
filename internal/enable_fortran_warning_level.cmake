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
# - Enables various amounts of warnings for Fortran compiler
#
#   This function simplifies the setting of the compiler flag needed for a 
#   variety of warnings for the Fortran compiler. User passes in the variable 
#   name to store the compiler flag and the desired warning level.
#   * flag_name_ - the name of the variable that the required compiler flag 
#                  needs to be stored if successful. If unsuccessful then the 
#                  variable will contain "NOT_FOUND".
#   * warning_level_ - the amount of warnings desired. The available values are:
#                       * 0 -> no special warnings provided
#                       * 1 -> roughly equivalent to -Wall
#                       * 2 -> roughly equivalent to -Wall -Wextra
#                       * 3 -> in addition to the 2-level adds more useful 
#                              warnings
#
################################################################################

include(CheckFortranCompilerFlag)

################################################################################
#
# Individual Warnings
#
################################################################################

#
# Turn any compiler warning into error
#
function(ENABLE_FORTRAN_COMPILER_WARNING_AS_ERROR flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # gfortran
  set(flag_ "-Werror")
  check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_WARN_AS_ERROR)
  if(COMPILER_SUPPORT_FORTRAN_WARN_AS_ERROR)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

################################################################################
#
# Group Warning Levels
#
################################################################################

#
# enable compiler support for specific language version
#
function(ENABLE_FORTRAN_WARNING_LEVEL flag_name_ warning_level_)

  # default setting of result
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)

  # flags for level 0
  if(warning_level_ EQUAL 0)
    set(${flag_name_} "" PARENT_SCOPE)
  # flags for level 1
  elseif((warning_level_ MATCHES "^[1-9]$") AND (warning_level_ GREATER 0))
    set(FINAL_STRING "")
    set(FLAG_STRING "-Wall") # gfortran
    check_fortran_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_FORTRAN_WALL)
    if (COMPILER_SUPPORT_FORTRAN_WALL)
      set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
      if (warning_level_ GREATER 1)
        set(FLAG_STRING "-Wextra") # gfortran
        check_fortran_compiler_flag(${FLAG_STRING} 
                                    COMPILER_SUPPORT_FORTRAN_WEXTRA)
        if (COMPILER_SUPPORT_FORTRAN_WEXTRA)
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        else()
          message(WARNING "Could not determine flags for Fortran warning "
                          "level 2")
        endif()
      endif()
      if (warning_level_ GREATER 2)
      # additional useful flags would go here
      endif()
      set(${flag_name_} ${FINAL_STRING} PARENT_SCOPE)
      if (warning_level_ GREATER 3)
        set(${FLAG_NAME_} "NOT_FOUND" PARENT_SCOPE)
        message(WARNING "Unsupported/Invalid Fortran warning level "
                        "->${warning_level_}<- provided")
      endif()
    else()
      message(WARNING "Could not determine flags for Fortran warning level 1")
    endif()
  else()
    message(WARNING "Unsupported/Invalid Fortran warning level "
                    "->${warning_level_}<- provided")
  endif()
endfunction()

