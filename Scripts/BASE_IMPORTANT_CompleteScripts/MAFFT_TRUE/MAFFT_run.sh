
for inputfiles in {0..0};
do  
	# 1 INDELible Data
	mafft --auto --leavegappyregion --treein /Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/mafftTree_INDELible/mafftTree_I_$(($inputfiles+1)).mafft /Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible/out_"$inputfiles"_TRUE_1.fasta > /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned/alignedMSA_I_$inputfiles.fasta
done