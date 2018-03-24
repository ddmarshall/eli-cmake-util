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




MESSAGE(WARNING "The -fmessage-length=0 flag is only needed for generators that parse the compiler output such as CodeBlocks and Eclipse")
check_cxx_compiler_flag(-fmessage-length=0 COMPILER_SUPPORT_CPP_MESSAGE_LENGTH0)# No wrapping of lines (useful for eclipse and codeblocks)







##
## set the amount of warnings wanted from compiler
##
#set(COMPILER_C_WARNING_STATE 1) # 0 -> nothing; 1 -> Wall; 2 -> Wextra; 3 -> All good warnings
## Level 1
#check_c_compiler_flag(-Wall COMPILER_SUPPORT_C_WALL)# enable large number of warnings
## Level 2
#check_c_compiler_flag(-Wextra COMPILER_SUPPORT_C_WEXTRA)# enable even more warnings
## Level 3

#check_c_compiler_flag(-Wno-long-long COMPILER_SUPPORT_C_NO_LONG_LONG)# Disable warning about using long long type
#check_c_compiler_flag(-Wconversion COMPILER_SUPPORT_C_CONVERSION)# Warn for implicit conversions that may alter a value
#check_c_compiler_flag(-Wundef COMPILER_SUPPORT_C_UNDEF)# Warn if an undefined identifier is evaluated in an #if directive
#check_c_compiler_flag(-Wcast-align COMPILER_SUPPORT_C_CAST_ALIGN) # Warn whenever a pointer is cast such that the required alignment of the target is increased.
#check_c_compiler_flag(-Wformat=2 COMPILER_SUPPORT_C_FORMAT2) # check format strings in I/O
#check_c_compiler_flag(-Wlogical-op COMPILER_SUPPORT_C_LOGICAL_OP) # gcc: Warn about suspicious uses of logical operators in expressions
#check_c_compiler_flag(-Wlogical-op-parentheses COMPILER_SUPPORT_C_LOGICAL_OP_PARENTHESIS) # clang: Warn about suspicious uses of logical operators in expressions
#check_c_compiler_flag(-Wdouble-promotion COMPILER_SUPPORT_C_DOUBLE_PROMOTION) # Warn when a value of type float is implicitly promoted to double
#check_c_compiler_flag(-fmessage-length=0 COMPILER_SUPPORT_C_MESSAGE_LENGTH0)# No wrapping of lines (useful for eclipse and codeblocks)
#check_c_compiler_flag(-Wshadow COMPILER_SUPPORT_C_SHADOW) # Warn if variables are shadowed
#check_c_compiler_flag(-Wwrite-strings COMPILER_SUPPORT_C_WRITE_STRINGS) # warn if trying to write to string constant address space
#check_c_compiler_flag(-fstrict-aliasing COMPILER_SUPPORT_C_STRICT_ALIASING) # Allow compiler to assume the strictest aliasing rules applicable
#set(CMAKE_REQUIRED_DEFINITIONS "-fstrict-aliasing -Wstrict-aliasing")
#check_c_source_compiles("int main(int argc, char *argv[]) {return 0;}" COMPILER_SUPPORT_C_STRICT_ALIASING_WARNING)# warn about code that might violate strict aliasing rules


#set(COMPILER_C_WARNINGS_AS_ERROR true) # true/false
##
## Additional compiler settings
##
#check_c_compiler_flag(-Werror COMPILER_SUPPORT_C_WERROR) # all warnings are errors




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
    check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_INTEGER_SIZE_${integer_size_})
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
    check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
    if(COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  elseif(real_size_ EQUAL 10)
    set(flag_ "-fdefault-real-10")
    check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
    if(COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  elseif(real_size_ EQUAL 16)
    set(flag_ "-fdefault-real-16")
    check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_REAL_SIZE_${real_size_})
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
    check_fortran_compiler_flag(${flag_} COMPILER_SUPPORT_FORTRAN_DOUBLE_SIZE_${double_size_})
    if(COMPILER_SUPPORT_FORTRAN_DOUBLE_SIZE_${double_size_})
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  else()
    message(FATAL_ERROR "Invalid double size of ${double_size_}")
  endif()
endfunction()


