clc
clear all

%%
nIter= 4;

%%
addpath('/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned')

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') %% for using nwk2tree file

%% Paths
%InferredMSA path
mafftSeq_path= '/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned';
mafftSeq_name= 'mafftInferredMSA_r_';
Seq_ext= '.fasta';


%% Input info
%Sequences
SeqPath= '/Users/pouloeld/Documents/Alignment_Generation/outputs/Alignment_MAFFT/realData_Aligned';
Seqfiles= dir(fullfile(SeqPath,'*.fasta'));
allSeqNames= {Seqfiles.name};
sk= regexp(allSeqNames,'((?<=alignedMSA_r_)\d*)','match');
[~,stii]= sortrows(str2double(cat(1,sk{:})));
allSeqNames= allSeqNames(stii);

for k=1:nIter
    new_Labels= {'Buchnera','Escherichia','Haemophilus','Pasteurella','Pseudomonas','Salmonella','Vibrio','Wigglesworthia','Xanthomonasa','Xanthomonasc','Xylella','YersiniaC','YersiniaK'};
    Labels= {'1','2','3','4','5','6','7','8','9','10','11','12','13'};

    
    %% Transform Sequence Labels
    
    f_Seq= fastaread(char(allSeqNames(k)));
    
    for i=1:13
        for t=1:13
            if strcmp(f_Seq(i,1).Header,Labels{t})
                disp(f_Seq(i,1).Header)
                f_Seq(i,1).Header=new_Labels{t};
                disp(f_Seq(i,1).Header)
            end
        end
    end
    fastawrite(strcat(mafftSeq_path,'/',mafftSeq_name,num2str(k),Seq_ext),f_Seq)
    
end






