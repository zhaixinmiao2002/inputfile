#!/bin/bash
for((i=1;i<=5;i++))
do
    mkdir mmpbsa_${i}
    cd ./mmpbsa_${i}
    cp ../sh_mmpbsa.sh ./
    sed -i "s/y49pho_complex_1/01_jak1_sosc1_${i}_complex/g" sh_mmpbsa.sh
    cp ../mmpbsa.in ./
    sh sh_mmpbsa.sh
    cd ../
done
