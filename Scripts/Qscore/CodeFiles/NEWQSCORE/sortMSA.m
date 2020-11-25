function msa=sortMSA(msa1,msa2)

msa=msa2;
for i=1:length(msa1)
    header1=msa1(i).Header;
    
    idx=NaN;
    for j=1:length(msa2)
        header2=msa2(j).Header;
        if isequal(header1,header2)
            idx=j;
            break;
        end
    end
    
    if isnan(idx)
        error('ERROR: sequence not found')
    end
    
    msa(i).Header=msa2(idx).Header;
    msa(i).Sequence=msa2(idx).Sequence;
    
end
