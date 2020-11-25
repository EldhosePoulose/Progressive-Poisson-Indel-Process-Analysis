ntaxa= 8;
nIter= 1;

%% Inputs 
%1. Gapped MSAs  

msaPath= '/Users/pouloeld/Documents/ProPIP/Eldhose/input/gappedMSA_INDELible';
fastafiles= dir(fullfile(msaPath,'*.fasta')); %Add path here (Where is your Input MSA ?)
allNames= {fastafiles.name};
k= regexp(allNames,'((?<=out_)\d*)|((?<=_TRUE1_))','match');
[~,ii]= sortrows(str2double(cat(1,k{:})));
allNames= allNames(ii);

%2. INDELibel/ Trees

