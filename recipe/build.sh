#!/bin/bash

# Build conquest 
cd src
make

# Build MakeIonFiles and PostProcessCQ
cp system/system.make ../tools/BasisGeneration
cd ../tools/BasisGeneration
make
cp system.make ../PostProcessing
cd ../PostProcessing
make
cd ../..
mkdir -p ${PREFIX}/bin
cp bin/* ${PREFIX}/bin

# Build pseudo potentials 
cd pseudo-and-pao
for f in $(find . -name Conquest_ion_input); do
     cd $(dirname $f)
     ../../../bin/MakeIonFiles
     psuedotype=$(dirname $(dirname $f))
     mkdir -p ${PREFIX}/share/conquest/"${psuedotype:1}"
     cp *.ion ${PREFIX}/share/conquest/"${psuedotype:1}"
     cd ../..
done
