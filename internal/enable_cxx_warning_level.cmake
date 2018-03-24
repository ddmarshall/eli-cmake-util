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
# - Enables various amounts of warnings for C++ compiler
#
#   This function simplifies the setting of the compiler flag needed for a 
#   variety of warnings for the C++ compiler. User passes in the variable name 
#   to store the compiler flag and the desired warning level.
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

include(CheckCXXCompilerFlag)

################################################################################
#
# Individual Warnings
#
################################################################################

#
# Warn for implicit conversions that may alter a value
#
function(ENABLE_CXX_COMPILER_WARNING_CONVERSION flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wconversion")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_CONVERSION)
  if(COMPILER_SUPPORT_CXX_CONVERSION)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn if an undefined identifier is evaluated in an #if directive
#
function(ENABLE_CXX_COMPILER_WARNING_UNDEF_USAGE flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wundef")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_UNDEF_USAGE)
  if(COMPILER_SUPPORT_CXX_UNDEF_USAGE)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn whenever a pointer is cast such that the required alignment of the
# target is increased.
#
function(ENABLE_CXX_COMPILER_WARNING_CAST_ALIGN flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wcast-align")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_CAST_ALIGN)
  if(COMPILER_SUPPORT_CXX_CAST_ALIGN)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn on standard as well as additional checks on format strings in I/O
#
function(ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_EXTRA flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wformat=2")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_FORMAT_IO_STRING_EXTRA)
  if(COMPILER_SUPPORT_CXX_FORMAT_IO_STRING_EXTRA)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn on standard as well as additional warnings of possible destination
# buffer overflow in I/O
#
function(ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW_EXTRA flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wformat-overflow=2")
  check_cxx_compiler_flag(${flag_} 
                          COMPILER_SUPPORT_CXX_FORMAT_IO_STRING_OVERFLOW_EXTRA)
  if(COMPILER_SUPPORT_CXX_FORMAT_IO_STRING_OVERFLOW_EXTRA)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn about suspicious uses of logical operators in expressions
#
function(ENABLE_CXX_COMPILER_WARNING_LOGICAL_OPERATIONS_PARENTHESIS flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)

  # g++
  set(flag_ "-Wlogical-op")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_LOGICAL_OP)
  if(COMPILER_SUPPORT_CXX_LOGICAL_OP)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  else()
    # clang++
    set(flag_ "-Wlogical-op-parentheses")
    check_cxx_compiler_flag(${flag_} 
                            COMPILER_SUPPORT_CXX_LOGICAL_OPERATIONS_PARENTHESIS)
    if(COMPILER_SUPPORT_CXX_LOGICAL_OPERATIONS_PARENTHESIS)
      set(${flag_name_} ${flag_} PARENT_SCOPE)
    endif()
  endif()
endfunction()

#
# Warn when a value of type float is implicitly promoted to double
#
function(ENABLE_CXX_COMPILER_WARNING_DOUBLE_PROMOTION flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wdouble-promotion")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_DOUBLE_PROMOTION)
  if(COMPILER_SUPPORT_CXX_DOUBLE_PROMOTION)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn if variables are shadowed
#
function(ENABLE_CXX_COMPILER_WARNING_SHADOW flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wshadow")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_SHADOW)
  if(COMPILER_SUPPORT_CXX_SHADOW)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn if base class has no virtual destructor
#
function(ENABLE_CXX_COMPILER_WARNING_NON_VIRTUAL_DESTRUCTOR flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wnon-virtual-dtor")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_NON_VIRTUAL_DESTRUCTOR)
  if(COMPILER_SUPPORT_CXX_NON_VIRTUAL_DESTRUCTOR)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn when method declaration hides virtual methods from a base class
#
function(ENABLE_CXX_COMPILER_WARNING_HIDDEN_VIRTUAL_METHOD flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Woverloaded-virtual")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_HIDDEN_VIRTUAL_METHOD)
  if(COMPILER_SUPPORT_CXX_HIDDEN_VIRTUAL_METHOD)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Enable/disable warning about using long long type. Typically enabled
# by -pedantic
#
function(ENABLE_CXX_COMPILER_WARNING_LONG_LONG flag_name_ yesnoflag_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  if (yesnoflag_)
    set(flag_ "-Wlong-long")
    set(str "")
  else()
    set(flag_ "-Wno-long-long")
    set(str "NO_")
  endif()
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_${str}LONG_LONG)
  if(COMPILER_SUPPORT_CXX_${str}LONG_LONG)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn on standard checks on format strings in I/O. Typically enabled by -Wall
#
function(ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wformat")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_FORMAT_IO_STRING)
  if(COMPILER_SUPPORT_CXX_FORMAT_IO_STRING)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn of possible destination buffer overflow in I/O. Typically enabled
# by -Wformat 
#
function(ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wformat-overflow")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_IO_STRING_OVEFLOW)
  if(COMPILER_SUPPORT_CXX_IO_STRING_OVEFLOW)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn if conversion to smaller type
#
function(ENABLE_CXX_COMPILER_WARNING_NARROWING flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wnarrowing")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_NARROWING)
  if(COMPILER_SUPPORT_CXX_NARROWING)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn about code that might violate strict aliasing rules
#
function(ENABLE_CXX_COMPILER_WARNING_STRICT_ALIASING flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-fstrict-aliasing -Wstrict-aliasing")
  set(CMAKE_REQUIRED_DEFINITIONS ${flag_})
  check_cxx_source_compiles("int main(int argc, char *argv[]) {return 0;}" 
                            COMPILER_SUPPORT_CXX_STRICT_ALIASING)
  if(COMPILER_SUPPORT_CXX_STRICT_ALIASING)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()


#
# Warn about violations of the following style guidelines from Scott Meyers’
# Effective C++ series of books
#
function(ENABLE_CXX_COMPILER_WARNING_EFFECTIVE_CXX flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Weffc++")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_EFFECTIVE_CXX)
  if(COMPILER_SUPPORT_CXX_EFFECTIVE_CXX)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Warn of old style, i.e. C-style, casts
#
function(ENABLE_CXX_COMPILER_WARNING_OLD_CAST_STYLE flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Wold-style-cast")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_OLD_CAST_STYLE)
  if(COMPILER_SUPPORT_CXX_OLD_CAST_STYLE)
    set(${flag_name_} ${flag_} PARENT_SCOPE)
  endif()
endfunction()

#
# Turn any compiler warning into error
#
function(ENABLE_CXX_COMPILER_WARNING_AS_ERROR flag_name_)
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)
  
  # g++, clang++
  set(flag_ "-Werror")
  check_cxx_compiler_flag(${flag_} COMPILER_SUPPORT_CXX_WARN_AS_ERROR)
  if(COMPILER_SUPPORT_CXX_WARN_AS_ERROR)
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
function(ENABLE_CXX_WARNING_LEVEL flag_name_ warning_level_)

  # default setting of result
  set(${flag_name_} "NOT_FOUND" PARENT_SCOPE)

  # flags for level 0
  if(warning_level_ EQUAL 0)
    set(${flag_name_} "" PARENT_SCOPE)
  # flags for level 1
  elseif((warning_level_ MATCHES "^[1-9]$") AND (warning_level_ GREATER 0))
    set(FINAL_STRING "")
    set(FLAG_STRING "-Wall") # g++, clang++
    check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX_WALL)
    if (COMPILER_SUPPORT_CXX_WALL)
      set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
      if (warning_level_ GREATER 1)
        set(FLAG_STRING "-Wextra") # g++, clang++
        check_cxx_compiler_flag(${FLAG_STRING} COMPILER_SUPPORT_CXX_WEXTRA)
        if (COMPILER_SUPPORT_CXX_WEXTRA)
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        else()
          message(WARNING "Could not determine flags for C++ warning level 2")
        endif()
      endif()
      if (warning_level_ GREATER 2)
        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_CONVERSION(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ type conversion "
                          "warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_UNDEF_USAGE(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ undefined macro "
                          "usage warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_CAST_ALIGN(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ cast alignment "
                          "warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_EXTRA(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for extra C++ I/O format "
                          "string warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ I/O format "
                          "string overflow warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_LOGICAL_OPERATIONS_PARENTHESIS(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ logical "
                          "operations parenthesis warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_DOUBLE_PROMOTION(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ I/O implicit "
                          "float promotion to double warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_SHADOW(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ variable "
                          "shadowing warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_NON_VIRTUAL_DESTRUCTOR(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ I/O non-virtual "
                          "destructor warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()

        set(FLAG_STRING "")
        ENABLE_CXX_COMPILER_WARNING_HIDDEN_VIRTUAL_METHOD(FLAG_STRING)
        if (${FLAG_STRING} STREQUAL "NOT_FOUND")
          message(WARNING "Could not determine flag for C++ hidden virtual "
                          "method warning")
        else()
          set(FINAL_STRING "${FINAL_STRING} ${FLAG_STRING}")
        endif()
      endif()
      set(${flag_name_} ${FINAL_STRING} PARENT_SCOPE)
      if (warning_level_ GREATER 3)
        set(${FLAG_NAME_} "NOT_FOUND" PARENT_SCOPE)
        message(WARNING "Unsupported/Invalid C++ warning level "
                        "->${warning_level_}<- provided")
      endif()
    else()
      message(WARNING "Could not determine flags for C++ warning level 1")
    endif()
  else()
    message(WARNING "Unsupported/Invalid C++ warning level "
                    "->${warning_level_}<- provided")
  endif()
endfunction()

