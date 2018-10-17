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
# - Enables Fortran Language pedantic setting in compiler
#
#   This function simplifies the setting of the pedantic compiler flag. User 
#   passes in the variable name to store the compiler flag.
#   * flag_name_ - the name of the variable that the required compiler flag 
#                  needs to be stored if successful. If unsuccessful then the 
#                  variable will contain "NOT_FOUND".
#
################################################################################

include(CheckFortranCompilerFlag)

#
# enable pedantic support from compiler
#
function(ENABLE_FORTRAN_PEDANTIC flag_name_)

  # default setting of result
  set(${flag_name_} "NOTFOUND" PARENT_SCOPE)

  set(FLAG_STRING "-pedantic") # gcc, clang
  check_fortran_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_FORTRAN_PEDANTIC)
  if(COMPILER_SUPPORT_FORTRAN_PEDANTIC)
    set(${flag_name_} ${FLAG_STRING} PARENT_SCOPE)
  endif()
endfunction()

