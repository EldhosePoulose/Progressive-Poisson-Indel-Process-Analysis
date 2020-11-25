# Run MAFFT Aligner

#for inputfiles in {1..100};
#do  
	# 1 INDELible Data
#	mafft --auto --leavegappyregion --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/mafftTree_INDELible/mafftTree_I_$inputfiles.mafft /Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedmafftMSA_INDELible/mafftSeq_I_$inputfiles.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned/alignedMSA_I_$inputfiles.fasta
#done

for inputfiles in {1..100};
do  
	# 1 ProPIP Data
	mafft --auto --leavegappyregion --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP/mafftTree_P_$inputfiles.mafft /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/ungappedmafftMSA_ProPIP/mafftSeq_P_$inputfiles.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/ProPIP_Aligned/alignedMSA_P_$inputfiles.fasta
done

#for inputfiles in {1..4};
#do  
	# 1 realData
#	mafft --auto --leavegappyregion --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/mafftTree_realData/mafftTree_r_$inputfiles.mafft /Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/ungappedmafftMSA_realData/mafftSeq_r_$inputfiles.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned/alignedMSA_r_$inputfiles.fasta
#done

# "$(($inputfiles+1))"
# --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/mafftTree_INDELible/mafftTree_I_$(($inputfiles+1)).mafft 
# --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP/mafftTree_P_$(($inputfiles+1)).mafft 

# MAFFT Alignment output paths
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/ProPIP_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned

# ProPIP Alignment output paths 
# Present inside each params file