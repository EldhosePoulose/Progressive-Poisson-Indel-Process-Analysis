#This generates tree for the given alignment using PRANK aligner.

for nF in {1..4};
do
	prank -d=./realData_$nF.fasta -o=./real_$nF.newick -treeonly  
done



