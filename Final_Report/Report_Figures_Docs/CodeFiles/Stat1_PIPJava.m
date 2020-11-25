clc
clear all

% Date: 15.04.2020
%% This process is with PIPJava data without reshuffling
%% Add paths
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/True")
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/MAFFT")
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/PRANK")
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP")


%% Readin TRUE MSA
%INDELible
True_P_Path="/Users/pouloeld/Documents/Statistics2/PIPJava/True"; 
True_P_files= dir(fullfile(True_P_Path,'*_MSA.fasta'));
True_P_Names= {True_P_files.name};
tk_p= regexp(True_P_Names,'((?<=sim-)\d*)|((?<=_MSA))','match');
[~,tp]= sortrows(str2double(cat(1,tk_p{:})));
True_P_Names= True_P_Names(tp); 
nIter_P= length(True_P_Names);

%% Readin all Inferred MSAs
% MAFFT
Inf_P_Path1= "/Users/pouloeld/Documents/Statistics2/PIPJava/MAFFT"; 
Inf_P_files1= dir(fullfile(Inf_P_Path1,'*.fasta'));
Inf_P_Names1= {Inf_P_files1.name};
tk_p1= regexp(Inf_P_Names1,'((?<=mafftInferredMSA_P_)\d*)','match');
[~,tp1]= sortrows(str2double(cat(1,tk_p1{:})));
Inf_P_Names1= Inf_P_Names1(tp1);
nIter_P1= length(Inf_P_Names1);
% PRANK
Inf_P_Path2= "/Users/pouloeld/Documents/Statistics2/PIPJava/PRANK"; 
Inf_P_files2= dir(fullfile(Inf_P_Path2,'*.fasta'));
Inf_P_Names2= {Inf_P_files2.name};
tk_p2= regexp(Inf_P_Names2,'((?<=prankInferredMSA_P_)\d*)','match');
[~,tp2]= sortrows(str2double(cat(1,tk_p2{:})));
Inf_P_Names2= Inf_P_Names2(tp2); 
nIter_P2= length(Inf_P_Names2);
% ProPIP
Inf_P_Path3= "/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP"; 
Inf_P_files3= dir(fullfile(Inf_P_Path3,'*.fasta'));
Inf_P_Names3= {Inf_P_files3.name};
tk_p3= regexp(Inf_P_Names3,'((?<=ProPIPinferredMSA_P_)\d*)','match');
[~,tp3]= sortrows(str2double(cat(1,tk_p3{:})));
Inf_P_Names3= Inf_P_Names3(tp3); 
nIter_P3= length(Inf_P_Names3);


%% INDEL length per True_MSA

%% INDELible
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


%% INDEL length per Inf_MSA

%% MAFFT
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
MsaL_I1= seqL;      
end

%% PRANK
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
MsaL_PS2= seqL;      
end

%% ProPIP
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
MsaL_P3= seqL;      
end


stat{1}= [length(True_P_count),max(True_P_count),mean(True_P_count),
                    median(True_P_count),std(True_P_count)];
stat1{1}= [length(Inf_P_count1),max(Inf_P_count1),mean(Inf_P_count1),
                    median(Inf_P_count1),std(Inf_P_count1)];
stat2{1}= [length(Inf_P_count2),max(Inf_P_count2),mean(Inf_P_count2),
                    median(Inf_P_count2),std(Inf_P_count2)];
stat3{1}= [length(Inf_P_count3),max(Inf_P_count3),mean(Inf_P_count3),
                    Pmedian(Inf_P_count3),std(Inf_P_count3)];
