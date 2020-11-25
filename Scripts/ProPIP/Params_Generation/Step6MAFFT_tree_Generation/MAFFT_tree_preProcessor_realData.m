clc
clear all

%%
nIter= 4;

%%
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/newicktree_realData')

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') %% for using nwk2tree file

%% Output info
mafftTree_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/mafftTree_realData';
mafftTree_name= 'mafftTree_r_';
tree_ext= '.newick';

%% Input info
% Trees
treePath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/realData_ins/newicktree_realData';
treefiles= dir(fullfile(treePath,'*.newick'));
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=real_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);


for k=1:nIter
    filenameTREE= char(alltreeNames(k));
    fid_tree= fopen(filenameTREE,'r');
    tr2= fgets(fid_tree);    
    leafLabels= {'Buchnera','Escherichia','Haemophilus','Pasteurella','Pseudomonas','Salmonella','Vibrio','Wigglesworthia','Xanthomonasa','Xanthomonasc','Xylella','YersiniaC','YersiniaK'};
    new_leafLabels= {'0','1','2','3','4','5','6','7','8','9','10','11','12','13'};

    for i=1:length(leafLabels)
        tr2= strrep(tr2,leafLabels{i},new_leafLabels{i});
    end
    fid_mafft= fopen(strcat(mafftTree_path,'/',mafftTree_name,num2str(k),tree_ext),'w');
    disp(strcat('Printing edited tree files...',num2str(k)))
    fprintf(fid_mafft,tr2);
    
    fclose(fid_tree);
    fclose(fid_mafft);
end
