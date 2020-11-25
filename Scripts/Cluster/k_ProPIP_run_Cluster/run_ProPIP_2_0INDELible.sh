#!/bin/bash

#SBATCH --job-name=INDELible
#SBATCH --output=/cfs/earth/scratch/pouloeld/binaries/ProPIP/Aligned/miniJATI-%j.out
#SBATCH --chdir=/cfs/earth/scratch/pouloeld/binaries/ProPIP/Aligned
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mail-type=end
#SBATCH --mail-user=pouloeld@students.zhaw.ch
#SBATCH --cpus-per-task=1
#SBATCH --partition=single
#SBATCH --qos=single

module load slurm

for nFiles in {1..100}
do
   srun ./miniJATI2 params=/cfs/earth/scratch/pouloeld/Alignment_Generation/inputs/INDELible_ins/ProPIP_k_params_I/k_2_0/ins_k2_params_I_$nFiles.txt
   srun ./miniJATI2 params=/cfs/earth/scratch/pouloeld/Alignment_Generation/inputs/ProPIP_ins/ProPIP_k_params_P/k_2_0/ins_k2_params_P_$nFiles.txt
done
for nFiles in {1..4}
do
   srun ./miniJATI2 params=/cfs/earth/scratch/pouloeld/Alignment_Generation/inputs/realData_ins/ProPIP_k_params_r/k_2_0/ins_k2_params_r_$nFiles.txt
done
