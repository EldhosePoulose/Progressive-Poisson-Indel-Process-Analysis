%% This file will generate files for 
%1. Calculating parameters for ProPIP (gappedMSA) 
%2. Input for ProPIP,PRANK,MAFFT (ungappedMSA)
%% **************------------------------------------------------------**************
clc
clear all

nTaxa= 13;
nIter= 4;

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/gappedMSA_realData')

%% Create ungapped sequence. This is the input to ProPIP,PRANK,MAFFT.
 gap= {'-'};
 ungap= '';
 
mkdir ungappedMSA_realData
% Read all fasta files in Order
%For empty sequences make change in fastawrite.m line 140

msaPath= '/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/gappedMSA_realData';
fastafiles= dir(fullfile(msaPath,'*.fasta')); %Add path here (Where is your Input MSAs ?)
allmsaNames= {fastafiles.name};
mk= regexp(allmsaNames,'((?<=realData_)\d*)','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
allmsaNames= allmsaNames(mii);


for unnames=1:nIter
    ungmsa= fastaread(char(allmsaNames(unnames)));
for i=1:nTaxa 
    ungmsa(i,1).Sequence= replace(ungmsa(i,1).Sequence,gap,ungap);
end
    unD= './ungappedMSA_realData/';
    unoutfileName= char(allmsaNames(unnames));
    fastawrite(fullfile(unD,unoutfileName),ungmsa)
end



