function idx=mat2idx(mat)

nseq=size(mat,1);
ncol=size(mat,2);

idx=zeros(nseq,ncol);
for i=1:nseq
    count=1;
    for j=1:ncol
        if mat(i,j) ~= '-'
           idx(i,j)=count;
           count=count+1;
        end
    end
end