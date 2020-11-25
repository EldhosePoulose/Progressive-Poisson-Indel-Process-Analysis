function mat2fasta(path,filename,msa,mat)

for i=1:length(msa)
   msa(i).Sequence=mat(i,:); 
end

fastawrite(fullfile(strcat(path,filename)),msa)
