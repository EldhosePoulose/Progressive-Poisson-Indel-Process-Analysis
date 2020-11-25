clc
clear all
% List of TRUE MSA length INDELible, PIPJava, real
% List of MAFFT_Inferred MSA length INDELible, PIPJava, real

%% Add PATH
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/INDELible")
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/real")

addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/INDELible")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/real")
%% Readin all TRUE MSAs
%INDELible
True_I_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/INDELible"; 
True_I_files= dir(fullfile(True_I_Path,'*_TRUE_1.fasta'));
True_I_Names= {True_I_files.name};
tk_i= regexp(True_I_Names,'((?<=out_)\d*)|((?<=_TRUE_1))','match');
[~,ti]= sortrows(str2double(cat(1,tk_i{:})));
True_I_Names= True_I_Names(ti); %ti for INDELible tp for PIPJava tr for real
nIter_I= length(True_I_Names);
%PIPJava
True_P_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava"; 
True_P_files= dir(fullfile(True_P_Path,'*_MSA.fasta'));
True_P_Names= {True_P_files.name};
tk_p= regexp(True_P_Names,'((?<=sim-)\d*)|((?<=_MSA))','match');
[~,tp]= sortrows(str2double(cat(1,tk_p{:})));
True_P_Names= True_P_Names(tp); %ti for INDELible tp for PIPJava tr for real
nIter_P= length(True_P_Names);
%real
True_r_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/real"; 
True_r_files= dir(fullfile(True_r_Path,'*.fasta'));
True_r_Names= {True_r_files.name};
tk_r= regexp(True_r_Names,'((?<=realData_)\d*)','match');
[~,tir]= sortrows(str2double(cat(1,tk_r{:})));
True_r_Names= True_r_Names(tir); %ti for INDELible tp for PIPJava tr for real
nIter_r= length(True_r_Names);

%% TOOL 3
%% Readin all ProPIP Inferred MSAs change all True to Inf here
%INDELible
Inf_I_Path= "/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/INDELible"; 
Inf_I_files= dir(fullfile(Inf_I_Path,'*.fasta'));
Inf_I_Names= {Inf_I_files.name};
tk_ii= regexp(Inf_I_Names,'((?<=ProPIPinferredMSA_I_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk_ii{:})));
Inf_I_Names= Inf_I_Names(tii); %tii for INDELible tpp for PIPJava trr for real
nIter_Ii= length(Inf_I_Names);
%PIPJava
Inf_P_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava"; 
Inf_P_files= dir(fullfile(Inf_P_Path,'*.fasta'));
Inf_P_Names= {Inf_P_files.name};
tk_pp= regexp(Inf_P_Names,'((?<=ProPIPinferredMSA_P_)\d*)','match');
[~,tpp]= sortrows(str2double(cat(1,tk_pp{:})));
Inf_P_Names= Inf_P_Names(tpp); %tii for INDELible tpp for PIPJava trr for real
nIter_Pp= length(Inf_P_Names);
%real
Inf_r_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/real"; 
Inf_r_files= dir(fullfile(Inf_r_Path,'*.fasta'));
Inf_r_Names= {Inf_r_files.name};
tk_rr= regexp(Inf_r_Names,'((?<=ProPIPinferredMSA_r_)\d*)','match');
[~,trr]= sortrows(str2double(cat(1,tk_rr{:})));
Inf_r_Names= Inf_r_Names(trr); %tii for INDELible tpp for PIPJava trr for real
nIter_rr= length(Inf_r_Names);


%% INDEL length per True_MSA

%% INDELible
count=0;
True_I_count= [];
for namesI=1:nIter_I
    True_I_MSA= fastaread(True_I_Names(namesI));
    for nTaxa=1:8
        for seqL=1:length(True_I_MSA(nTaxa).Sequence)
            if True_I_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif True_I_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    True_I_count= [True_I_count,count];
                    count=0;
                end
            end
        end
        if count ~=0
            True_I_count= [True_I_count,count];
            count=0;
        end            
    end
MsaL_I= seqL;     
end
% 
% figure,
% histogram(True_I_count,'Normalization','probability')
% xlabel('INDEL length per sequence')
% ylabel('probability')
% title("INDEL length per sequence, True.MSA -INDELible data")
% 


%% PIPJava
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
MsaL_P= seqL;     
end

% figure,
% histogram(True_P_count,'Normalization','probability')
% xlabel('INDEL length per sequence')
% ylabel('probability')
% title("INDEL length per sequence, True.MSA -PIP data")

%% real
count=0;
True_r_count= [];
for namesr=1:nIter_r
    True_r_MSA= fastaread(True_r_Names(namesr));
    for nTaxa=1:13
        for seqL=1:length(True_r_MSA(nTaxa).Sequence)
            if True_r_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif True_r_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    True_r_count= [True_r_count,count];
                    count=0;
                end
            end
        end
        if count ~=0
            True_r_count= [True_r_count,count];
            count=0;
        end            
    end
MsaL_r= seqL;     
end
% 
% figure,
% histogram(True_r_count,'Normalization','probability')
% xlabel('INDEL length per sequence')
% ylabel('probability')
% title("INDEL length per sequence, True.MSA -real data")

%% INDEL length per Inf_MSA

%% INDELible
count=0;
Inf_I_count= [];
for namesIi=1:nIter_Ii
    Inf_I_MSA= fastaread(Inf_I_Names(namesIi));
    for nTaxa=1:8
        for seqL=1:length(Inf_I_MSA(nTaxa).Sequence)
            if Inf_I_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_I_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_I_count= [Inf_I_count,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_I_count= [Inf_I_count,count];
            count=0;
        end            
    end
MsaL_Ii= seqL;     
end
% 
% figure,
% histogram(Inf_I_count,'Normalization','probability')
% xlabel('INDEL length per sequence')
% ylabel('probability')
% title("INDEL length per sequence, ProPIP.Inf.MSA -INDELible data")
% 

%% PIPJava
count=0;
Inf_P_count= [];
for namesPp=1:nIter_Pp
    Inf_P_MSA= fastaread(Inf_P_Names(namesPp));
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA(nTaxa).Sequence)
            if Inf_P_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count= [Inf_P_count,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count= [Inf_P_count,count];
            count=0;
        end            
    end
MsaL_Pp= seqL;     
end
% 
% figure,
% histogram(Inf_P_count,'Normalization','probability')
% xlabel('INDEL length per sequence')
% ylabel('probability')
% title("INDEL length per sequence, ProPIP.Inf.MSA -PIP data")
% 

%% real
count=0;
Inf_r_count= [];
for namesrr=1:nIter_rr
    Inf_r_MSA= fastaread(Inf_r_Names(namesrr));
    for nTaxa=1:13
        for seqL=1:length(Inf_r_MSA(nTaxa).Sequence)
            if Inf_r_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_r_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_r_count= [Inf_r_count,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_r_count= [Inf_r_count,count];
            count=0;
        end            
    end
MsaL_rr= seqL;     
end

% figure,
% histogram(Inf_r_count,'Normalization','probability')
% xlabel('INDEL length per sequence')
% ylabel('probability')
% title("INDEL length per sequence, Inf.MSA -real data")
% 
% 
% 



