clc
clear all

% Date: 22.04.2020
%% This process is with INDELible data with cut-off, m=20
%% Add paths
% baseType0= 'n_4_a_0_5'; % % %
% baseType1= 'n_4_a_1_0';
% baseType2= 'n_4_a_2_0';
% baseType3= 'n_4_a_3_0';

baseType0= 'n_4_a_0_1';

% addpath("/Users/pouloeld/Documents/Statistics2/real/True/wo_shuffling")
% addpath(strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType0))
% addpath(strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType1))
% addpath(strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType2))
% addpath(strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType3))
addpath(strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType0))

% %% Readin TRUE MSA
% %real
% True_r_Path="/Users/pouloeld/Documents/Statistics2/real/True/wo_shuffling"; 
% True_r_files= dir(fullfile(True_r_Path,'*.fasta'));
% True_r_Names= {True_r_files.name};
% tk_i= regexp(True_r_Names,'((?<=realData_)\d*)','match');
% [~,ti]= sortrows(str2double(cat(1,tk_i{:})));
% True_r_Names= True_r_Names(ti); %ti for INDELible tp for PIPJava tr for real
% nIter_r= length(True_r_Names);

%% Readin all Inferred MSAs

% ProPIP + Gamma n=4, a=0.5
Inf_r_Path0= strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType0); 
Inf_r_files0= dir(fullfile(Inf_r_Path0,'*.fasta'));
Inf_r_Names0= {Inf_r_files0.name};
tk_i0= regexp(Inf_r_Names0,'((?<=ProPIPgamma4inferredMSA_r_)\d*)','match');
[~,ti0]= sortrows(str2double(cat(1,tk_i0{:})));
Inf_r_Names0= Inf_r_Names0(ti0); %tii for INDELible tpp for PIPJava trr for real
nIter_r0= length(Inf_r_Names0);
% 
% % ProPIP + Gamma n=4, a=1.0
% Inf_r_Path1= strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType1); 
% Inf_r_files1= dir(fullfile(Inf_r_Path1,'*.fasta'));
% Inf_r_Names1= {Inf_r_files1.name};
% tk_i1= regexp(Inf_r_Names1,'((?<=ProPIPgamma1inferredMSA_r_)\d*)','match');
% [~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
% Inf_r_Names1= Inf_r_Names1(ti1); %tii for INDELible tpp for PIPJava trr for real
% nIter_r1= length(Inf_r_Names1);
% 
% % ProPIP + Gamma n=4, a=2.0
% Inf_r_Path2= strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType2); 
% Inf_r_files2= dir(fullfile(Inf_r_Path2,'*.fasta'));
% Inf_r_Names2= {Inf_r_files2.name};
% tk_i2= regexp(Inf_r_Names2,'((?<=ProPIPgamma2inferredMSA_r_)\d*)','match');
% [~,ti2]= sortrows(str2double(cat(1,tk_i2{:})));
% Inf_r_Names2= Inf_r_Names2(ti2); %tii for INDELible tpp for PIPJava trr for real
% nIter_r2= length(Inf_r_Names2);
% 
% % ProPIP + Gamma n=4, a=3.0
% Inf_r_Path3= strcat('/Users/pouloeld/Documents/Statistics2/real/ProPIP/Gamma','/',baseType3); 
% Inf_r_files3= dir(fullfile(Inf_r_Path3,'*.fasta'));
% Inf_r_Names3= {Inf_r_files3.name};
% tk_i3= regexp(Inf_r_Names3,'((?<=ProPIPgamma3inferredMSA_r_)\d*)','match');
% [~,ti3]= sortrows(str2double(cat(1,tk_i3{:})));
% Inf_r_Names3= Inf_r_Names3(ti3); %tii for INDELible tpp for PIPJava trr for real
% nIter_r3= length(Inf_r_Names3);


%% INDEL length per True_MSA
% 
% %% real data
% count=0;
% True_r_count= [];
% for namesr=1:nIter_r0
%     True_r_MSA= fastaread(True_r_Names(namesr));
%     True_r_countMSA= [];
%     for nTaxa=1:13
%         for seqL=1:length(True_r_MSA(nTaxa).Sequence)
%             if True_r_MSA(nTaxa).Sequence(seqL) == '-'
%                 count= count+1;
%             elseif True_r_MSA(nTaxa).Sequence(seqL) ~= '-'
%                 if count ~= 0
%                     True_r_count= [True_r_count,count];
%                     True_r_countMSA= [True_r_countMSA,count];
%                     count=0;
%                 end
%             end
%         end
%         if count ~=0
%             True_r_count= [True_r_count,count];
%             True_r_countMSA= [True_r_countMSA,count];
%             count=0;
%         end            
%     end
% %     figure,
% %     histogram(True_r_countMSA,'Normalization','count')
% %     title(strcat('True-real_MSA',int2str(namesr)))
% %     xlabel('Indel length')
% %     ylabel('frequency')
%      
%     %MsaL_r= seqL;    
% end
% 
%     figure,
%     histogram(True_r_countMSA,'Normalization','count')
%     title(strcat('True-real_MSA',int2str(namesr)))
%     xlabel('Indel length')
%     ylabel('frequency')


