function mat=msa2matrix(msa)

nseq=length(msa);
ncol=length(msa(1).Sequence);

for i=2:nseq
    if length(msa(i).Sequence) ~= ncol
        error('ERROR')
    end
end

mat=char(zeros(nseq,ncol));

for i=1:nseq
    mat(i,:)=msa(i).Sequence;
end
