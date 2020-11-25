# Run PRANK Aligner

for inputfiles in {0..99};
do  
	# 1 INDELible Data
	mafft --auto --leavegappyregion /Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible/out_"$inputfiles"_TRUE_1.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned/alignedMSA_I_$inputfiles.fasta
done

for inputfiles in {0..99};
do  
	# 1 INDELible Data
	mafft --auto --leavegappyregion /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/ungappedMSA_ProPIP/sim-"$inputfiles"_MSA.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/ProPIP_Aligned/alignedMSA_P_$inputfiles.fasta
done

for inputfiles in {1..4};
do  
	# 1 INDELible Data
	mafft --auto --leavegappyregion /Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/ungappedMSA_realData/realData_$inputfiles.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned/alignedMSA_r_$inputfiles.fasta
done

# "$(($inputfiles+1))"
# --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP/mafftTree_I_$(($inputfiles+1)).mafft 
# --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP/mafftTree_P_$(($inputfiles+1)).mafft 

# MAFFT Alignment output paths
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/ProPIP_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned

# ProPIP Alignment output paths 
# Present inside each params file