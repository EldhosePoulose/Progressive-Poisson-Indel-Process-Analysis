%% This file will generate files for 
%1. Calculating parameters for ProPIP (gappedMSA) 
%2. Input for ProPIP,PRANK,MAFFT (ungappedMSA)
%% **************------------------------------------------------------**************
clc
clear all

nTaxa= 8;
nIter= 100;

%% Create ungapped sequence. This is the input to ProPIP,PRANK,MAFFT.
 gap= {'-'};
 ungap= '';
 
% mkdir ungappedMSA_PIP
% Read all fasta files in Order
%For empty sequences make change in fastawrite.m line 140

unfastafiles= dir('*.fasta'); %Add path here (Where is your Input MSA ?)
unallNames= {unfastafiles.name};
unk= regexp(unallNames,'((?<=sim-)\d*)|((?<=_MSA))','match');
[~,ii]= sortrows(str2double(cat(1,unk{:})));
unallNames= unallNames(ii);

for unnames=1:nIter
    ungmsa= fastaread(unallNames(unnames));
for i=1:nTaxa
    ungmsa(i,1).Sequence= replace(ungmsa(i,1).Sequence,gap,ungap);
end
    unD= './ungappedMSA_PIP/';
    unoutfileName= char(unallNames(unnames));
    fastawrite(fullfile(unD,unoutfileName),ungmsa)
end



