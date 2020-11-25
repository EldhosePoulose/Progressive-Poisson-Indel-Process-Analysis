
count=0;
alist= [];

for namesI=1:1
    %True_I_MSA= fastaread(True_I_Names(namesI));
    for nTaxa=1:2
        for seqL=1:length(True_I_MSA(nTaxa).Sequence)
            if True_I_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif True_I_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    alist= [alist,count];
                    count=0;
                end
            end
        end
        if count ~=0
            alist= [alist,count];
            count=0;
        end            
     end
end