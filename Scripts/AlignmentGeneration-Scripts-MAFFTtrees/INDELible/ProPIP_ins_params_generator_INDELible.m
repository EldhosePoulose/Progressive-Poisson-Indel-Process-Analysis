clc
clear all
%%
nIter= 85;

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/lambda_mu');

addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible')
addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible')

pcPath='/home/eldhose/Documents/';
clusterPath='/cfs/earth/scratch/pouloeld/';

%% For cluster add a directory at the same location, '/cluster'

%% params_out location
params_file_path= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/params_INDELible/wo_cutoff/cluster';
%% Base Names of the Output files
params_file= 'ins_params_I_';


%% for params_file
ungappedMSA_path= strcat(clusterPath,'Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible');
input_tree_path= strcat(clusterPath,'Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible');

aligned_msa_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/INDELible_Aligned/aligned_MSA/gamma4');
aligned_tree_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/INDELible_Aligned/aligned_Tree/gamma4');
aligned_estimates_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/INDELible_Aligned/aligned_estimates/gamma4');
aligned_lk_path= strcat(clusterPath,'Alignment_Generation/outputs/Alignment_ProPIP/INDELible_Aligned/aligned_lk/gamma4');

msa_ext= '.fasta';
tree_ext= '.newick';
other_ext= '.txt';

aligned_msa_name= 'ProPIPgamma4inferredMSA_I_';
aligned_tree_name= 'aligngamma4TREE_I_';
aligned_estimates_name= 'alignlog_I_';
aligned_lk_name= 'alignlk_I_';

%% INPUTS file details
%1. MSAs
msaPath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible';
fastafiles= dir(fullfile(msaPath,'*.fasta')); %Add path here (Where is your Input MSAs ?)
allmsaNames= {fastafiles.name};
mk= regexp(allmsaNames,'((?<=out_)\d*)|((?<=_TRUE1_))','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
allmsaNames= allmsaNames(mii);

%2.1 Trees
treePath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible';
treefiles= dir(fullfile(treePath,'*.newick')); %Add path here (Where is your Input Trees ?)
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=sim_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);



%% lambda mu files
lambdamuPath= '/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/lambda_mu';
lambdamufiles= dir(fullfile(lambdamuPath,'*.txt')); 
alllmNames= {lambdamufiles.name};
mk= regexp(alllmNames,'((?<=lambda_mu_I_)\d*)','match');
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
    lambda_val=p{1};
    mu_val=p{2};
    line6= strcat('model=PIP(model=',align_model,',','lambda=',num2str(lambda_val),',','mu=',num2str(mu_val),')');
    
    distr= 'Gamma(n=4,alpha=3.0)';
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

