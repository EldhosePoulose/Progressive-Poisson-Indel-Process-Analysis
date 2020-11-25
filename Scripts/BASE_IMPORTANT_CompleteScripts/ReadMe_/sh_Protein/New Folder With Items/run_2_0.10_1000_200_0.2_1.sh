#!/bin/bash

#SBATCH --job-name=j_2_0.10_1000_200_0.2_1
#SBATCH --output=/cfs/earth/scratch/maio/bias/log/o_2_0.10_1000_200_0.2_1
#SBATCH --chdir=/cfs/earth/scratch/maio/bias/log
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=0:10:00
#SBATCH --partition=single
#SBATCH --qos=single

module load slurm

srun /cfs/earth/scratch/maio/bin/minijati/miniJATI params=/cfs/earth/scratch/maio/bias/params_Protein/p_2_0.10_1000_200_0.2_1
