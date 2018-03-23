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

function(DEBUG_MESSAGE var_)
  message("DEBUG ${var_}=${${var_}}")
endfunction()

