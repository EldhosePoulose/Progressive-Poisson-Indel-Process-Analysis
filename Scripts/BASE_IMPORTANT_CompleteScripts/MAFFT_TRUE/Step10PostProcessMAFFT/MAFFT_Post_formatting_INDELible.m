clc
clear all

%%
nIter= 100;

%%
addpath('/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned')

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') %% for using nwk2tree file

%% Paths
%InferredMSA path
mafftSeq_path= '/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned';
mafftSeq_name= 'mafftInferredMSA_I_';
Seq_ext= '.fasta';


%% Input info
%Sequences
SeqPath= '/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/INDELible_Aligned';
Seqfiles= dir(fullfile(SeqPath,'*.fasta'));
allSeqNames= {Seqfiles.name};
sk= regexp(allSeqNames,'((?<=alignedMSA_I_)\d*)','match');
[~,stii]= sortrows(str2double(cat(1,sk{:})));
allSeqNames= allSeqNames(stii);

for k=1:nIter
    new_Labels= {'leaf_0','leaf_1','leaf_2','leaf_3','leaf_4','leaf_5','leaf_6','leaf_7'};
    Labels= {'1','2','3','4','5','6','7','8'};
    
    %% Transform Sequence Labels
    
    f_Seq= fastaread(char(allSeqNames(k)));
    
    for i=1:8
        for t=1:8
            if strcmp(f_Seq(i,1).Header,Labels{t})
                disp(f_Seq(i,1).Header)
                f_Seq(i,1).Header=new_Labels{t};
                disp(f_Seq(i,1).Header)
            end
        end
    end
    fastawrite(strcat(mafftSeq_path,'/',mafftSeq_name,num2str(k),Seq_ext),f_Seq)
    
end






