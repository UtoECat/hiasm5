#!/bin/sh
# runs hiasm with a proper terminal encoding!

# cd to root of the repository
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/../

chcp.com 65001
./hiasm5.exe