%% INDEL length per Inf_MSA

%% ProPIP + Gamma n=4, a=0.5

count=0;
Inf_r_count0= [];
maxMSA0=0;
for namesr0=1:nIter_r0
    Inf_r_MSA0= fastaread(Inf_r_Names0(namesr0));
    Inf_r_countMSA0= [];
    for nTaxa=1:13
        for seqL=1:length(Inf_r_MSA0(nTaxa).Sequence)
            if Inf_r_MSA0(nTaxa).Sequence(seqL) == '-'
                count= count+1;
            elseif Inf_r_MSA0(nTaxa).Sequence(seqL) ~= '-'
                if count ~= 0
                    Inf_r_count0= [Inf_r_count0,count];
                    Inf_r_countMSA0= [Inf_r_countMSA0,count];
%                     if count>29
%                         maxMSA=namesr0;
%                     end
                    count=0;
                end
            end
        end
        if count ~=0
            Inf_r_count0= [Inf_r_count0,count];
            Inf_r_countMSA0= [Inf_r_countMSA0,count];
%             if count>29
%                 maxMSA=namesr0;
%             end
            count=0;
        end
    end
    
%     if namesr0==41
%         MSA_stats{1}= [length(Inf_r_countMSA0),max(Inf_r_countMSA0),mean(Inf_r_countMSA0),median(Inf_r_countMSA0),std(Inf_r_countMSA0)];          
%     end
%     
%     disp(namesr0)
%     disp(Inf_r_countMSA0)
%     
%     figure,
%     histogram(Inf_r_countMSA0,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=0.5,Inferred-MSA',int2str(namesr0)))
%     xlabel('Indel length')
%     ylabel('frequency')
    
    
  
    %MsaL_r0= seqL;

end

    
    figure,
    histogram(Inf_r_countMSA0,'Normalization','count')
    title(strcat('ProPIP+Gamma-n=4,a=0.5,Inferred-MSA',int2str(namesr0)))
    xlabel('Indel length')
    ylabel('frequency')

% %% ProPIP + Gamma n=4, a=1.0
% 
% count=0;
% Inf_r_count1= [];
% maxMSA1=0;
% for namesr1=1:nIter_r1
%     Inf_r_MSA1= fastaread(Inf_r_Names1(namesr1));
%     Inf_r_countMSA1= [];
%     for nTaxa=1:13
%         for seqL=1:length(Inf_r_MSA1(nTaxa).Sequence)
%             if Inf_r_MSA1(nTaxa).Sequence(seqL) == '-'
%                 count= count+1;
%             elseif Inf_r_MSA1(nTaxa).Sequence(seqL) ~= '-'
%                 if count ~= 0
%                     Inf_r_count1= [Inf_r_count1,count];
%                     Inf_r_countMSA1= [Inf_r_countMSA1,count];
% %                     if count>29
% %                         maxMSA=namesr1;
% %                     end
%                     count=0;
%                 end
%             end
%         end
%         if count ~=0
%             Inf_r_count1= [Inf_r_count1,count];
%             Inf_r_countMSA1= [Inf_r_countMSA1,count];
% %             if count>29
% %                 maxMSA=namesr1;
% %             end
%             count=0;
%         end
%     end
%     
% %     if namesr1==41
% %         MSA_stats{1}= [length(Inf_r_countMSA1),max(Inf_r_countMSA1),mean(Inf_r_countMSA1),median(Inf_r_countMSA1),std(Inf_r_countMSA1)];          
% %     end
% %     
% %     disp(namesr1)
% %     disp(Inf_r_countMSA1)
%     
% %     figure,
% %     histogram(Inf_r_countMSA1,'Normalization','count')
% %     title(strcat('ProPIP+Gamma-n=4,a=1.0,-Inferred-MSA',int2str(namesr1)))
% %     xlabel('Indel length')
% %     ylabel('frequency')
%     
%     
%     
%     %MsaL_r1= seqL;
% 
% end
% 
%     
%     figure,
%     histogram(Inf_r_countMSA1,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=1.0,-Inferred-MSA',int2str(namesr1)))
%     xlabel('Indel length')
%     ylabel('frequency')
% 
% 
% %% ProPIP + Gamma n=4, a=2.0
% 
% count=0;
% Inf_r_count2= [];
% maxMSA2=0;
% for namesr2=1:nIter_r2
%     Inf_r_MSA2= fastaread(Inf_r_Names2(namesr2));
%     Inf_r_countMSA2= [];
%     for nTaxa=1:13
%         for seqL=1:length(Inf_r_MSA2(nTaxa).Sequence)
%             if Inf_r_MSA2(nTaxa).Sequence(seqL) == '-'
%                 count= count+1;
%             elseif Inf_r_MSA2(nTaxa).Sequence(seqL) ~= '-'
%                 if count ~= 0
%                     Inf_r_count2= [Inf_r_count2,count];
%                     Inf_r_countMSA2= [Inf_r_countMSA2,count];
% %                     if count>29
% %                         maxMSA=namesr2;
% %                     end
%                     count=0;
%                 end
%             end
%         end
%         if count ~=0
%             Inf_r_count2= [Inf_r_count2,count];
%             Inf_r_countMSA2= [Inf_r_countMSA2,count];
% %             if count>29
% %                 maxMSA=namesr2;
% %             end
%             count=0;
%         end
%     end
%     
% %     if namesr2==41
% %         MSA_stats{1}= [length(Inf_r_countMSA2),max(Inf_r_countMSA2),mean(Inf_r_countMSA2),median(Inf_r_countMSA2),std(Inf_r_countMSA2)];          
% %     end
% %     
% %     disp(namesr2)
% %     disp(Inf_r_countMSA2)
%     
% %     figure,
% %     histogram(Inf_r_countMSA2,'Normalization','count')
% %     title(strcat('ProPIP+Gamma-n=4,a=2.0,-Inferred-MSA',int2str(namesr2)))
% %     xlabel('Indel length')
% %     ylabel('frequency')
%     
%     
%     %MsaL_r2= seqL;
% 
% end
% 
%     figure,
%     histogram(Inf_r_countMSA2,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=2.0,-Inferred-MSA',int2str(namesr2)))
%     xlabel('Indel length')
%     ylabel('frequency')
%     
% 
% 
% 
% %% ProPIP + Gamma n=4, a=3.0
% 
% count=0;
% Inf_r_count3= [];
% maxMSA3=0;
% for namesr3=1:nIter_r3
%     Inf_r_MSA3= fastaread(Inf_r_Names3(namesr3));
%     Inf_r_countMSA3= [];
%     for nTaxa=1:13
%         for seqL=1:length(Inf_r_MSA3(nTaxa).Sequence)
%             if Inf_r_MSA3(nTaxa).Sequence(seqL) == '-'
%                 count= count+1;
%             elseif Inf_r_MSA3(nTaxa).Sequence(seqL) ~= '-'
%                 if count ~= 0
%                     Inf_r_count3= [Inf_r_count3,count];
%                     Inf_r_countMSA3= [Inf_r_countMSA3,count];
% %                     if count>29
% %                         maxMSA=namesr3;
% %                     end
%                     count=0;
%                 end
%             end
%         end
%         if count ~=0
%             Inf_r_count3= [Inf_r_count3,count];
%             Inf_r_countMSA3= [Inf_r_countMSA3,count];
% %             if count>29
% %                 maxMSA=namesr3;
% %             end
%             count=0;
%         end
%     end
%     
% %     if namesr3==41
% %         MSA_stats{1}= [length(Inf_r_countMSA3),max(Inf_r_countMSA3),mean(Inf_r_countMSA3),median(Inf_r_countMSA3),std(Inf_r_countMSA3)];          
% %     end
% %     
% %     disp(namesr3)
% %     disp(Inf_r_countMSA3)
%     
% %     figure,
% %     histogram(Inf_r_countMSA3,'Normalization','count')
% %     title(strcat('ProPIP+Gamma-n=4,a=3.0,-Inferred-MSA',int2str(namesr3)))
% %     xlabel('Indel length')
% %     ylabel('frequency')   
%     
%     
%     %MsaL_r3= seqL;
% 
% end
% 
% 
%     figure,
%     histogram(Inf_r_countMSA3,'Normalization','count')
%     title(strcat('ProPIP+Gamma-n=4,a=3.0,-Inferred-MSA',int2str(namesr3)))
%     xlabel('Indel length')
%     ylabel('frequency')  

% stat{1}= [length(True_r_count),max(True_r_count),mean(True_r_count),median(True_r_count),std(True_r_count)];
stat0{1}= [length(Inf_r_count0),max(Inf_r_count0),mean(Inf_r_count0),median(Inf_r_count0),std(Inf_r_count0)];
% stat1{1}= [length(Inf_r_count1),max(Inf_r_count1),mean(Inf_r_count1),median(Inf_r_count1),std(Inf_r_count1)];
% stat2{1}= [length(Inf_r_count2),max(Inf_r_count2),mean(Inf_r_count2),median(Inf_r_count2),std(Inf_r_count2)];
% stat3{1}= [length(Inf_r_count3),max(Inf_r_count3),mean(Inf_r_count3),median(Inf_r_count3),std(Inf_r_count3)];
