#Create a New file 
#for msafile in {1..4};
#do
#	echo > real_$msafile.newick;
#done

#This generates tree for the given alignment using PRANK aligner. The input and output directories as specified directly

for msafile in {1..4};
do
	prank -d=/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/gappedMSA_realData/realData_$msafile.fasta -o=/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/newicktree_realData/real_$msafile.newick -treeonly  
	mv -v /Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/newicktree_realData/real_$msafile.newick.dnd /Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/newicktree_realData/real_$msafile.newick
done



