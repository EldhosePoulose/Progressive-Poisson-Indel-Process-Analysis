clc
clear all

% Date: 18.04.2020
%% This process is with INDELible data with cut-off, m=20
%% Add paths
baseType0= 'n_4_a_0_5'; % % %
baseType1= 'n_4_a_1_0';
baseType2= 'n_4_a_2_0';
baseType3= 'n_4_a_3_0';

addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/True/wo_shuffling")
addpath(strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType0))
addpath(strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType1))
addpath(strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType2))
addpath(strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType3))


%% Readin TRUE MSA
%PIPJava
True_P_Path="/Users/pouloeld/Documents/Statistics2/PIPJava/True/wo_shuffling"; 
True_P_files= dir(fullfile(True_P_Path,'*_MSA.fasta'));
True_P_Names= {True_P_files.name};
tk_i= regexp(True_P_Names,'((?<=sim-)\d*)|((?<=_MSA))','match');
[~,ti]= sortrows(str2double(cat(1,tk_i{:})));
True_P_Names= True_P_Names(ti); %ti for INDELible tp for PIPJava tr for real
nIter_P= length(True_P_Names);

%% Readin all Inferred MSAs

% ProPIP + Gamma n=4, a=0.5
Inf_P_Path0= strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType0); 
Inf_P_files0= dir(fullfile(Inf_P_Path0,'*.fasta'));
Inf_P_Names0= {Inf_P_files0.name};
tk_i0= regexp(Inf_P_Names0,'((?<=ProPIPgamma0inferredMSA_P_)\d*)','match');
[~,ti0]= sortrows(str2double(cat(1,tk_i0{:})));
Inf_P_Names0= Inf_P_Names0(ti0); %tii for INDELible tpp for PIPJava trr for real
nIter_P0= length(Inf_P_Names0);

% ProPIP + Gamma n=4, a=1.0
Inf_P_Path1= strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType1); 
Inf_P_files1= dir(fullfile(Inf_P_Path1,'*.fasta'));
Inf_P_Names1= {Inf_P_files1.name};
tk_i1= regexp(Inf_P_Names1,'((?<=ProPIPgamma1inferredMSA_P_)\d*)','match');
[~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
Inf_P_Names1= Inf_P_Names1(ti1); %tii for INDELible tpp for PIPJava trr for real
nIter_P1= length(Inf_P_Names1);

% ProPIP + Gamma n=4, a=2.0
Inf_P_Path2= strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType2); 
Inf_P_files2= dir(fullfile(Inf_P_Path2,'*.fasta'));
Inf_P_Names2= {Inf_P_files2.name};
tk_i2= regexp(Inf_P_Names2,'((?<=ProPIPgamma2inferredMSA_P_)\d*)','match');
[~,ti2]= sortrows(str2double(cat(1,tk_i2{:})));
Inf_P_Names2= Inf_P_Names2(ti2); %tii for INDELible tpp for PIPJava trr for real
nIter_P2= length(Inf_P_Names2);

% ProPIP + Gamma n=4, a=3.0
Inf_P_Path3= strcat('/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/Gamma','/',baseType3); 
Inf_P_files3= dir(fullfile(Inf_P_Path3,'*.fasta'));
Inf_P_Names3= {Inf_P_files3.name};
tk_i3= regexp(Inf_P_Names3,'((?<=ProPIPgamma3inferredMSA_P_)\d*)','match');
[~,ti3]= sortrows(str2double(cat(1,tk_i3{:})));
Inf_P_Names3= Inf_P_Names3(ti3); %tii for INDELible tpp for PIPJava trr for real
nIter_P3= length(Inf_P_Names3);


%% INDEL length per True_MSA

