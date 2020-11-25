#!/bin/bash

#SBATCH --job-name=j_8_0.10_200_200_1_1
#SBATCH --output=/cfs/earth/scratch/maio/bias/log/o_8_0.10_200_200_1_1
#SBATCH --chdir=/cfs/earth/scratch/maio/bias/log
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:10:00
#SBATCH --partition=single
#SBATCH --qos=single

module load slurm

srun /cfs/earth/scratch/maio/bin/minijati/miniJATI params=/cfs/earth/scratch/maio/bias/params_Protein/p_8_0.10_200_200_1_1
