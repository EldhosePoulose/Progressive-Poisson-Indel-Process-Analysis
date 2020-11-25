clc
clear all

% Date: 15.04.2020
%% This process is with INDELible data with cut-off, m=20
%% Add paths
addpath("/Users/pouloeld/Documents/Statistics2/INDELible/True/wo_cutoff")
addpath("/Users/pouloeld/Documents/Statistics2/INDELible/MAFFT/wo_cutoff")
addpath("/Users/pouloeld/Documents/Statistics2/INDELible/PRANK/wo_cutoff")
addpath("/Users/pouloeld/Documents/Statistics2/INDELible/ProPIP/wo_cutoff")


%% Readin TRUE MSA
%INDELible
True_I_Path="/Users/pouloeld/Documents/Statistics2/INDELible/True/wo_cutoff"; 
True_I_files= dir(fullfile(True_I_Path,'*_TRUE_1.fasta'));
True_I_Names= {True_I_files.name};
tk_i= regexp(True_I_Names,'((?<=out_)\d*)|((?<=_TRUE_1))','match');
[~,ti]= sortrows(str2double(cat(1,tk_i{:})));
True_I_Names= True_I_Names(ti); %ti for INDELible tp for PIPJava tr for real
nIter_I= length(True_I_Names);

%% Readin all Inferred MSAs
% MAFFT
Inf_I_Path1= "/Users/pouloeld/Documents/Statistics2/INDELible/MAFFT/wo_cutoff"; 
Inf_I_files1= dir(fullfile(Inf_I_Path1,'*.fasta'));
Inf_I_Names1= {Inf_I_files1.name};
tk_i1= regexp(Inf_I_Names1,'((?<=mafftInferredMSA_I_)\d*)','match');
[~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
Inf_I_Names1= Inf_I_Names1(ti1); %tii for INDELible tpp for PIPJava trr for real
nIter_I1= length(Inf_I_Names1);
% PRANK
Inf_I_Path2= "/Users/pouloeld/Documents/Statistics2/INDELible/PRANK/wo_cutoff"; 
Inf_I_files2= dir(fullfile(Inf_I_Path2,'*.fasta'));
Inf_I_Names2= {Inf_I_files2.name};
tk_i2= regexp(Inf_I_Names2,'((?<=prankInferredMSA_I_)\d*)','match');
[~,ti2]= sortrows(str2double(cat(1,tk_i2{:})));
Inf_I_Names2= Inf_I_Names2(ti2); %tii for INDELible tpp for PIPJava trr for real
nIter_I2= length(Inf_I_Names2);
% ProPIP
Inf_I_Path3= "/Users/pouloeld/Documents/Statistics2/INDELible/ProPIP/wo_cutoff"; 
Inf_I_files3= dir(fullfile(Inf_I_Path3,'*.fasta'));
Inf_I_Names3= {Inf_I_files3.name};
tk_i3= regexp(Inf_I_Names3,'((?<=ProPIPinferredMSA_I_)\d*)','match');
[~,ti3]= sortrows(str2double(cat(1,tk_i3{:})));
Inf_I_Names3= Inf_I_Names3(ti3); %tii for INDELible tpp for PIPJava trr for real
nIter_I3= length(Inf_I_Names3);


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


%% INDEL length per Inf_MSA

%% MAFFT
count=0;
Inf_I_count1= [];
for namesI1=1:nIter_I1
    Inf_I_MSA1= fastaread(Inf_I_Names1(namesI1));
    for nTaxa=1:8
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
end

%% PRANK
count=0;
Inf_I_count2= [];
for namesI2=1:nIter_I2
    Inf_I_MSA2= fastaread(Inf_I_Names2(namesI2));
    for nTaxa=1:8
        for seqL=1:length(Inf_I_MSA2(nTaxa).Sequence)
            if Inf_I_MSA2(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_I_MSA2(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_I_count2= [Inf_I_count2,count];
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_I_count2= [Inf_I_count2,count];
            count=0;
        end            
    end
MsaL_I2= seqL;      
end

%% ProPIP
count=0;
Inf_I_count3= [];
for namesI3=1:nIter_I3
    Inf_I_MSA3= fastaread(Inf_I_Names3(namesI3));
    for nTaxa=1:8
        for seqL=1:length(Inf_I_MSA3(nTaxa).Sequence)
            if Inf_I_MSA3(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_I_MSA3(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_I_count3= [Inf_I_count3,count];
%                     if count>443
%                         maxMSA=namesI3;
%                     end
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_I_count3= [Inf_I_count3,count];
%             if count>443
%                 maxMSA=namesI3;
%             end
            count=0;
        end            
    end
MsaL_I3= seqL;      
end

stat{1}= [length(True_I_count),max(True_I_count),mean(True_I_count),median(True_I_count),std(True_I_count)];
stat1{1}= [length(Inf_I_count1),max(Inf_I_count1),mean(Inf_I_count1),median(Inf_I_count1),std(Inf_I_count1)];
stat2{1}= [length(Inf_I_count2),max(Inf_I_count2),mean(Inf_I_count2),median(Inf_I_count2),std(Inf_I_count2)];
stat3{1}= [length(Inf_I_count3),max(Inf_I_count3),mean(Inf_I_count3),median(Inf_I_count3),std(Inf_I_count3)];