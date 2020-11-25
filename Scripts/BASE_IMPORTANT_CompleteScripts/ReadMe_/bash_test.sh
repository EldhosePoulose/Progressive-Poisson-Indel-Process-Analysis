#!/bin/bash
#SBATCH --job-name=INDELible
#SBATCH --partition=single
#SBATCH --qos=single

module load slurm

srun /cfs/earth/scratch/pouloeld/binaries/INDELible/INDELible.out 

