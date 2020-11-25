clc
clear all
%%
nIter= 100;

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/ProPIP_outs/lambda_mu');

addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/ungappedMSA_ProPIP')
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/newicktree_ProPIP')

%% params_out location
params_file_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/ProPIP_k_Gamma_params_P/k_0_10_n_4_a_0_10';
%% Base Names of the Output files
params_file= 'ins_kg11_params_P_';


pcPath='/home/eldhose/Documents/';
clusterPath='/cfs/earth/scratch/pouloeld/';

%% parameter k
k= 0.10;

%% for params_file
ungappedMSA_path= strcat(clusterPath,'Alignment_Generation/inputs/ProPIP_ins/ungappedMSA_ProPIP');
input_tree_path= strcat(clusterPath,'Alignment_Generation/inputs/ProPIP_ins/newicktree_ProPIP');

aligned_msa_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/ProPIP_Aligned/aligned_MSA/k_Gamma/k_0_10_n_4_a_0_10');
aligned_tree_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/ProPIP_Aligned/aligned_Tree/k_Gamma/k_0_10_n_4_a_0_10');
aligned_estimates_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/ProPIP_Aligned/aligned_estimates/k_Gamma/k_0_10_n_4_a_0_10');
aligned_lk_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/ProPIP_Aligned/aligned_lk/k_Gamma/k_0_10_n_4_a_0_10');
msa_ext= '.fasta';
tree_ext= '.newick';
other_ext= '.txt';

aligned_msa_name= 'ProPIPkg11inferredMSA_P_';
aligned_tree_name= 'alignkg11TREE_P_';
aligned_estimates_name= 'alignkg11log_P_';
aligned_lk_name= 'alignkg11lk_P_';


%% INPUTS file details
%1. MSAs
msaPath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/ungappedMSA_ProPIP';
fastafiles= dir(fullfile(msaPath,'*.fasta'));
allmsaNames= {fastafiles.name};
mk= regexp(allmsaNames,'((?<=sim-)\d*)|((?<=_MSA))','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
allmsaNames= allmsaNames(mii);

%2.1 Trees
treePath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/ProPIP_ins/newicktree_ProPIP';
treefiles= dir(fullfile(treePath,'*.newick'));
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=sim_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);



%% lambda mu files
lambdamuPath= '/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/ProPIP_outs/lambda_mu';
lambdamufiles= dir(fullfile(lambdamuPath,'*.txt')); 
alllmNames= {lambdamufiles.name};
mk= regexp(alllmNames,'((?<=lambda_mu_P_)\d*)','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
alllmNames= alllmNames(mii);

%% create params files
for i=1:nIter
    lm_file_name= char(alllmNames(i));
    fileID = fopen(lm_file_name);
    p= textscan(fileID,'%f%f','delimiter',',');
    fclose(fileID);
    
    
    fid_params= fopen(strcat(params_file_path,'/',params_file,num2str(i),other_ext),'w');
    disp(strcat('Printing params files...',num2str(i)))
    
    new_line= '\n';
    
    alignment_version= 'ram';
    line1= strcat('alignment.version=',alignment_version);
    
    alphabet= 'Protein';
    line2= strcat('alphabet=',alphabet);
    
    alignment= 'true';
    line3= strcat('alignment=',alignment);
    
    in_tree= 'user';
    line4= strcat('init.tree=',in_tree);
    
    in_seq_site= 'all';
    line5= strcat('input.sequence.sites_to_use=',in_seq_site);

    align_model= 'WAG01';
    lambda_val=k*p{1};
    mu_val=k*p{2};
    line6= strcat('model=PIP(model=',align_model,',','lambda=',num2str(lambda_val),',','mu=',num2str(mu_val),')');
    
    distr= 'Gamma(n=4,alpha=0.10)';
    line7= strcat('rate_distribution=',distr);   
    
    opt= 'ND-BFGS';
    der= 'BFGS';
    line8= strcat('optimization=',opt,'(derivatives=',der,')');
    
    opt_params= strcat('BrLen,Model');
    line9= strcat('optimization.ignore_parameters=',opt_params);
    
    opt_reparam= 'false';
    line10= strcat('optimization.reparametrization=',opt_reparam);
    
    opt_align= 'false';
    line11= strcat('optimization.alignment=',opt_align);
    
    opt_topology= 'false';
    line12= strcat('optimization.topology=',opt_topology);
    
    msa_file_name= char(allmsaNames(i));
    line13= strcat('input.sequence.file=',ungappedMSA_path,'/',msa_file_name);
    
    tree_file_name= char(alltreeNames(i));
    line14= strcat('input.tree.file=',input_tree_path,'/',tree_file_name);

    line15= strcat('output.msa.file=',aligned_msa_path,'/',aligned_msa_name,num2str(i),msa_ext);
    
    line16= strcat('output.tree.file=',aligned_tree_path,'/',aligned_tree_name,num2str(i),tree_ext);   
    
    line17= strcat('output.estimates.file=',aligned_estimates_path,'/',aligned_estimates_name,num2str(i),other_ext);
    
    line18= strcat('output.lk.file=',aligned_lk_path,'/',aligned_lk_name,num2str(i),other_ext);  
    
    
    fprintf(fid_params,line1);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line2);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line3);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line4);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line5);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line6);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line7);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line8);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line9);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line10);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line11);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line12);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line13);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line14);
    fprintf(fid_params,new_line);

    fprintf(fid_params,line15);
    fprintf(fid_params,new_line);    

    fprintf(fid_params,line16);
    fprintf(fid_params,new_line);
    
    fprintf(fid_params,line17);
    fprintf(fid_params,new_line);
   
    fprintf(fid_params,line18);
    fprintf(fid_params,new_line);    
    
    fclose(fid_params);

end

