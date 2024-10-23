#!/bin/bash
if [ -z "$FPC_COMPILER" ]; then
  echo "ERROR: FPC_COMPILER variuable must be set to full path to FPC compiler exe!"
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$FPC_COMPILER "${SCRIPT_DIR}/CGTShare.pas" -Mdelphi -O1 -XX
$FPC_COMPILER "${SCRIPT_DIR}/CodeGen.dpr" -Mdelphi -O1 -XX

# add all paths you heed here?
#cp "${SCRIPT_DIR}/CodeGen.dll" "${SCRIPT_DIR}/../web/CodeGen.dll"