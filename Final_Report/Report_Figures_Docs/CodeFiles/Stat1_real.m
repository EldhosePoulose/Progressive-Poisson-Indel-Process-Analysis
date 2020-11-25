clc
clear all

% Date: 15.04.2020
%% This process is with real data 
%% Add paths
addpath("/Users/pouloeld/Documents/Statistics2/real/True")
addpath("/Users/pouloeld/Documents/Statistics2/real/MAFFT")
addpath("/Users/pouloeld/Documents/Statistics2/real/PRANK")
addpath("/Users/pouloeld/Documents/Statistics2/real/ProPIP")


%% Readin TRUE MSA
%INDELible
True_r_Path="/Users/pouloeld/Documents/Statistics2/real/True"; 
True_r_files= dir(fullfile(True_r_Path,'*.fasta'));
True_r_Names= {True_r_files.name};
tk_r= regexp(True_r_Names,'((?<=realData_)\d*)','match');
[~,tr]= sortrows(str2double(cat(1,tk_r{:})));
True_r_Names= True_r_Names(tr);
nIter_r= length(True_r_Names);

%% Readin all Inferred MSAs
% MAFFT
Inf_r_Path1= "/Users/pouloeld/Documents/Statistics2/real/MAFFT"; 
Inf_r_files1= dir(fullfile(Inf_r_Path1,'*.fasta'));
Inf_r_Names1= {Inf_r_files1.name};
tk_r1= regexp(Inf_r_Names1,'((?<=mafftInferredMSA_r_)\d*)','match');
[~,tr1]= sortrows(str2double(cat(1,tk_r1{:})));
Inf_r_Names1= Inf_r_Names1(tr1); 
nIter_r1= length(Inf_r_Names1);
% PRANK
Inf_r_Path2= "/Users/pouloeld/Documents/Statistics2/real/PRANK"; 
Inf_r_files2= dir(fullfile(Inf_r_Path2,'*.fasta'));
Inf_r_Names2= {Inf_r_files2.name};
tk_r2= regexp(Inf_r_Names2,'((?<=prankInferredMSA_r_)\d*)','match');
[~,tr2]= sortrows(str2double(cat(1,tk_r2{:})));
Inf_r_Names2= Inf_r_Names2(tr2); 
nIter_r2= length(Inf_r_Names2);
% ProPIP
Inf_r_Path3= "/Users/pouloeld/Documents/Statistics2/real/ProPIP"; 
Inf_r_files3= dir(fullfile(Inf_r_Path3,'*.fasta'));
Inf_r_Names3= {Inf_r_files3.name};
tk_r3= regexp(Inf_r_Names3,'((?<=ProPIPinferredMSA_r_)\d*)','match');
[~,tr3]= sortrows(str2double(cat(1,tk_r3{:})));
Inf_r_Names3= Inf_r_Names3(tr3); 
nIter_r3= length(Inf_r_Names3);


%% INDEL length per True_MSA

%% INDELible
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


%% INDEL length per Inf_MSA

%% MAFFT
count=0;
Inf_r_count1= [];
for namesr1=1:nIter_r1
    Inf_r_MSA1= fastaread(Inf_r_Names1(namesr1));
    for nTaxa=1:13
        for seqL=1:length(Inf_r_MSA1(nTaxa).Sequence)
            if Inf_r_MSA1(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_r_MSA1(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_r_count1= [Inf_r_count1,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_r_count1= [Inf_r_count1,count];
            count=0;
        end            
    end
MsaL_r1= seqL;      
end

%% PRANK
count=0;
Inf_r_count2= [];
for namesr2=1:nIter_r2
    Inf_r_MSA2= fastaread(Inf_r_Names2(namesr2));
    for nTaxa=1:13
        for seqL=1:length(Inf_r_MSA2(nTaxa).Sequence)
            if Inf_r_MSA2(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_r_MSA2(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_r_count2= [Inf_r_count2,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_r_count2= [Inf_r_count2,count];
            count=0;
        end            
    end
MsaL_r2= seqL;      
end

%% ProPIP
count=0;
Inf_r_count3= [];
for namesr3=1:nIter_r3
    Inf_r_MSA3= fastaread(Inf_r_Names3(namesr3));
    for nTaxa=1:13
        for seqL=1:length(Inf_r_MSA3(nTaxa).Sequence)
            if Inf_r_MSA3(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_r_MSA3(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_r_count3= [Inf_r_count3,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_r_count3= [Inf_r_count3,count];
            count=0;
        end            
    end
MsaL_r3= seqL;      
end


stat{1}= [length(True_r_count),max(True_r_count),mean(True_r_count),
                    median(True_r_count),std(True_r_count)];
stat1{1}= [length(Inf_r_count1),max(Inf_r_count1),mean(Inf_r_count1),
                    median(Inf_r_count1),std(Inf_r_count1)];
stat2{1}= [length(Inf_r_count2),max(Inf_r_count2),mean(Inf_r_count2),
                    median(Inf_r_count2),std(Inf_r_count2)];
stat3{1}= [length(Inf_r_count3),max(Inf_r_count3),mean(Inf_r_count3),
                    median(Inf_r_count3),std(Inf_r_count3)];
