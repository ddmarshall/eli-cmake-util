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
# - Test the compiler_flags function
#

cmake_minimum_required(VERSION 3.0)

project(COMPILER_FLAGS_TEST
        LANGUAGES C CXX Fortran)
        
# add the project specific cmake files to module path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
                      ${PROJECT_SOURCE_DIR}
                      ${PROJECT_SOURCE_DIR}/../..)

# add all of the need modules
include(${PROJECT_SOURCE_DIR}/../../debug_message.cmake)
include(${PROJECT_SOURCE_DIR}/../../compiler_flags.cmake)

################################################################################
#
# C++ Settings
#
################################################################################

#
# test setting the C++ language version
#
set(CXX_STD_FLAG "")
set(COMPILER_SETTING_CXX_STD 1998)
enable_cxx_language_version(CXX_STD_FLAG ${COMPILER_SETTING_CXX_STD})
if (CXX_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ ${COMPILER_SETTING_CXX_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ ${COMPILER_SETTING_CXX_STD}")
endif()

set(CXX_STD_FLAG "")
set(COMPILER_SETTING_CXX_STD 2003)
enable_cxx_language_version(CXX_STD_FLAG ${COMPILER_SETTING_CXX_STD})
if (CXX_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ ${COMPILER_SETTING_CXX_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ ${COMPILER_SETTING_CXX_STD}")
endif()

set(CXX_STD_FLAG "")
set(COMPILER_SETTING_CXX_STD 2011)
enable_cxx_language_version(CXX_STD_FLAG ${COMPILER_SETTING_CXX_STD})
if (CXX_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ ${COMPILER_SETTING_CXX_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ ${COMPILER_SETTING_CXX_STD}")
endif()

set(CXX_STD_FLAG "")
set(COMPILER_SETTING_CXX_STD 2014)
enable_cxx_language_version(CXX_STD_FLAG ${COMPILER_SETTING_CXX_STD})
if (CXX_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ ${COMPILER_SETTING_CXX_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ ${COMPILER_SETTING_CXX_STD}")
endif()

set(CXX_STD_FLAG "")
set(COMPILER_SETTING_CXX_STD 2017)
enable_cxx_language_version(CXX_STD_FLAG ${COMPILER_SETTING_CXX_STD})
if (CXX_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ ${COMPILER_SETTING_CXX_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ ${COMPILER_SETTING_CXX_STD}")
endif()

set(CXX_STD_FLAG "")
set(COMPILER_SETTING_CXX_STD 2020)
enable_cxx_language_version(CXX_STD_FLAG ${COMPILER_SETTING_CXX_STD})
if (CXX_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ ${COMPILER_SETTING_CXX_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ ${COMPILER_SETTING_CXX_STD}")
endif()

#
# test setting the C++ pedantic flag
#
set(CXX_PEDANTIC_FLAG "")
enable_cxx_pedantic(CXX_PEDANTIC_FLAG)
if (CXX_PEDANTIC_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ pedantic compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ pedantic support")
endif()

#
# testing C++ compiler flags
#
set(CXX_STRICT_ALIASING "")
enable_cxx_compiler_strict_aliasing(CXX_STRICT_ALIASING)
if (CXX_STRICT_ALIASING STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ strict aliasing compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ strict aliasing")
endif()

set(CXX_CONSTEXPR_DEPTH "")
enable_cxx_compiler_constexpr_depth(CXX_CONSTEXPR_DEPTH 1024)
if (CXX_CONSTEXPR_DEPTH STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ constexpr depth compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ constexpr depth")
endif()

set(CXX_CONSTEXPR_LOOP_LIMIT "")
enable_cxx_compiler_constexpr_loop_limit(CXX_CONSTEXPR_LOOP_LIMIT 524288)
if (CXX_CONSTEXPR_LOOP_LIMIT STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ constexpr loop limit compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ constexpr loop limit")
endif()

#
# test setting individual C++ warnings
#
set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_conversion(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ type conversion warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ type conversion warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_undef_usage(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ undef usage warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ undef usage warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_cast_align(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ cast align warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ cast align warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_format_io_string_extra(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ extra I/O format string check compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ extra I/O format string check")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_format_io_string_overflow_extra(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ extra I/O string overflow compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ extra I/O string overflow")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_logical_operations_parenthesis(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ logical operations parenthesis usage compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ logical operations parenthesis usage")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_double_promotion(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ double promotion warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ double promotion warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_shadow(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ variable shadowing warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ variable shadowing warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_non_virtual_destructor(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ non-virtual destructor warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ non-virtual destructor warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_hidden_virtual_method(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ hidden virtual method warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ hidden virtual method warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_long_long(CXX_WARNING_FLAG true)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ long long usage warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ long long usage warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_long_long(CXX_WARNING_FLAG false)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ long long usage warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ long long usage warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_format_io_string(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ format I/O string warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ format I/O string warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_format_io_string_overflow(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ I/O string overflow warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ I/O string overflow warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_narrowing(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ type narrowing warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ type narrowing warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_strict_aliasing(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ strict aliasing warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ strict aliasing warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_effective_cxx(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ effctive C++ warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ effctive C++ warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_old_cast_style(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ old-style cast warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ old-style cast warning")
endif()

set(CXX_WARNING_FLAG "")
enable_cxx_compiler_warning_as_error(CXX_WARNING_FLAG)
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ warnings as errors compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C++ warnings as errors")
endif()

#
# test setting the C++ warning levels
#
set(CXX_WARNING_FLAG "")
set(CXX_WARNING_LEVEL 0)
enable_cxx_warning_level(CXX_WARNING_FLAG ${CXX_WARNING_LEVEL})
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ compiler warning level ${CXX_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C++ warning "
                 "level ${CXX_WARNING_LEVEL}")
endif()

set(CXX_WARNING_FLAG "")
set(CXX_WARNING_LEVEL 1)
enable_cxx_warning_level(CXX_WARNING_FLAG ${CXX_WARNING_LEVEL})
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ compiler warning level ${CXX_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C++ warning "
                 "level ${CXX_WARNING_LEVEL}")
endif()

set(CXX_WARNING_FLAG "")
set(CXX_WARNING_LEVEL 2)
enable_cxx_warning_level(CXX_WARNING_FLAG ${CXX_WARNING_LEVEL})
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ compiler warning level ${CXX_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C++ warning "
                 "level ${CXX_WARNING_LEVEL}")
endif()

set(CXX_WARNING_FLAG "")
set(CXX_WARNING_LEVEL 3)
enable_cxx_warning_level(CXX_WARNING_FLAG ${CXX_WARNING_LEVEL})
if (CXX_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C++ compiler warning level ${CXX_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C++ warning "
                 "level ${CXX_WARNING_LEVEL}")
endif()

################################################################################
#
# C Settings
#
################################################################################

#
# test setting the C language version
#
set(C_STD_FLAG "")
set(COMPILER_SETTING_C_STD 1990)
enable_c_language_version(C_STD_FLAG ${COMPILER_SETTING_C_STD})
if (C_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C ${COMPILER_SETTING_C_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C ${COMPILER_SETTING_C_STD}")
endif()

set(C_STD_FLAG "")
set(COMPILER_SETTING_C_STD 1999)
enable_c_language_version(C_STD_FLAG ${COMPILER_SETTING_C_STD})
if (C_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C ${COMPILER_SETTING_C_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C ${COMPILER_SETTING_C_STD}")
endif()

set(C_STD_FLAG "")
set(COMPILER_SETTING_C_STD 2011)
enable_c_language_version(C_STD_FLAG ${COMPILER_SETTING_C_STD})
if (C_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C ${COMPILER_SETTING_C_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C ${COMPILER_SETTING_C_STD}")
endif()

set(C_STD_FLAG "")
set(COMPILER_SETTING_C_STD 2018)
enable_c_language_version(C_STD_FLAG ${COMPILER_SETTING_C_STD})
if (C_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C ${COMPILER_SETTING_C_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for C ${COMPILER_SETTING_C_STD}")
endif()

#
# test setting the C pedantic flag
#
set(C_PEDANTIC_FLAG "")
enable_c_pedantic(C_PEDANTIC_FLAG)
if (C_PEDANTIC_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C pedantic compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C pedantic support")
endif()

#
# testing C compiler flags
#
set(C_STRICT_ALIASING "")
enable_c_compiler_strict_aliasing(C_STRICT_ALIASING)
if (C_STRICT_ALIASING STREQUAL "NOT_FOUND")
  message(ERROR " Expected C strict aliasing compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C strict aliasing")
endif()

#
# test setting individual C warnings
#
set(C_WARNING_FLAG "")
enable_c_compiler_warning_conversion(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C type conversion warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C type conversion warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_undef_usage(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C undef usage warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C undef usage warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_cast_align(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C cast align warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C cast align warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_format_io_string_extra(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C extra I/O format string check compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C extra I/O format string check")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_format_io_string_overflow_extra(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C extra I/O string overflow compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C extra I/O string overflow")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_logical_operations_parenthesis(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C logical operations parenthesis usage compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C logical operations parenthesis usage")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_double_promotion(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C double promotion warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C double promotion warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_shadow(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C variable shadowing warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C variable shadowing warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_long_long(C_WARNING_FLAG true)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C long long usage warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C long long usage warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_long_long(C_WARNING_FLAG false)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C no long long usage warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C no long long usage warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_format_io_string(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C format I/O string warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C format I/O string warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_format_io_string_overflow(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C I/O string overflow warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C I/O string overflow warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_narrowing(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C type narrowing warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C type narrowing warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_strict_aliasing(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C strict aliasing warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C strict aliasing warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_write_strings(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C write strings warning compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C write strings warning")
endif()

set(C_WARNING_FLAG "")
enable_c_compiler_warning_as_error(C_WARNING_FLAG)
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C warnings as errors compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for C warnings as errors")
endif()

#
# test setting the C warning levels
#
set(C_WARNING_FLAG "")
set(C_WARNING_LEVEL 0)
enable_c_warning_level(C_WARNING_FLAG ${C_WARNING_LEVEL})
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C compiler warning level ${C_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C warning "
                 "level ${C_WARNING_LEVEL}")
endif()

set(C_WARNING_FLAG "")
set(C_WARNING_LEVEL 1)
enable_c_warning_level(C_WARNING_FLAG ${C_WARNING_LEVEL})
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C compiler warning level ${C_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C warning "
                 "level ${C_WARNING_LEVEL}")
endif()

set(C_WARNING_FLAG "")
set(C_WARNING_LEVEL 2)
enable_c_warning_level(C_WARNING_FLAG ${C_WARNING_LEVEL})
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C compiler warning level ${C_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C warning "
                 "level ${C_WARNING_LEVEL}")
endif()

set(C_WARNING_FLAG "")
set(C_WARNING_LEVEL 3)
enable_c_warning_level(C_WARNING_FLAG ${C_WARNING_LEVEL})
if (C_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected C compiler warning level ${C_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for C warning "
                 "level ${C_WARNING_LEVEL}")
endif()

################################################################################
#
# Fortran Settings
#
################################################################################

#
# test setting the Fortran language version
#
set(FORTRAN_STD_FLAG "")
set(COMPILER_SETTING_FORTRAN_STD 1995)
enable_fortran_language_version(FORTRAN_STD_FLAG ${COMPILER_SETTING_FORTRAN_STD})
if (FORTRAN_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran ${COMPILER_SETTING_FORTRAN_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran ${COMPILER_SETTING_FORTRAN_STD}")
endif()

set(FORTRAN_STD_FLAG "")
set(COMPILER_SETTING_FORTRAN_STD 2003)
enable_fortran_language_version(FORTRAN_STD_FLAG ${COMPILER_SETTING_FORTRAN_STD})
if (FORTRAN_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran ${COMPILER_SETTING_FORTRAN_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran ${COMPILER_SETTING_FORTRAN_STD}")
endif()

set(FORTRAN_STD_FLAG "")
set(COMPILER_SETTING_FORTRAN_STD 2008)
enable_fortran_language_version(FORTRAN_STD_FLAG ${COMPILER_SETTING_FORTRAN_STD})
if (FORTRAN_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran ${COMPILER_SETTING_FORTRAN_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran ${COMPILER_SETTING_FORTRAN_STD}")
endif()

set(FORTRAN_STD_FLAG "")
set(COMPILER_SETTING_FORTRAN_STD 2018)
enable_fortran_language_version(FORTRAN_STD_FLAG ${COMPILER_SETTING_FORTRAN_STD})
if (FORTRAN_STD_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran ${COMPILER_SETTING_FORTRAN_STD} compiler"
                " support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran ${COMPILER_SETTING_FORTRAN_STD}")
endif()

#
# test setting the Fortran pedantic flag
#
set(FORTRAN_PEDANTIC_FLAG "")
enable_fortran_pedantic(FORTRAN_PEDANTIC_FLAG)
if (FORTRAN_PEDANTIC_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran pedantic compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran pedantic support")
endif()

#
# testing Fortran compiler flags
#
set(FORTRAN_WARNING_FLAG "")
enable_fortran_compiler_implicit_none(FORTRAN_WARNING_FLAG)
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran implicit none compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran implicit none")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_INTEGER_SIZE 4)
enable_fortran_compiler_integer_size(FORTRAN_WARNING_FLAG ${FORTRAN_INTEGER_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran integer size of ${FORTRAN_INTEGER_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran integer size "
                 "of ${FORTRAN_INTEGER_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_INTEGER_SIZE 8)
enable_fortran_compiler_integer_size(FORTRAN_WARNING_FLAG ${FORTRAN_INTEGER_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran integer size of ${FORTRAN_INTEGER_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran integer size "
                 "of ${FORTRAN_INTEGER_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_REAL_SIZE 4)
enable_fortran_compiler_real_size(FORTRAN_WARNING_FLAG ${FORTRAN_REAL_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran real size of ${FORTRAN_REAL_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran real size "
                 "of ${FORTRAN_DOUBLE_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_REAL_SIZE 8)
enable_fortran_compiler_real_size(FORTRAN_WARNING_FLAG ${FORTRAN_REAL_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran real size of ${FORTRAN_REAL_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran real size "
                 "of ${FORTRAN_DOUBLE_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_REAL_SIZE 10)
enable_fortran_compiler_real_size(FORTRAN_WARNING_FLAG ${FORTRAN_REAL_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran real size of ${FORTRAN_REAL_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran real size "
                 "of ${FORTRAN_DOUBLE_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_REAL_SIZE 16)
enable_fortran_compiler_real_size(FORTRAN_WARNING_FLAG ${FORTRAN_REAL_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran real size of ${FORTRAN_REAL_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran real size "
                 "of ${FORTRAN_DOUBLE_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_DOUBLE_SIZE 8)
enable_fortran_compiler_double_size(FORTRAN_WARNING_FLAG ${FORTRAN_DOUBLE_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran double size of ${FORTRAN_DOUBLE_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran double size "
                 "of ${FORTRAN_DOUBLE_SIZE}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_DOUBLE_SIZE 16)
enable_fortran_compiler_double_size(FORTRAN_WARNING_FLAG ${FORTRAN_DOUBLE_SIZE})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran double size of ${FORTRAN_DOUBLE_SIZE}"
                " compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran double size "
                 "of ${FORTRAN_DOUBLE_SIZE}")
endif()

#
# test setting individual Fortran warnings
#
set(FORTRAN_WARNING_FLAG "")
enable_fortran_compiler_warning_as_error(FORTRAN_WARNING_FLAG)
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran warnings as errors compiler support but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran warnings as errors")
endif()

#
# test setting the Fortran warning levels
#
set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_WARNING_LEVEL 0)
enable_fortran_warning_level(FORTRAN_WARNING_FLAG ${FORTRAN_WARNING_LEVEL})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran compiler warning level ${FORTRAN_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran warning "
                 "level ${FORTRAN_WARNING_LEVEL}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_WARNING_LEVEL 1)
enable_fortran_warning_level(FORTRAN_WARNING_FLAG ${FORTRAN_WARNING_LEVEL})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran compiler warning level ${FORTRAN_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran warning "
                 "level ${FORTRAN_WARNING_LEVEL}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_WARNING_LEVEL 2)
enable_fortran_warning_level(FORTRAN_WARNING_FLAG ${FORTRAN_WARNING_LEVEL})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran compiler warning level ${FORTRAN_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran warning "
                 "level ${FORTRAN_WARNING_LEVEL}")
endif()

set(FORTRAN_WARNING_FLAG "")
set(FORTRAN_WARNING_LEVEL 3)
enable_fortran_warning_level(FORTRAN_WARNING_FLAG ${FORTRAN_WARNING_LEVEL})
if (FORTRAN_WARNING_FLAG STREQUAL "NOT_FOUND")
  message(ERROR " Expected Fortran compiler warning level ${FORTRAN_WARNING_LEVEL}"
                " but is not supported")
else()
  message(STATUS "Received compiler flag for Fortran warning "
                 "level ${FORTRAN_WARNING_LEVEL}")
endif()


