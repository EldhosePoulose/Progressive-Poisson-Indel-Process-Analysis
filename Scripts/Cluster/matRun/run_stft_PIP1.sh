#!/bin/bash

#SBATCH --job-name=STFT1
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
module load matlab/R2018a

matlab -nodisplay < /cfs/earth/scratch/pouloeld/runFiles/matFiles/main_stft_P_w1.m
matlab -nodisplay < /cfs/earth/scratch/pouloeld/runFiles/matFiles/main_stft_P_w2.m