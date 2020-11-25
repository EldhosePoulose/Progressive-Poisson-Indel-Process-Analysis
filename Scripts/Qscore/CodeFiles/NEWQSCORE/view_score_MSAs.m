clc
clear all
close all
%%
N=50;
leaves='MSA8';
intensity='I5';
br_lenJ='t0.10';
br_len='t0.1';
%%
cols={...
    '100'
    '200'
    '300_v1'
    '400'
    '500'
    '600'
    '1000'
    };
%%
% '1.50'
% '2.00'
% '2.50'
% '2.60'
% '2.70'
% '2.80'
% '2.90'
% '3.00'
% '3.10'
% '3.20'
% '3.25'
% '3.30'
% '3.35'
% '3.40'
% '3.45'
% '3.50'
% '3.55'
% '3.60'
% '3.65'
% '3.70'
% '3.75'
% '3.80'
% '4.00'
% '4.05'
% '4.10'
% '4.15'
% '4.20'
% '4.25'
% '4.30'
% '4.35'
factors={...
'1.00'
};
%%
% S=zeros(N,length(factors));
% for i=1:length(factors)
%     filenameS = strcat('./scores/score_',leaves,'_',intensity,'_',br_len,'_',cols,'_',factors{i});
%     s=load(filenameS);
%     S(:,i)=s;
% end
%%
% Q=zeros(N,length(factors));
% for i=1:length(factors)
%     filenameQ = strcat('./qscores/score_',leaves,'_',intensity,'_',br_len,'_',cols,'_',factors{i});
%     q=read_qscore(filenameQ,N);
%     Q(:,i)=q;
% end
Q=zeros(N,length(cols));
%for j=1:length(cols)
    for i=1:length(cols)
        filenameQ = strcat('./qscores/score_',leaves,'_',intensity,'_',br_len,'_',cols{i},'_',factors{1});
        q=read_qscore(filenameQ,N);
        Q(:,i)=q;
    end
%end
%%
% figure
% boxplot(S)
% 
% figure
% plot(mean(S),'ob-')

figure
plot(mean(Q),'*r-')





