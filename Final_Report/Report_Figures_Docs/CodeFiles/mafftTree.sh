
#This bash script generates mafft tree for the given newick tree. 
#Example newick tree: 
#((1:0.1,2:0.1):0.3,(3:0.3,(4:0.2,5:0.2):0.1):0.1)
#Name of each leaf must be an Integer
#Branch length must be provided.
#Tree has to be rooted tree
# To run: use the ruby ibterpreter and  newick2mafft.rb script

# INDELible input newick tree
for nF in {1..100};
do
	ruby ./newick2mafft.rb 1.0 ./tree_I_$nF.newick > ./tree_I_$nF.mafft  
done

# PIPJava input newick tree
for treefile in {1..100};
do
	ruby ./newick2mafft.rb 1.0 ./tree_P_$nF.newick > ./tree_I_$nF.mafft  
done

# real data input newick tree
for treefile in {1..4};
do
	ruby ./newick2mafft.rb 1.0 ./tree_r_$nF.newick > ./tree_r_$nF.mafft  
done