%% PIPJava
count=0;
True_P_count= [];
for namesP=1:nIter_P0
    True_P_MSA= fastaread(True_P_Names(namesP));
    True_P_countMSA= [];
    for nTaxa=1:8
        for seqL=1:length(True_P_MSA(nTaxa).Sequence)
            if True_P_MSA(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif True_P_MSA(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    True_P_count= [True_P_count,count];
                    True_P_countMSA= [True_P_countMSA,count];
                    count=0;
                end
            end
        end
        if count ~=0
            True_P_count= [True_P_count,count];
            True_P_countMSA= [True_P_countMSA,count];
            count=0;
        end            
    end
    
%     figure,
%     histogram(True_P_countMSA,'Normalization','count')
%     title(strcat('True-PIPJava_MSA',int2str(namesP)))
%     xlabel('Indel length')
%     ylabel('frequency')
     
    %MsaL_P= seqL;    
end

    figure,
    histogram(True_P_countMSA,'Normalization','count')
    title(strcat('True-PIPJava_MSA',int2str(namesP)))
    xlabel('Indel length')
    ylabel('frequency')


%% INDEL length per Inf_MSA

%% ProPIP + Gamma n=4, a=0.5

count=0;
Inf_P_count0= [];
maxMSA0=0;
for namesP0=1:nIter_P0
    Inf_P_MSA0= fastaread(Inf_P_Names0(namesP0));
    Inf_P_countMSA0= [];
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA0(nTaxa).Sequence)
            if Inf_P_MSA0(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA0(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count0= [Inf_P_count0,count];
                    Inf_P_countMSA0= [Inf_P_countMSA0,count];
%                     if count>29
%                         maxMSA0=namesP0;
%                     end
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count0= [Inf_P_count0,count];
            Inf_P_countMSA0= [Inf_P_countMSA0,count];
%             if count>29
%                 maxMSA0=namesP0;
%             end
            count=0;
        end
    end
    
%     if namesP0==41
%         MSA_stats{1}= [length(Inf_P_countMSA0),max(Inf_P_countMSA0),mean(Inf_P_countMSA0),median(Inf_P_countMSA0),std(Inf_P_countMSA0)];          
%     end
%     
%     disp(namesP0)
%     disp(Inf_P_countMSA0)
%     
%     figure,
%     histogram(Inf_P_countMSA0,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=0.5,Inferred-MSA',int2str(namesP0)))
%     xlabel('Indel length')
%     ylabel('frequency')
    
    
  
    %MsaL_P0= seqL;

end

    
    figure,
    histogram(Inf_P_countMSA0,'Normalization','count')
    title(strcat('ProPIP+Gamma-n=4,a=0.5,Inferred-MSA',int2str(namesP0)))
    xlabel('Indel length')
    ylabel('frequency')

%% ProPIP + Gamma n=4, a=1.0

count=0;
Inf_P_count1= [];
maxMSA1=0;
for namesP1=1:nIter_P1
    Inf_P_MSA1= fastaread(Inf_P_Names1(namesP1));
    Inf_P_countMSA1= [];
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA1(nTaxa).Sequence)
            if Inf_P_MSA1(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA1(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count1= [Inf_P_count1,count];
                    Inf_P_countMSA1= [Inf_P_countMSA1,count];
%                     if count>29
%                         maxMSA1=namesP1;
%                     end
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count1= [Inf_P_count1,count];
            Inf_P_countMSA1= [Inf_P_countMSA1,count];
%             if count>29
%                 maxMSA1=namesP1;
%             end
            count=0;
        end
    end
    
%     if namesP1==41
%         MSA_stats{1}= [length(Inf_P_countMSA1),max(Inf_P_countMSA1),mean(Inf_P_countMSA1),median(Inf_P_countMSA1),std(Inf_P_countMSA1)];          
%     end
%     
%     disp(namesP1)
%     disp(Inf_P_countMSA1)
%     
%     figure,
%     histogram(Inf_P_countMSA1,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=1.0,-Inferred-MSA',int2str(namesP1)))
%     xlabel('Indel length')
%     ylabel('frequency')
    
    
    
    %MsaL_P1= seqL;

end

    
    figure,
    histogram(Inf_P_countMSA1,'Normalization','count')
    title(strcat('ProPIP+Gamma-n=4,a=1.0,-Inferred-MSA',int2str(namesP1)))
    xlabel('Indel length')
    ylabel('frequency')


%% ProPIP + Gamma n=4, a=2.0

count=0;
Inf_P_count2= [];
maxMSA2=0;
for namesP2=1:nIter_P2
    Inf_P_MSA2= fastaread(Inf_P_Names2(namesP2));
    Inf_P_countMSA2= [];
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA2(nTaxa).Sequence)
            if Inf_P_MSA2(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA2(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count2= [Inf_P_count2,count];
                    Inf_P_countMSA2= [Inf_P_countMSA2,count];
%                     if count>29
%                         maxMSA2=namesP2;
%                     end
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count2= [Inf_P_count2,count];
            Inf_P_countMSA2= [Inf_P_countMSA2,count];
%             if count>29
%                 maxMSA2=namesP2;
%             end
            count=0;
        end
    end
    
%     if namesP2==41
%         MSA_stats{1}= [length(Inf_P_countMSA2),max(Inf_P_countMSA2),mean(Inf_P_countMSA2),median(Inf_P_countMSA2),std(Inf_P_countMSA2)];          
%     end
%     
%     disp(namesP2)
%     disp(Inf_P_countMSA2)
    
%     figure,
%     histogram(Inf_P_countMSA2,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=2.0,-Inferred-MSA',int2str(namesP2)))
%     xlabel('Indel length')
%     ylabel('frequency')
    
    
    %MsaL_P2= seqL;

end

    figure,
    histogram(Inf_P_countMSA2,'Normalization','count')
    title(strcat('ProPIP+Gamma-n=4,a=2.0,-Inferred-MSA',int2str(namesP2)))
    xlabel('Indel length')
    ylabel('frequency')



%% ProPIP + Gamma n=4, a=3.0

count=0;
Inf_P_count3= [];
maxMSA3=0;
for namesP3=1:nIter_P3
    Inf_P_MSA3= fastaread(Inf_P_Names3(namesP3));
    Inf_P_countMSA3= [];
    for nTaxa=1:8
        for seqL=1:length(Inf_P_MSA3(nTaxa).Sequence)
            if Inf_P_MSA3(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_P_MSA3(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_P_count3= [Inf_P_count3,count];
                    Inf_P_countMSA3= [Inf_P_countMSA3,count];
%                     if count>29
%                         maxMSA3=namesP3;
%                     end
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_P_count3= [Inf_P_count3,count];
            Inf_P_countMSA3= [Inf_P_countMSA3,count];
%             if count>29
%                 maxMSA3=namesP3;
%             end
            count=0;
        end
    end
    
%     if namesP3==41
%         MSA_stats{1}= [length(Inf_P_countMSA3),max(Inf_P_countMSA3),mean(Inf_P_countMSA3),median(Inf_P_countMSA3),std(Inf_P_countMSA3)];          
%     end
%     
%     disp(namesP3)
%     disp(Inf_P_countMSA3)
    
%     figure,
%     histogram(Inf_P_countMSA3,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=3.0,-Inferred-MSA',int2str(namesP3)))
%     xlabel('Indel length')
%     ylabel('frequency')   
    
    
    %MsaL_P3= seqL;

end

    figure,
    histogram(Inf_P_countMSA3,'Normalization','count')
    title(strcat('ProPIP+Gamma-n=4,a=3.0,-Inferred-MSA',int2str(namesP3)))
    xlabel('Indel length')
    ylabel('frequency') 

stat{1}= [length(True_P_count),max(True_P_count),mean(True_P_count),median(True_P_count),std(True_P_count)];
stat0{1}= [length(Inf_P_count0),max(Inf_P_count0),mean(Inf_P_count0),median(Inf_P_count0),std(Inf_P_count0)];
stat1{1}= [length(Inf_P_count1),max(Inf_P_count1),mean(Inf_P_count1),median(Inf_P_count1),std(Inf_P_count1)];
stat2{1}= [length(Inf_P_count2),max(Inf_P_count2),mean(Inf_P_count2),median(Inf_P_count2),std(Inf_P_count2)];
stat3{1}= [length(Inf_P_count3),max(Inf_P_count3),mean(Inf_P_count3),median(Inf_P_count3),std(Inf_P_count3)];
