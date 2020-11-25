clc
clear all

%%
nIter= 4;

%%
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/newicktree_realData')
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/ungappedMSA_realData')

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') %% for using nwk2tree file

%% Paths

%tree path
mafftTree_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/mafftTree_realData';
mafftTree_name= 'mafftTree_r_';
tree_ext= '.newick';

%sequence path
mafftSeq_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/ungappedmafftMSA_realData';
mafftSeq_name= 'mafftSeq_r_';
Seq_ext= '.fasta';


%% Input info
% Trees
treePath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/newicktree_realData';
treefiles= dir(fullfile(treePath,'*.newick'));
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=real-)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);

%Sequences
SeqPath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/ungappedMSA_realData';
Seqfiles= dir(fullfile(SeqPath,'*.fasta'));
allSeqNames= {Seqfiles.name};
sk= regexp(allSeqNames,'((?<=realData_)\d*)','match');
[~,stii]= sortrows(str2double(cat(1,sk{:})));
allSeqNames= allSeqNames(stii);

for k=1:nIter

    %% Transform Tree Labels
   
    filenameTREE= char(alltreeNames(k));
    fid_tree= fopen(filenameTREE,'r');
    tr2= fgets(fid_tree);    
    Labels= {'Buchnera','Escherichia','Haemophilus','Pasteurella','Pseudomonas','Salmonella','Vibrio','Wigglesworthia','Xanthomonasa','Xanthomonasc','Xylella','YersiniaC','YersiniaK'};
    new_Labels= {'1','2','3','4','5','6','7','8','9','10','11','12','13'};

    for i=1:length(Labels)
        tr2= strrep(tr2,Labels{i},new_Labels{i});
    end
    tr2= replace(tr2,';','');
    fid_T= fopen(strcat(mafftTree_path,'/',mafftTree_name,num2str(k)),'w');
    fprintf(fid_T,tr2);
    fclose(fid_T);
    fclose(fid_tree);
    
    
    
    
    
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






