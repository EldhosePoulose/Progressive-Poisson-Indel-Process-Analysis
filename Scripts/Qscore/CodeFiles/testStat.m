clc
clear all
%% This is a Testing platform

%% True MSA/Expected

MSA_names= dir(fullfile(pwd,'*_.fasta'));
MSA_names= {MSA_names.name};
count=0;
Tcount= [];
for files=1:2
    True_MSA= fastaread(MSA_names(files));
    for nTaxa=1:2
        for seqL=1:length(True_MSA(nTaxa).Sequence)
            if True_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif True_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Tcount= [Tcount,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Tcount= [Tcount,count];
            count=0;
        end            
     end
end

%figure,histogram(Tcount,'Normalization','probability')
%tabulate(Tcount)

%% Inferred MSA/Observed

Inf_MSA_names= dir(fullfile(pwd,'*Inf.fasta'));
Inf_MSA_names= {Inf_MSA_names.name};
Inf_count=0;
Inf_Tcount= [];
for Inf_files=1:2
    testMSA= fastaread(Inf_MSA_names(Inf_files));
    for nTaxa=1:2
        for seqL=1:length(testMSA(nTaxa).Sequence)
            if testMSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif testMSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_Tcount= [Inf_Tcount,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_Tcount= [Inf_Tcount,count];
            count=0;
        end            
     end
end

T_data= tabulate(Tcount);
Inf_data= tabulate(Inf_Tcount);
T_freq= T_data(:,1:2)';
I_freq= Inf_data(:,1:2)';
padsize= abs(length(I_freq)-length(T_freq));
if length(I_freq) < length(T_freq)
    padVal(1,:)= length(I_freq)+1:length(T_freq);
    padVal(2,:)= zeros(1,padsize);
    I_freq= [I_freq(1:2,:),padVal(1:2,:)];
else
    padVal(1,:)= length(T_freq)+1:length(I_freq);
    padVal(2,:)= zeros(1,padsize);
    I_freq= [T_freq(1:2,:),padVal(1:2,:)];
end




