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
#   This function takes a version string and extracts the major, minor, and 
#   patch values. The input terms are:
#   * major_out - The variable to store the major version in
#   * minor_out - The variable to store the minor version in
#   * patch_out - The variable to store the patch version in
#   * version_in - the version string to be parsed
#
################################################################################

function(PARSE_VERSION major_name_ minor_name_ patch_name_ version_in)
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

  set(${major_name_} ${_major_version} PARENT_SCOPE)
  set(${minor_name_} ${_minor_version} PARENT_SCOPE)
  set(${patch_name_} ${_patch_version} PARENT_SCOPE)
endfunction()
