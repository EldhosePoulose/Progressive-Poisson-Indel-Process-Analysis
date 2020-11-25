%% This file will generate files for 
%1. Calculating parameters for ProPIP (gappedMSA) 
%2. Input for ProPIP,PRANK,MAFFT (ungappedMSA)
%% **************------------------------------------------------------**************
clc
clear all

nTaxa= 8;
nIter= 100;

%% List all fasta files
%% Change all * to - thus we have Gapped MSA for ProPIP to obtain lambda and mu. 
% This will be the TRUE MSA from INDELible.

addpath("/Users/pouloeld/Desktop/INDELible_TRUE_MSA/INDELible_True_MSA")

mkdir gappedMSA_INDELible 

gap1= {'*'};
ungap1= '-';


fastapath= "/Users/pouloeld/Desktop/INDELible_TRUE_MSA/INDELible_True_MSA";
fastafiles= dir(fullfile(fastapath,'*_TRUE_1.fasta')); %Add path here (Where is your Input MSA ?)
allNames= {fastafiles.name};
k= regexp(allNames,'((?<=out_)\d*)|((?<=_TRUE1_))','match');
[~,ii]= sortrows(str2double(cat(1,k{:})));
allNames= allNames(ii);

for names=1:nIter
    gmsa= fastaread(allNames(names));
for i=1:nTaxa
    gmsa(i,1).Sequence= replace(gmsa(i,1).Sequence,gap1,ungap1);
end
    D= './gappedMSA_INDELible/';
    outfileName= char(allNames(names));
    fastawrite(fullfile(D,outfileName),gmsa)
end



%% Create ungapped sequence. This is the input to ProPIP,PRANK,MAFFT.
 gap= {'*','-'};
 ungap= '';
 
 mkdir ungappedMSA_INDELible
% Read all fasta files in Order

%For empty sequences make change in fastawrite.m line 140

fastapath= "/Users/pouloeld/Desktop/INDELible_TRUE_MSA/INDELible_True_MSA";
unfastafiles= dir(fullfile(fastapath,'*_TRUE_1.fasta')); %Add path here (Where is your Input MSA ?)
unallNames= {unfastafiles.name};
unk= regexp(unallNames,'((?<=out_)\d*)|((?<=_TRUE1_))','match');
[~,ii]= sortrows(str2double(cat(1,unk{:})));
unallNames= unallNames(ii);

for unnames=1:nIter
    ungmsa= fastaread(unallNames(unnames));
for i=1:nTaxa
    ungmsa(i,1).Sequence= replace(ungmsa(i,1).Sequence,gap,ungap);
end
    unD= './ungappedMSA_INDELible/';
    unoutfileName= char(unallNames(unnames));
    fastawrite(fullfile(unD,unoutfileName),ungmsa)
end



