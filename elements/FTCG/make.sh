#!/bin/bash
fpc CGTShare.pas -Mdelphi -O1 -XX
fpc CodeGen.dpr -Mdelphi -O1 -XX
cp libCodeGen.so ../web/libCodeGen.so
