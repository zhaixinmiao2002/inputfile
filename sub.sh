#!/bin/bash
#SBATCH -p vip_gpu_scx7l2f
#SBATCH -x paraai-n32-h-01-agent-[45,48,85,60,17]
#SBATCH -J dimer_sys
#SBATCH -N 1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --error=err-%J.txt
#SBATCH --output=out-%J.txt

module load ambertools/22

pmemd.cuda -O  -i ../input_file/mini.in -o mini.out -p ../complex.parm7 -c ../complex.rst7 -r mini.rst -ref ../complex.rst7  -x mini.nc -inf mini.mdinfo
pmemd.cuda -O  -i ../input_file/mini_1.in -o mini_1.out -p ../complex.parm7 -c mini.rst   -r mini_1.rst -ref mini.rst    -x mini_1.nc -inf mini_1.mdinfo
pmemd.cuda -O  -i ../input_file/mini_2.in -o mini_2.out -p ../complex.parm7 -c mini_1.rst -r mini_2.rst -ref mini_1.rst  -x mini_2.nc -inf mini_2.mdinfo
pmemd.cuda -O  -i ../input_file/mini_3.in -o mini_3.out -p ../complex.parm7 -c mini_2.rst -r mini_3.rst -ref mini_2.rst  -x mini_3.nc -inf mini_3.mdinfo
pmemd.cuda -O  -i ../input_file/heat.in -o heat.out -p ../complex.parm7 -c mini_3.rst -r heat.rst -ref mini_3.rst  -x heat.nc -inf heat.mdinfo
pmemd.cuda -O  -i ../input_file/eq_1.in -o eq_1.out -p ../complex.parm7 -c heat.rst -r eq_1.rst -ref heat.rst  -x eq_1.nc -inf eq_1.mdinfo
pmemd.cuda -O  -i ../input_file/eq_2.in -o eq_2.out -p ../complex.parm7 -c eq_1.rst -r eq_2.rst -ref eq_1.rst  -x eq_2.nc -inf eq_2.mdinfo
pmemd.cuda -O  -i ../input_file/md.in -o md.out -p ../solvated_HMR.parm7 -c eq_2.rst -r md.rst -ref eq_2.rst -x md.nc -inf md.mdinfo
