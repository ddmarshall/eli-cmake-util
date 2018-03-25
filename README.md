# eli-cmake-util
CMake utilities commonly used throughout projects.

## Description
This project contains CMake utilities that can be used in a project using CMake as its meta-build system. These files satisfy specific needs that were showing up in multiple projects.

### Enhanced Finds
This functionality enhances the standard CMake FIND_PACKAGE feature. For the supported libraries, user can specify a particular version of the library (or partial version). If that version is not currently found in the system, then it is installed as an external project. This ensures that a critical library will exist for the project.

Current support projects are:

* Eigen3
* GoogleTest

### Compiler Flags
These functions are used to set compiler flags/warnings/dialects independent of the compiler. Settings for C++, C, and Fortran compilers are supported. The first parameter into each of these functions is the variable name to be used to store the flag. If the setting is not supported the variable string will be set to `NOT_FOUND`.

#### C++ Compiler Settings
    ENABLE_CXX_LANGUAGE_VERSION(flag_name_ version_number_)
    ENABLE_CXX_PEDANTIC(flag_name_)

    ENABLE_CXX_COMPILER_STRICT_ALIASING(flag_name_)
    ENABLE_CXX_COMPILER_CONSTEXPR_DEPTH(flag_name_ depth_)
    ENABLE_CXX_COMPILER_CONSTEXPR_LOOP_LIMIT(flag_name_ depth_)
    ENABLE_CXX_COMPILER_MESSAGE_LENGTH(flag_name_ length_)

    ENABLE_CXX_COMPILER_WARNING_CONVERSION(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_UNDEF_USAGE(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_CAST_ALIGN(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_EXTRA(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW_EXTRA(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_LOGICAL_OPERATIONS_PARENTHESIS(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_DOUBLE_PROMOTION(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_SHADOW(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_NON_VIRTUAL_DESTRUCTOR(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_HIDDEN_VIRTUAL_METHOD(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_LONG_LONG(flag_name_ yesnoflag_)
    ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_NARROWING(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_STRICT_ALIASING(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_EFFECTIVE_CXX(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_OLD_CAST_STYLE(flag_name_)
    ENABLE_CXX_COMPILER_WARNING_AS_ERROR(flag_name_)
    ENABLE_CXX_WARNING_LEVEL(flag_name_ warning_level_)

#### C Compiler Settings
    ENABLE_C_LANGUAGE_VERSION(flag_name_ version_number_)
    ENABLE_C_PEDANTIC(flag_name_)

    ENABLE_C_COMPILER_STRICT_ALIASING(flag_name_)
    ENABLE_C_COMPILER_MESSAGE_LENGTH(flag_name_ length_)

    ENABLE_C_COMPILER_WARNING_CONVERSION(flag_name_)
    ENABLE_C_COMPILER_WARNING_UNDEF_USAGE(flag_name_)
    ENABLE_C_COMPILER_WARNING_CAST_ALIGN(flag_name_)
    ENABLE_C_COMPILER_WARNING_FORMAT_IO_STRING_EXTRA(flag_name_)
    ENABLE_C_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW_EXTRA(flag_name_)
    ENABLE_C_COMPILER_WARNING_LOGICAL_OPERATIONS_PARENTHESIS(flag_name_)
    ENABLE_C_COMPILER_WARNING_DOUBLE_PROMOTION(flag_name_)
    ENABLE_C_COMPILER_WARNING_SHADOW(flag_name_)
    ENABLE_C_COMPILER_WARNING_LONG_LONG(flag_name_ yesnoflag_)
    ENABLE_C_COMPILER_WARNING_FORMAT_IO_STRING(flag_name_)
    ENABLE_C_COMPILER_WARNING_FORMAT_IO_STRING_OVERFLOW(flag_name_)
    ENABLE_C_COMPILER_WARNING_NARROWING(flag_name_)
    ENABLE_C_COMPILER_WARNING_STRICT_ALIASING(flag_name_)
    ENABLE_C_COMPILER_WARNING_WRITE_STRINGS(flag_name_)
    ENABLE_C_COMPILER_WARNING_AS_ERROR(flag_name_)
    ENABLE_C_WARNING_LEVEL(flag_name_ warning_level_)

#### Fortran Compiler Settings
    ENABLE_FORTRAN_LANGUAGE_VERSION(flag_name_ version_number_)
    ENABLE_FORTRAN_PEDANTIC(flag_name_)

    ENABLE_FORTRAN_COMPILER_IMPLICIT_NONE(flag_name_)
    ENABLE_FORTRAN_COMPILER_INTEGER_SIZE(flag_name_ integer_size_)
    ENABLE_FORTRAN_COMPILER_REAL_SIZE(flag_name_ real_size_)
    ENABLE_FORTRAN_COMPILER_DOUBLE_SIZE(flag_name_ double_size_)
    ENABLE_FORTRAN_COMPILER_MESSAGE_LENGTH(flag_name_ length_)

    ENABLE_FORTRAN_COMPILER_WARNING_AS_ERROR(flag_name_)
    ENABLE_FORTRAN_WARNING_LEVEL(flag_name_ warning_level_)

### Utilities
These functions are used to perform various useful actions.

    CHECK_VERSION_REQ(use_flag_ version_req_)
    PARSE_VERSION(package_name_ version_in)

### Debug Helpers
These functions are useful for debugging CMake scripts and to gain insight into the state of CMake at any point in a script.

    DEBUG_MESSAGE(var_)
    PRINT_ALL_VARIABLES()

## Version History

### Version 0.5
* Added the compiler flags support
* Minor improvements to other modules

### Version 0.4

* Improved support for use in external projects
* Fixed support for system and local installations

### Version 0.3

* Added Eigen3 support
* Restructured GoogleTest support

## License

This program and the accompanying materials are made available under the terms of the [Eclipse Public License 2.0](https://www.eclipse.org/legal/epl-2.0/).

See LICENSE.md file in the project root for full license information.
