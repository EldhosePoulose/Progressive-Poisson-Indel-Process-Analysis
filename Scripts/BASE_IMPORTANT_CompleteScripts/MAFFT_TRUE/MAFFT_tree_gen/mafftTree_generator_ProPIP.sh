#Create a New file 
#for msafile in {1..4};
#do
#	echo > real_$msafile.newick;
#done

#This generates tree for the given alignment using PRANK aligner. The input and output directories as specified directly

cd /Users/pouloeld/Desktop
for treefile in {1..100};
do
	ruby ./newick2mafft.rb 1.0 /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP/mafftTree_P_$treefile.newick > /Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP/mafftTree_P_$treefile.mafft  
done



