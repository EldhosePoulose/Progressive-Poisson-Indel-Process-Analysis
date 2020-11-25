clc
clear all

%%
nIter= 100;

%%
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/newicktree_ProPIP')

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') %% for using nwk2tree file

%% Output info
mafftTree_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/mafftTree_ProPIP';
mafftTree_name= 'mafftTree_P_';
tree_ext= '.newick';

%% Input info
% Trees
treePath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/newicktree_ProPIP';
treefiles= dir(fullfile(treePath,'*.newick'));
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=sim_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);


for k=1:nIter
    filenameTREE= char(alltreeNames(k));
    fid_tree= fopen(filenameTREE,'r');
    tr2= fgets(fid_tree);    
    leafLabels= {'leaf_0','leaf_1','leaf_2','leaf_3','leaf_4','leaf_5','leaf_6','leaf_7'};
    new_leafLabels= {'0','1','2','3','4','5','6','7'};
    %nodeLables= {'internal_0','internal_1','internal_2','internal_3','internal_4','internal_5','root'};
    
    for i=1:length(leafLabels)
        tr2= strrep(tr2,leafLabels{i},new_leafLabels{i});
    end
%     for j=1:length(nodeLables)
%         tr2= strrep(tr2,nodeLables{j},'');
%     end
%     
    fid_mafft= fopen(strcat(mafftTree_path,'/',mafftTree_name,num2str(k),tree_ext),'w');
    disp(strcat('Printing edited tree files...',num2str(k)))
    fprintf(fid_mafft,tr2);
    fclose(fid_tree);
    fclose(fid_mafft);
end
