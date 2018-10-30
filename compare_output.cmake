################################################################################
# Copyright (c) 2018 David D. Marshall <ddmarsha@calpoly.edu>
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#    David D. Marshall - initial code and implementation
################################################################################

#
# Based on answer from Michael Wild on CMake user's group, https://cmake.org/pipermail/cmake/2009-July/030595.html
#


#################################################################################
## Check to make sure have input parameters needed
#################################################################################

# check to make sure the test executable was set
if(NOT test_cmd)
  message(FATAL_ERROR "Variable test_cmd not defined")
endif()
# check to make sure the file exists
if (NOT EXISTS ${test_cmd})
  message(FATAL_ERROR "${test_cmd} does not exist")
endif()

# check to make sure the name of the reference output file was set
if(NOT output_ref)
  message(FATAL_ERROR "Variable output_ref not defined")
endif()
# check to make sure the file exists
if (NOT EXISTS ${output_ref})
  message(FATAL_ERROR "${output_ref} does not exist")
endif()

#################################################################################
## Execute the commands needed to compare output
#################################################################################
execute_process(COMMAND ${test_cmd}
                OUTPUT_FILE tmp.txt
)
execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files ${output_ref} tmp.txt
                RESULT_VARIABLE test_not_successful
                OUTPUT_QUIET
                ERROR_QUIET
)
execute_process(COMMAND ${CMAKE_COMMAND} -E remove -f tmp.txt)
if(test_not_successful)
  message(SEND_ERROR "${output_ref} does not match expected output from ${test_cmd}!")
endif()
