# Run PRANK Aligner


for inputfiles in {0..99};
do  
	# 1 INDELible Data
	prank -d=/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible/out_"$inputfiles"_TRUE_1.fasta -t=/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible/sim-$inputfiles.newick -o=/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles -F -showtree -once
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.best.fas /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.fasta
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.best.dnd /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.dnd
done

for inputfiles in {0..99};
do  
	# 1 PIP Data
	prank -d=/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/ungappedMSA_ProPIP/sim-"$inputfiles"_MSA.fasta -t=/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/newicktree_ProPIP/sim-$inputfiles.newick -o=/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/ProPIP_Aligned/alignedMSA_P_$inputfiles -F -showtree -once
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/ProPIP_Aligned/alignedMSA_P_$inputfiles.best.fas /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/ProPIP_Aligned/alignedMSA_P_$inputfiles.fasta
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/ProPIP_Aligned/alignedMSA_P_$inputfiles.best.dnd /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/ProPIP_Aligned/alignedMSA_P_$inputfiles.dnd
done


for inputfiles in {1..4};
do  
	# 1 realData Data
	prank -d=/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/ungappedMSA_realData/realData_$inputfiles.fasta -t=/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/newicktree_realData/real_$inputfiles.newick -o=/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/realData_Aligned/alignedMSA_r_$inputfiles  -F -showtree -once
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/realData_Aligned/alignedMSA_r_$inputfiles.best.fas /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/realData_Aligned/alignedMSA_r_$inputfiles.fasta
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/realData_Aligned/alignedMSA_r_$inputfiles.best.dnd /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/realData_Aligned/alignedMSA_r_$inputfiles.dnd
done


#In INDELible we have blank rows that is leaf with no characters. These can create error when aligning with A GUIDE TREE. so seperate tree is generated for this data internally by PRANK
for inputfiles in 8 12 31 34 43 45 57 74 87 89 98;
do  
	# 1 INDELible Data
	prank -d=/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible/out_"$inputfiles"_TRUE_1.fasta -o=/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles -F -showtree -once
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.best.fas /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.fasta
	mv /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.best.dnd /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned/alignedMSA_I_$inputfiles.dnd
done






# PRANK Alignment output paths
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/INDELible_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/ProPIP_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_PRANK/realData_Aligned

# MAFFT Alignment output paths
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/ProPIP_Aligned
# /Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned

# ProPIP Alignment output paths 
# Present inside each params file