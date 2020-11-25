clc
clear all
%% DATA ANALYSIS
addpath("/Users/pouloeld/Desktop/StatisticsIndeLData/INDELible_wo_cutoff_IndelLdata")

mat= dir('*.mat');
for q = 1:length(mat)
    
    load(mat(q).name);
end

%% INDELible
rng 'default'

edges= [1:1:40];
I1= histcounts(True_I_count_wo_cutoff,edges);
I2= histcounts(Inf_I_countMAFFT,edges);
I3= histcounts(Inf_I_countPRANK,edges);
I4= histcounts(Inf_I_countProPIP,edges);


figure,
bar(edges(1:end-1),[I1;I2;I3;I4]')
title('INDELible data with out cut off')
xlabel('Indel Length')
ylabel('Frequency')
legend('True-INDELible-with-cut-off=20','Mafft Inferred','Prank Inferred','ProPIP Inferred', 'ProPIP+Gamma(n=4,alpha=0.5)','ProPIP+Gamma(n=4,alpha=1.0)','ProPIP+Gamma(n=4,alpha=2.0)','ProPIP+Gamma(n=4,alpha=3.0)' )
print('INDELible_IndelLengthStat','-dpdf','-fillpage')