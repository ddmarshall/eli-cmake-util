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
# - Prints out name and value of variable name passed in
#
#   This function simplifies the displaying of variables, which is useful
#   during debugging.
#   * var_ - the name of the variable to be displayed
#
################################################################################

#
# determine the location of this file
#
set(_this_dir "${CMAKE_CURRENT_LIST_DIR}")

################################################################################
#
# C++ Settings
#
################################################################################
include(${_this_dir}/internal/enable_cxx_language_version.cmake)
include(${_this_dir}/internal/enable_cxx_pedantic.cmake)
include(${_this_dir}/internal/enable_cxx_warning_level.cmake)

#
# Allow compiler to assume the strictest aliasing rules apply
#
function(ENABLE_CXX_COMPILER_STRICT_ALIASING flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-fstrict-aliasing")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_STRICT_ALIASING)
  if(COMPILER_SUPPORT_CXX_STRICT_ALIASING)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Set the recursion depth for evaluation of constexpr.
# requires c++11: gcc default 512
#
function(ENABLE_CXX_COMPILER_CONSTEXPR_DEPTH flag_name_ depth_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  if ((depth_ MATCHES "^[1-9][0-9]+$") AND (depth_ GREATER 2))
    set(flag_ "-fconstexpr-depth=${depth_}")
    check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_CONSTEXPR_DEPTH)
    if(COMPILER_SUPPORT_CXX_CONSTEXPR_DEPTH)
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  else()
    warning(FATAL_ERROR "Invalid ${depth_}")
  endif()
endfunction()

#
# Set the maximum on number of iterations on a loop for constexpr.
# requires c++14: gcc default 262144
#
function(ENABLE_CXX_COMPILER_CONSTEXPR_LOOP_LIMIT flag_name_ depth_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  if ((depth_ MATCHES "^[1-9][0-9]+$") AND (depth_ GREATER 2))
    set(flag_ "-fconstexpr-depth=${depth_}")
    check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_CONSTEXPR_LOOP_LIMIT)
    if(COMPILER_SUPPORT_CXX_CONSTEXPR_LOOP_LIMIT)
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  else()
    warning(FATAL_ERROR "Invalid ${depth_}")
  endif()
endfunction()


################################################################################
#
# C Settings
#
################################################################################
include(${_this_dir}/internal/enable_c_language_version.cmake)
include(${_this_dir}/internal/enable_c_pedantic.cmake)
include(${_this_dir}/internal/enable_c_warning_level.cmake)

#
# Allow compiler to assume the strictest aliasing rules apply
#
function(ENABLE_C_COMPILER_STRICT_ALIASING flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # gcc, clang
  set(flag_ "-fstrict-aliasing")
  check_c_compiler_flag(${flag_} COMPILER_SUPPORT_C_STRICT_ALIASING)
  if(COMPILER_SUPPORT_C_STRICT_ALIASING)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

################################################################################
#
# Fortran Settings
#
################################################################################
include(${_this_dir}/internal/enable_fortran_language_version.cmake)
include(${_this_dir}/internal/enable_fortran_pedantic.cmake)
include(${_this_dir}/internal/enable_fortran_warning_level.cmake)

#
# Allow no implicit typing
#
function(ENABLE_FORTRAN_COMPILER_IMPLICIT_NONE flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # gfortran
  set(flag_ "-fimplicit-none")
  check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_IMPLICIT_NONE)
  if(COMPILER_SUPPORT_FORTRAN_IMPLICIT_NONE)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Set the integer size to passed in value
#
function(ENABLE_FORTRAN_COMPILER_INTEGER_SIZE flag_name_ integer_size_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # gfortran
  if (integer_size_ EQUAL 4)
    set(${flag_name_} "" PARENT_SCOPE)
  elseif(integer_size_ EQUAL 8)
    set(flag_ "-fdefault-integer-8")
    check_fortran_compiler_flag(${flag_} 
                         COMPILER_SUPPORT_FORTRAN_INTEGER_SIZE_${integer_size_})
    if(COMPILER_SUPPORT_FORTRAN_INTEGER_SIZE_${integer_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  else()
    message(FATAL_ERROR "Invalid integer size of ${integer_size_}")
  endif()
endfunction()

#
# Set the real size to passed in value
#
function(ENABLE_FORTRAN_COMPILER_REAL_SIZE flag_name_ real_size_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # gfortran
  if (real_size_ EQUAL 4)
    set(${flag_name_} "" PARENT_SCOPE)
  elseif(real_size_ EQUAL 8)
    set(flag_ "-fdefault-real-8")
    check_fortran_compiler_flag(${flag_} 
                               COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
    if(COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  elseif(real_size_ EQUAL 10)
    set(flag_ "-fdefault-real-10")
    check_fortran_compiler_flag(${flag_} 
                               COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
    if(COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  elseif(real_size_ EQUAL 16)
    set(flag_ "-fdefault-real-16")
    check_fortran_compiler_flag(${flag_} 
                               COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
    if(COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  else()
    message(FATAL_ERROR "Invalid real size of ${real_size_}")
  endif()
endfunction()

#
# Set the double size to passed in value
#
function(ENABLE_FORTRAN_COMPILER_DOUBLE_SIZE flag_name_ double_size_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # gfortran
  if (double_size_ EQUAL 8)
    set(${flag_name_} "" PARENT_SCOPE)
  elseif(double_size_ EQUAL 16)
    set(flag_ "-fdefault-double-16")
    check_fortran_compiler_flag(${flag_} 
                           COMPILER_SUPPORT_FORTRAN_DOUBLE_SIZE_${double_size_})
    if(COMPILER_SUPPORT_FORTRAN_DOUBLE_SIZE_${double_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  else()
    message(FATAL_ERROR "Invalid double size of ${double_size_}")
  endif()
endfunction()


