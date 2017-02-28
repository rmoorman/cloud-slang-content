# (c) Copyright 2017 Hewlett-Packard Enterprise Development Company, L.P.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
# The Apache License is available at
# http://www.apache.org/licenses/LICENSE-2.0
#
########################################################################################################################
#!!
#! @description: Read an image from a file and print it.
#!
#! @input file_path: The path of the image
#!
#! @result SUCCESS: Flow completed successfully.
#! @result FAILURE: Failure occurred during execution.
#!!#
########################################################################################################################

namespace: io.cloudslang.samples.yoda

imports:
  base: io.cloudslang.base.print
  fs: io.cloudslang.base.filesystem

flow:
  name: print_image

  inputs:
    - file_path

  workflow:
    - read_start:
        do:
          fs.read_from_file:
            - file_path: ${file_path}
        publish:
          - read_text
        navigate:
          - SUCCESS: print_start
          - FAILURE: FAILURE

    - print_start:
        do:
          base.print_text:
            - text: ${read_text}
        navigate:
          - SUCCESS: SUCCESS