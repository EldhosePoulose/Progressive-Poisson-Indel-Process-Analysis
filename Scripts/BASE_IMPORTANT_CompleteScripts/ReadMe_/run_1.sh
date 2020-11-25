#!/bin/bash

sbatch --partition=single --qos=single ./sh_Protein/run_8_0.10_200_200_1_0.sh
sleep 0.2
sbatch --partition=single --qos=single ./sh_Protein/run_8_0.10_200_200_1_1.sh
sleep 0.2
