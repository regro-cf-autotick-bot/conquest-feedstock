#!/bin/bash
cd src
make
cd ../tools/BasisGeneration
make
cd ../PostProcessing
make
cp ../bin/Conquest ${PREFIX}/bin/Conquest
