#!/bin/bash
cd src
make
cp system/system.make ../tools/BasisGeneration
cd ../tools/BasisGeneration
make
cp system.make ../PostProcessing
cd ../PostProcessing
make
cd ../..
mkdir -p ${PREFIX}/bin
cp bin/* ${PREFIX}/bin
