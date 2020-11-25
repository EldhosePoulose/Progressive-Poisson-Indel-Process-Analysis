function [Inf_I_count1,stat1]= IndelLengthdist(path,fileName)
    Inf_I_Path1= path; 
    addpath(Inf_I_Path1)

    %% Readin all Inferred MSAs
    % MSAs
    Inf_I_files1= dir(fullfile(Inf_I_Path1,'*.fasta'));
    Inf_I_Names1= {Inf_I_files1.name};
    tk_i1= regexp(Inf_I_Names1,fileName,'match');
    % strcat('((?<=',fileName1,')\d*)','|((?<=',fileName2,'))')
    [~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
    Inf_I_Names1= Inf_I_Names1(ti1); %tii for INDELible tpp for PIPJava trr for real
    nIter_I1= length(Inf_I_Names1);

    %% Indel Length Distribution
    count=0;
    Inf_I_count1= [];
    for namesI1=1:nIter_I1
        Inf_I_MSA1= fastaread(Inf_I_Names1(namesI1));
        for nTaxa=1:length(Inf_I_MSA1)
            for seqL=1:length(Inf_I_MSA1(nTaxa).Sequence)
                if Inf_I_MSA1(nTaxa).Sequence(seqL) == '-'
                    count= count+1;
                elseif Inf_I_MSA1(nTaxa).Sequence(seqL) ~= '-'
                    if count ~= 0
                        Inf_I_count1= [Inf_I_count1,count];
                        count=0;
                    end
                end
            end
            if count ~=0
                Inf_I_count1= [Inf_I_count1,count];
                count=0;
            end            
        end
    MsaL_I1= seqL;
    fprintf("Indel length Extraction...now:%d\n",namesI1)
    end
    stat1{1}= [length(Inf_I_count1),max(Inf_I_count1),mean(Inf_I_count1),median(Inf_I_count1),std(Inf_I_count1)];

end
