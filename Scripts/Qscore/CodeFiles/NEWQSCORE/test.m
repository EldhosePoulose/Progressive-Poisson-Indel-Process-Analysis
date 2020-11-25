clear
clc
%%
% filename1='msa_GS_NO_1.fasta';
% filename2='msa_GS_STFT_1.fasta';

filename1='trueMSA.fasta'; % True
filename2='testMSA.fasta'; %Inf

%%
msa1=fastaread(filename1);
msa2=fastaread(filename2);
%%
[mat1,mat2]=myScoreMSA(msa1,msa2);
%%
s=split(filename1,'.fasta');
filename1=strcat(s{1},'_new','.fasta');
mat2fasta(filename1,msa1,mat1)
s=split(filename2,'.fasta');
filename2=strcat(s{1},'_new','.fasta');
mat2fasta(filename2,msa2,mat2)