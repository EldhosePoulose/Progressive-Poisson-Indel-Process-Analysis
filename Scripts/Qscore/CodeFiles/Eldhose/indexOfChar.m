function col=indexOfChar(idx,k)

nseq=size(idx,1);
col=NaN(nseq,1);
for w=1:nseq
    [val,pos]=find(idx(w,:)==k);
    if isempty(val)
        col(w)=NaN;
    else
        col(w)=pos;
    end
end