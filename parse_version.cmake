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
# - Parses a version string to get the major, minor, and patch numbers
#
#   This function takes a version string and extracts the major, minor, patch, 
#   and tweak values. The input terms are:
#   * package_name - The name of the package to prepend to variable names that 
#                    will be used to store results in PARENT_SCOPE
#   * version_in - the version string to be parsed
#
#   These variables will be set in the parent scope:
#   * <package_name>_MAJOR_VERSION - Store the major version
#   * <package_name>_MINOR_VERSION - Store the minor version
#   * <package_name>_PATCH_VERSION - Store the patch version
#   * <package_name>_TWEAK_VERSION - Store the tweak version
#
################################################################################

function(PARSE_VERSION package_name_ version_in)
  string(REPLACE "." ";" _version_list ${version_in})
  list(LENGTH _version_list _version_list_length)
  if (_version_list_length GREATER 0)
    list(GET _version_list 0 _major_version)
  else()
    unset(_major_version)
  endif()
  if (_version_list_length GREATER 1)
    list(GET _version_list 1 _minor_version)
  else()
    unset(_minor_version)
  endif()
  if (_version_list_length GREATER 2)
    list(GET _version_list 2 _patch_version)
  else()
    unset(_patch_version)
  endif()
  if (_version_list_length GREATER 3)
    list(GET _version_list 3 _tweak_version)
  else()
    unset(_teak_version)
  endif()

  set(${package_name_}_MAJOR_VERSION ${_major_version} PARENT_SCOPE)
  set(${package_name_}_MINOR_VERSION ${_minor_version} PARENT_SCOPE)
  set(${package_name_}_PATCH_VERSION ${_patch_version} PARENT_SCOPE)
  set(${package_name_}_TWEAK_VERSION ${_tweak_version} PARENT_SCOPE)
endfunction()
