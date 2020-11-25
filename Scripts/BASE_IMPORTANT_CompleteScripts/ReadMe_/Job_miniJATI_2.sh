#!/bin/bash

#SBATCH --job-name=miniJATI
#SBATCH --output=/cfs/earth/scratch/pouloeld/binaries/ProPIP/miniJATI2-%j.out
#SBATCH --chdir=/cfs/earth/scratch/pouloeld/binaries/ProPIP
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=single
#SBATCH --qos=single

module load slurm

srun ./miniJATI2 params=/cfs/earth/scratch/pouloeld/binaries/ProPIP/ins_params_I_80.txt
