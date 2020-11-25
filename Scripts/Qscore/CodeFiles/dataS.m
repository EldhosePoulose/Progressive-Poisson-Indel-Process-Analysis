clear all
% load IndelL_Data
load reshuffled_IndelL.mat
% True_inf_labels=['INDELible','PIP','real','MAFFT','PRANK','ProPIP'];
% itemsL={True_I_count,True_P_count,True_r_count,Inf_I_count1,Inf_I_count2,Inf_I_count3,Inf_P_count1,Inf_P_count2,Inf_P_count3,Inf_r_count1,Inf_r_count2,Inf_r_count3};
% 
% TrueStat{1} = [mean(True_I_count),median(True_I_count),std(True_I_count)];
% TrueStat{2} = [mean(True_P_count),median(True_P_count),std(True_P_count)];
% TrueStat{3} = [mean(True_r_count),median(True_r_count),std(True_r_count)];
% 
% InfStat1{1} = [mean(Inf_I_count1),median(Inf_I_count1),std(Inf_I_count1)];
% InfStat1{2} = [mean(Inf_P_count1),median(Inf_P_count1),std(Inf_P_count1)];
% InfStat1{3} = [mean(Inf_r_count1),median(Inf_r_count1),std(Inf_r_count1)];
% 
% InfStat2{1} = [mean(Inf_I_count2),median(Inf_I_count2),std(Inf_I_count2)];
% InfStat2{2} = [mean(Inf_P_count2),median(Inf_P_count2),std(Inf_P_count2)];
% InfStat2{3} = [mean(Inf_r_count2),median(Inf_r_count2),std(Inf_r_count2)];
% 
% InfStat3{1} = [mean(Inf_I_count3),median(Inf_I_count3),std(Inf_I_count3)];
% InfStat3{2} = [mean(Inf_P_count3),median(Inf_P_count3),std(Inf_P_count3)];
% InfStat3{3} = [mean(Inf_r_count3),median(Inf_r_count3),std(Inf_r_count3)];

%% reshuffled

TrueStat2{1} = [mean(True_P_count),median(True_P_count),std(True_P_count)];
InfStat4{1} = [mean(Inf_P_count1),median(Inf_P_count1),std(Inf_P_count1)];
InfStat4{2} = [mean(Inf_P_count2),median(Inf_P_count2),std(Inf_P_count2)];
InfStat4{3} = [mean(Inf_P_count3),median(Inf_P_count3),std(Inf_P_count3)];
