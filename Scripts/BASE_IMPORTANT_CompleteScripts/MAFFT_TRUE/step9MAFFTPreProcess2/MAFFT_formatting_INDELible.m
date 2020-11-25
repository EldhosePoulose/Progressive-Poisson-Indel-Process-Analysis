clc
clear all

%%
nIter= 100;

%%
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible')
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible')

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') %% for using nwk2tree file

%% Paths

%tree path
mafftTree_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/mafftTree_INDELible';
mafftTree_name= 'mafftTree_I_';
tree_ext= '.newick';

%sequence path
mafftSeq_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedmafftMSA_INDELible';
mafftSeq_name= 'mafftSeq_I_';
Seq_ext= '.fasta';


%% Input info
% Trees
treePath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible';
treefiles= dir(fullfile(treePath,'*.newick'));
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=sim_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);

%Sequences
SeqPath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible';
Seqfiles= dir(fullfile(SeqPath,'*.fasta'));
allSeqNames= {Seqfiles.name};
sk= regexp(allSeqNames,'((?<=out_)\d*)|((?<=_TRUE_1))','match');
[~,stii]= sortrows(str2double(cat(1,sk{:})));
allSeqNames= allSeqNames(stii);

for k=1:nIter

    %% Transform Tree Labels
    
    filenameTREE= char(alltreeNames(k));
    fid_tree= fopen(filenameTREE,'r');
    tr2= fgets(fid_tree);    
    Labels= {'leaf_0','leaf_1','leaf_2','leaf_3','leaf_4','leaf_5','leaf_6','leaf_7'};
    new_Labels= {'1','2','3','4','5','6','7','8'};

    for i=1:length(Labels)
        tr2= strrep(tr2,Labels{i},new_Labels{i});
    end
    tr2= replace(tr2,';','');
    fid_T= fopen(strcat(mafftTree_path,'/',mafftTree_name,num2str(k),tree_ext),'w');
    fprintf(fid_T,tr2);
    fclose(fid_T);
    fclose(fid_tree);
    
    
    
    
    
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






