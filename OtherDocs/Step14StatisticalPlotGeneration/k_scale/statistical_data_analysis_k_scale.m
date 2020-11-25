clc
clear all
%% DATA ANALYSIS
addpath("/Users/pouloeld/Desktop/Step14StatisticalPlotGeneration/k_scale")
mat= dir('*.mat');
for q = 1:length(mat)
    
    load(mat(q).name);
end

%% INDELible
rng 'default'

edges= [1:1:20];
I1= histcounts(True_I_count,edges);
I2= histcounts(Inf_I_countMAFFT,edges);
I3= histcounts(Inf_I_countPRANK,edges);
I4= histcounts(Inf_I_countProPIP,edges);
I5= histcounts(Inf_I_countgamma4,edges);
I6= histcounts(Inf_I_countgamma0,edges);
I7= histcounts(Inf_I_countgamma1,edges);
I8= histcounts(Inf_I_countgamma2,edges);
I9= histcounts(Inf_I_countgamma3,edges);
I10= histcounts(Inf_I_countk0,edges);
I11= histcounts(Inf_I_countk1,edges);
I12= histcounts(Inf_I_countk2,edges);
I13= histcounts(Inf_I_countk3,edges);

figure,
bar(edges(1:end-1),[I1;I2;I3;I4;I5;I6;I7;I8;I9;I10;I11;I12;I13]')
title('INDELible data with cut off=20')
xlabel('Indel Length')
ylabel('Frequency')
legend('True-INDELible-with-cut-off=20','Mafft Inferred','Prank Inferred','ProPIP Inferred', 'ProPIP+Gamma(n=4,alpha=0.1)','ProPIP+Gamma(n=4,alpha=0.5)','ProPIP+Gamma(n=4,alpha=1.0)','ProPIP+Gamma(n=4,alpha=2.0)','ProPIP+Gamma(n=4,alpha=3.0)','ProPIP+k-scale=0.25','ProPIP+k-scale=0.5','ProPIP+k-scale=2.0','ProPIP+k-scale=3.0')
print('INDELible_IndelLengthStat','-dpdf','-fillpage')

%% PIP data

edges= [1:1:12];
P1= histcounts(True_P_count,edges);
P2= histcounts(Inf_P_countMAFFT,edges);
P3= histcounts(Inf_P_countPRANK,edges);
P4= histcounts(Inf_P_countProPIP,edges);
P5= histcounts(Inf_P_countgamma4,edges);
P6= histcounts(Inf_P_countgamma0,edges);
P7= histcounts(Inf_P_countgamma1,edges);
P8= histcounts(Inf_P_countgamma2,edges);
P9= histcounts(Inf_P_countgamma3,edges);
P10= histcounts(Inf_P_countk0,edges);
P11= histcounts(Inf_P_countk1,edges);
P12= histcounts(Inf_P_countk2,edges);
P13= histcounts(Inf_P_countk3,edges);

figure,
bar(edges(1:end-1),[P1;P2;P3;P4;P5;P6;P7;P8;P9;P10;P11;P12;P13]')
title('PIPJava data')
xlabel('Indel Length')
ylabel('Frequency')
legend('True-PIPJava','Mafft Inferred','Prank Inferred','ProPIP Inferred', 'ProPIP+Gamma(n=4,alpha=0.1)','ProPIP+Gamma(n=4,alpha=0.5)','ProPIP+Gamma(n=4,alpha=1.0)','ProPIP+Gamma(n=4,alpha=2.0)','ProPIP+Gamma(n=4,alpha=3.0)','ProPIP+k-scale=0.25','ProPIP+k-scale=0.5','ProPIP+k-scale=2.0','ProPIP+k-scale=3.0' )
print('PIP_IndelLengthStat','-dpdf','-fillpage')

%% real data

edges= [1:1:30];
r1= histcounts(True_r_count,edges);
r2= histcounts(Inf_r_countMAFFT,edges);
r3= histcounts(Inf_r_countPRANK,edges);
r4= histcounts(Inf_r_countProPIP,edges);
r5= histcounts(Inf_r_countgamma4,edges);
r6= histcounts(Inf_r_countgamma0,edges);
r7= histcounts(Inf_r_countgamma1,edges);
r8= histcounts(Inf_r_countgamma2,edges);
r9= histcounts(Inf_r_countgamma3,edges);
r10= histcounts(Inf_r_countk0,edges);
r11= histcounts(Inf_r_countk1,edges);
r12= histcounts(Inf_r_countk2,edges);
r13= histcounts(Inf_r_countk3,edges);

figure,
bar(edges(1:end-1),[r1;r2;r3;r4;r5;r6;r7;r8;r9;r10;r11;r12;r13]')
title('real data')
xlabel('Indel Length')
ylabel('Frequency')
legend('real data','Mafft Inferred','Prank Inferred','ProPIP Inferred', 'ProPIP+Gamma(n=4,alpha=0.1)','ProPIP+Gamma(n=4,alpha=0.5)','ProPIP+Gamma(n=4,alpha=1.0)','ProPIP+Gamma(n=4,alpha=2.0)','ProPIP+Gamma(n=4,alpha=3.0)','ProPIP+k-scale=0.25','ProPIP+k-scale=0.5','ProPIP+k-scale=2.0','ProPIP+k-scale=3.0' )
print('realData_IndelLengthStat','-dpdf','-fillpage')


