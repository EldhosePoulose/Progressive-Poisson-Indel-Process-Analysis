clc
clear all
close all
%%
leaves='MSA8';
intensity='I5';
br_lenJ='t0.10';
br_len='t0.1';
cols='200';
%%
N=50;
factors={...
'1.00'
'1.50'
'2.00'
'2.50'
'2.60'
'2.70'
'2.80'
'2.90'
'3.00'
'3.10'
'3.20'
'3.25'
'3.30'
'3.35'
'3.40'
'3.45'
'3.50'
'3.55'
'3.60'
'3.65'
'3.70'
'3.75'
'3.80'
'4.00'
'4.05'
'4.10'
'4.15'
'4.20'
'4.25'
'4.30'
'4.35'
};
%%
for i=1:length(factors)
    
    filenameS = strcat('./scores/score_',leaves,'_',intensity,'_',br_len,'_',cols,'_',factors{i});
    
    fid=fopen(filenameS,'w');
    
    for j=0:N-1
        filename1=strcat('../javaPIP/',leaves,'/',intensity,'/',br_lenJ,'/',cols,'/output/sim-',num2str(j),'_MSA.fasta');
        filename2=strcat('../castor/',leaves,'/',intensity,'/',br_len,'/',cols,'/',factors{i},'/fasta/msa_',num2str(j),'.fa');
        correct=myScoreMSA(filename1,filename2);
        fprintf(fid,'%f\n',correct);
    end
    
    fclose(fid);
end








