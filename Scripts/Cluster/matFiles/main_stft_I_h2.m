%% This File will align the INDELible Input sequences using STFT. 

clc
clear all
%% Paths
pcPath='/Users/pouloeld/Documents/';
clusterPath='/cfs/earth/scratch/pouloeld/';

%%
addpath(strcat(pcPath,'Alignment_Generation/STFT/core'))
addpath(strcat(pcPath,'Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible/m_20'))
addpath(strcat(pcPath,'Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible/m_20'))
addpath(strcat(pcPath,'ProPIP/Params_Generation/outputs/INDELible_outs/lambda_mu/m_20'));

%%
nIter= 100;
seed=78887;
rng(seed);

%% OUT file path
output_MSA_path= strcat(pcPath,'Alignment_Generation/STFT/outputs/INDELible/m_20/hann/h_64');
output_file_name= 'ProPIP_stft_h_64_MSA_I_';
Seq_ext= ".fasta";

%% INPUTS file details

%1 ungapped MSAs
msaPath= strcat(pcPath,'Alignment_Generation/inputs/INDELible_ins/ungappedMSA_INDELible/m_20');
fastafiles= dir(fullfile(msaPath,'*.fasta'));
allmsaNames= {fastafiles.name};
mk= regexp(allmsaNames,'((?<=out_)\d*)|((?<=_TRUE1_))','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
allmsaNames= allmsaNames(mii);

%2 Trees
treePath= strcat(pcPath,'Alignment_Generation/inputs/INDELible_ins/newicktree_INDELible/m_20');
treefiles= dir(fullfile(treePath,'*.newick')); 
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=sim_)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);

%3 lambda mu files
lambdamuPath= strcat(pcPath,'ProPIP/Params_Generation/outputs/INDELible_outs/lambda_mu/m_20');
lambdamufiles= dir(fullfile(lambdamuPath,'*.txt')); 
alllmNames= {lambdamufiles.name};
mk= regexp(alllmNames,'((?<=lambda_mu_I_)\d*)','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
alllmNames= alllmNames(mii);

for i=1:nIter
    %Ungapped MSA
    filename_MSA=char(allmsaNames(i));
    f_Seq= fastaread(filename_MSA);
    % Tree
    filename_tree=char(alltreeNames(i));
    %Parameter Values
    lm_file_name= char(alllmNames(i));
    
    fileID = fopen(lm_file_name);
    p= textscan(fileID,'%f%f','delimiter',',');
    fclose(fileID);
    
    params.lambda=p{1};
    params.mu=p{2};
    

    %% Null hypothesis params
    params.alpha=0.05;
    params.consMatch = 4;
    %
    params.useFFT = false;
    params.useSTFT = true;
    %
    params.FIR = 'hann'; %hann
    params.sizeFIR = 64;
    params.delta = 1;%params.sizeFIR/8;
    params.numRefinement = 2;
    params.pval = 0.0001;
    %
    params.threshold=0.7;
    % Homologous detection parameters
    params.moving_average_window_size=5;
    params.min_segment_length=10;
    % Noise estimation parameters
    params.n_iterations=20;

    % Stochastic backtracking parameters
    params.SB=0;
    params.num_SB=100;
    params.Temperature=10;
    
    % Alphabet
    params.alphabet='AA';
    % Homologous detection approach
    params.homologous_approach='grantham'; % {grantham,correlation}
    %params.homologous_approach='correlation'; % {grantham,correlation}
    % Compute matrix occupation
    params.COMPUTE_NUM_CELLS=0;
    % Load substitution model
    if strcmp(params.alphabet,'AA')
        [params.Q,params.Pi]=load_subs_model_WAG(params.mu);
    else
        [params.Q,params.Pi]=load_subs_model_JC(params.mu);
    end
    
   %% Tree Processing

    [node_list,root]=nwk2tree(filename_tree,params.Q);
    nseq = length(f_Seq);
    taxa_name=cell(nseq,1);
    
    for j=1:nseq
        taxa_name{j}=node_list(j).name;
    end

    map_taxa=containers.Map(taxa_name,1:nseq);
    f_Seq=reorder_fasta(f_Seq,map_taxa);
    
    for k=1:length(node_list)
      if node_list(k).is_leaf
          idx=map_taxa(node_list(k).name);
          node_list(k).sequence=f_Seq(idx).Sequence;
      end
    end
    
    %% running DP 
    
    node_list=runDPonTree(node_list,root,params);
    root=node_list(end);
    
    
    %% Write MSA
    MSA=root.sequence;
    header=root.sequence_name;
    MSA_fasta=[];
    for m=1:size(MSA,1)
        MSA_fasta(m).Header=header{m};
        MSA_fasta(m).Sequence=MSA(m,:);
    end
    temp= struct2table(MSA_fasta);
    temp= sortrows(temp,'Header');
    MSA_fasta= table2struct(temp);
    fastawrite(strcat(output_MSA_path,'/',output_file_name,num2str(i),Seq_ext),MSA_fasta);

    
    
end
