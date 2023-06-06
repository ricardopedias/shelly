#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
ROOT_DIR=$(dirname $SCRIPT_DIR)

git clone https://github.com/google/googletest.git $ROOT_DIR/extern/googletest

