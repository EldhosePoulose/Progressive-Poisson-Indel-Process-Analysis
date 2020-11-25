function mat2fasta(filename,msa,mat)

for i=1:length(msa)
   msa(i).Sequence=mat(i,:); 
end

fastawrite(filename,msa)