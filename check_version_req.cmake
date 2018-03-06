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
# - Checks a version string for special indicators
#
#   This set of packages extends the version system for the find_package 
#   function to include "none", "system", and "latest" as allowable strings 
#   in the version variable. This function parses the passed in version string 
#   and determines what (if any) special indicator was set for the version 
#   string that cannot be sent to the CMake functions. The input terms are:
#   * use_flag_ - the variable to store the result of the function call
#                 -1 -> user passed in "none" as version and does not want to 
#                       use this library
#                  0 -> user passed in "system" as version and requires the use 
#                       of whatever version installed on system
#                  1 -> user passed in "latest" as version and wants the latest 
#                       version available
#                  2 -> user passed in any other string that will be passed to 
#                       the find_package function
#   * version_req_ - the version string to be parsed
#
################################################################################

function(CHECK_VERSION_REQ use_flag_ version_req_)
  if (   (version_req_ STREQUAL "none")
      OR (version_req_ STREQUAL "None")
      OR (version_req_ STREQUAL "NONE") )
    set(${use_flag_} -1 PARENT_SCOPE)
  elseif (   (version_req_ STREQUAL "system")
          OR (version_req_ STREQUAL "System")
          OR (version_req_ STREQUAL "SYSTEM") )
    set(${use_flag_} 0 PARENT_SCOPE)
  elseif (   (version_req_ STREQUAL "latest")
          OR (version_req_ STREQUAL "Latest")
          OR (version_req_ STREQUAL "LATEST") )
    set(${use_flag_} 1 PARENT_SCOPE)
  else()
    set(${use_flag_} 2 PARENT_SCOPE)
  endif()
endfunction()
