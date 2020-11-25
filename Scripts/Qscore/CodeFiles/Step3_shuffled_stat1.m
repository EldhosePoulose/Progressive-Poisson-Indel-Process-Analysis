clc
clear all

%% Add PATH
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava/reshuffled")

addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/PIPJava/reshuffled")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/PIPJava/reshuffled")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava/reshuffled")

%% reshuffled MSAs

%PIPJava
True_P_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava/reshuffled"; 
True_P_files= dir(fullfile(True_P_Path,'*_MSA_new.fasta'));
True_P_Names= {True_P_files.name};
tk_p= regexp(True_P_Names,'((?<=sim-)\d*)|((?<=_MSA_new))','match');
[~,tp]= sortrows(str2double(cat(1,tk_p{:})));
True_P_Names= True_P_Names(tp); %ti for INDELible tp for PIPJava tr for real
nIter_P= length(True_P_Names);

% Tool 1
Inf_P_Path1="/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/PIPJava/reshuffled"; 
Inf_P_files1= dir(fullfile(Inf_P_Path1,'*.fasta'));
Inf_P_Names1= {Inf_P_files1.name};
tk_p1= regexp(Inf_P_Names1,'((?<=mafftInferredMSA_P_)\d*)','match');
[~,tp1]= sortrows(str2double(cat(1,tk_p1{:})));
Inf_P_Names1= Inf_P_Names1(tp1); %tii for INDELible tpp for PIPJava trr for real
nIter_P1= length(Inf_P_Names1);

% Tool 2
Inf_P_Path2="/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/PIPJava/reshuffled"; 
Inf_P_files2= dir(fullfile(Inf_P_Path2,'*.fasta'));
Inf_P_Names2= {Inf_P_files2.name};
tk_p2= regexp(Inf_P_Names2,'((?<=prankInferredMSA_P_)\d*)','match');
[~,tp2]= sortrows(str2double(cat(1,tk_p2{:})));
Inf_P_Names2= Inf_P_Names2(tp2); %tii for INDELible tpp for PIPJava trr for real
nIter_P2= length(Inf_P_Names2);

% Tool 3
Inf_P_Path3="/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava/reshuffled"; 
Inf_P_files3= dir(fullfile(Inf_P_Path3,'*.fasta'));
Inf_P_Names3= {Inf_P_files3.name};
tk_p3= regexp(Inf_P_Names3,'((?<=ProPIPinferredMSA_P_)\d*)','match');
[~,tp3]= sortrows(str2double(cat(1,tk_p3{:})));
Inf_P_Names3= Inf_P_Names3(tp3); %tii for INDELible tpp for PIPJava trr for real
nIter_P3= length(Inf_P_Names3);

%% INDEL length- TRUE MSA 
% PIPJava
count=0;
True_P_count= [];
for namesP=1:nIter_P
    True_P_MSA= fastaread(True_P_Names(namesP));
    for nTaxa=1:8
        for seqL=1:length(True_P_MSA(nTaxa).Sequence)
            if True_P_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif True_P_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    True_P_count= [True_P_count,count];
                    count=0;
                end
            end
        end
        if count ~=0
            True_P_count= [True_P_count,count];
            count=0;
        end            
     end
end


figure,
histogram(True_P_count,'Normalization','probability')
xlabel('INDEL length per sequence')
ylabel('probability')
title("INDEL length per sequence, True.MSA -PIPJava data")

%% Tool1
count=0;
Inf_P_count1= [];
for namesP1=1:nIter_P1
    Inf_P_MSA1= fastaread(Inf_P_Names1(namesP1));
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA1(nTaxa).Sequence)
            if Inf_P_MSA1(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA1(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count1= [Inf_P_count1,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count1= [Inf_P_count1,count];
            count=0;
        end            
     end
end


figure,
histogram(Inf_P_count1,'Normalization','probability')
xlabel('INDEL length per sequence')
ylabel('probability')
title("INDEL length per sequence, MAFFT-Inferred-Shuffled-MSA -PIPJava data")

%% Tool2
count=0;
Inf_P_count2= [];
for namesP2=1:nIter_P2
    Inf_P_MSA2= fastaread(Inf_P_Names2(namesP2));
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA2(nTaxa).Sequence)
            if Inf_P_MSA2(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA2(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count2= [Inf_P_count2,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count2= [Inf_P_count2,count];
            count=0;
        end            
     end
end

figure,
histogram(Inf_P_count2,'Normalization','probability')
xlabel('INDEL length per sequence')
ylabel('probability')
title("INDEL length per sequence, PRANK-Inferred-Shuffled-MSA -PIPJava data")

%% Tool3
count=0;
Inf_P_count3= [];
for namesP3=1:nIter_P3
    Inf_P_MSA3= fastaread(Inf_P_Names3(namesP3));
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA3(nTaxa).Sequence)
            if Inf_P_MSA3(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA3(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count3= [Inf_P_count3,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count3= [Inf_P_count3,count];
            count=0;
        end            
     end
end

figure,
histogram(Inf_P_count3,'Normalization','probability')
xlabel('INDEL length per sequence')
ylabel('probability')
title("INDEL length per sequence, ProPIP-Inferred-Shuffled-MSA -PIPJava data")



