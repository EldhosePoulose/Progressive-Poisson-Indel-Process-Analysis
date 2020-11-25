%% THIS FILE IS USED TO GENERATE ⋋ & μ WHEN THE TRUE MSA (all gaps must be represented as - ) AND TREE IS PROVIDED.
% NOTE:- WARNING will be generated for empty columns (Disabled for now:col2num.m) 
%     


clc
clear all

%% params used in Simulation model
nTaxa= 8;
nIter= 100;
E= 200;


%% Input data Tools
%1 INDELible/I
%2 ProPIP/P
%3 realData/r

%% Add all paths here
% Include all functions of ProPIP
addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts')
%Include Inputs 
addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/INDELible_ins/gappedMSA_INDELible')
addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/INDELible_ins/newicktree_INDELible')
%Include matfiles needed for generating ⋋ & μ
addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/mat_functions')


%% Inputs Contains Inputs from different tools such as:
%1 INDELible_ins
%2 ProPIP_ins
%3 realData_ins

% all directory contains same items as mentioned below:
%1 gappedMSA_INDELible
%2 newicktree_INDELible

%% Tool:- INDELible 

%1. MSAs
msaPath= '/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/INDELible_ins/gappedMSA_INDELible';
fastafiles= dir(fullfile(msaPath,'*.fasta')); %Add path here (Where is your Input MSAs ?)
allmsaNames= {fastafiles.name};
mk= regexp(allmsaNames,'((?<=out_)\d*)|((?<=_TRUE1_))','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
allmsaNames= allmsaNames(mii);

%2.1 Trees
treePath= '/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/INDELible_ins/newicktree_INDELible';
treefiles= dir(fullfile(treePath,'*.newick')); %Add path here (Where is your Input Trees ?)
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=sim-)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);

%2.2 Tree Head Names used in side the loop 

%% To write into another folder in another location
% Read all MSAs and convert msa2matrix then use getMSAfeatures function on
% this matrix to get the details for each MSA. This is then written into a
% file
%% Create Outputs locations Outputs contains:

%1 INDELible_outs
%2 ProPIP_outs
%3 realData_outs
% all directory contains same items as mentioned below:

%1 column_counter
%2 exp_seq_len
%3 lambda_mu
%4 mat_function

column_counter_path= '/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/column_counter';
exp_seq_len_path= '/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/exp_seq_len';
lambda_mu_path= '/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/lambda_mu';
mat_functions_path= '/Users/pouloeld/Documents/ProPIP/Params_Generation/outputs/INDELible_outs/mat_functions';

%% Base Names of the Output files
column_counter_file= 'column_counter_I_';
exp_seq_len_file= 'exp_seq_I_';
lambda_mu_file= 'lambda_mu_I_';
mat_functions_file= 'mat_functions_I_'; 

%% This loop will generate 2 files in different locations on each iteration 

for i=1:nIter
    %exp_seq_len
    fid_exp= fopen(strcat(exp_seq_len_path,'/',exp_seq_len_file,num2str(i)),'w');
    disp(strcat('Printing exp_seq_len files...',num2str(i)))
    filenameMSA= char(allmsaNames(i));
    msa= fastaread(filenameMSA);
    mat= msa2matrix(msa);
    exp_seq_len_value= getMSAfeatures(mat);
    fprintf(fid_exp,'%d\n',exp_seq_len_value);
    
    %column_counter
    % To create as many number of files as nIter we use the method num2str(i) while opening
    fid_column_counter= fopen(strcat(column_counter_path,'/',column_counter_file,num2str(i)),'w');
    disp(strcat('Printing column_counter files...',num2str(i)))
    column_counter= zeros(1,2^nTaxa-1);
    
    for j=1:size(mat,2)
        colm= mat(:,j);
        n= col2num(colm, filenameMSA, j);
        if n>0
            column_counter(n)= column_counter(n)+1;
        end
    end
    
    for j= 1:length(column_counter)
        if column_counter(j)>0
            fprintf(fid_column_counter,'%d , %d \n',j , column_counter(j));  
        end
    end
    fclose(fid_column_counter);
end
 fclose(fid_exp);

disp('End of Section I') 

%% SECTION II Generate matlab functions files


for k=1:nIter
    %% Expected length generated on SECTION I 
    exp_seq_filesName= strcat(exp_seq_len_path,'/',exp_seq_len_file,num2str(k));
    esl= load(exp_seq_filesName);
    
    %% Column counter generated on SECTION I  
    columns_counter_filesName= strcat(column_counter_path,'/',column_counter_file,num2str(k));
    columns_count= load(columns_counter_filesName);
    ncomb= size(columns_count,1);
    msa2= char(zeros(nTaxa,ncomb));
    
    %% Trees from Inputs
    filenameTREE= char(alltreeNames(k)); 
    
    % nwk to tree
    D= nwk2tree(filenameTREE);
    nodes= cell(length(D),1);
    count= 1;
    for m= 1:length(D)
      nodes{m}= D(m);
      if contains(nodes{m}.name,'internal')
          nodes{m}.name= strcat('v',num2str(count));
          count= count+1;
      end
      if isempty(nodes{m}.Parent)
          root= nodes{m};
          nodes{m}.name= 'root';
      end
    end
    
    %% MSA Headers from Inputs
    filenameMSA= char(allmsaNames(k));
    msa= fastaread(filenameMSA);
    headnameMSA= convertCharsToStrings({msa.Header});
    
    %% create m files
    fid_mat= fopen(strcat(mat_functions_path,'/',mat_functions_file,num2str(k),'.m'),'w');
    
    %% Scripts into m file
    disp(strcat('Printing m files...',num2str(k)))
    
    %1 Function Name and Arguments
    funcname= strcat('[lambda,mu]=',mat_functions_file,num2str(k),'()');
    fprintf(fid_mat,'function %s\n', funcname);
    fprintf(fid_mat,'\n');
    
    %2 Tree details 
    for n=1:length(nodes)
        fprintf(fid_mat,'%s.bl=%f;\n',nodes{n}.name,nodes{n}.br_l);
    end
    fprintf(fid_mat,'%%%%\n');
    
    for p=1:ncomb
        s= dec2bin(p,2);
        s= pad(s,nTaxa,'left','0');
        for q= 1:nTaxa
            if s(q)=='0'
                ch='-';
            else
                ch='A';
            end
            msa2(q,p)=ch;
        end
    end
    
    %3 
    fprintf(fid_mat,'fun = @(x)(...\n');
    fprintf(fid_mat,'[');
    fprintf(fid_mat,'x(1)/x(2)-%d;\n', esl);
    
    for p=1:ncomb
        msa2_col= msa2(:,p);
        for n= 1:length(nodes)
            for r= 1:length(msa2_col)
                if nodes{n}.name == headnameMSA(r)
                    nodes{n}.ch = msa2_col(r);
                    break
                end
            end
        end

        numchar= sum(msa2_col~= '-'); %tilde
        assign_setA(root,numchar);
        
    %Variables needed for poi_distr_column function (see below)   
    lambda= 0.1; 
    mu= 0.1;  
    tau=compute_tau(root);
    setIota_rec(root,tau,mu,true)
    setBeta_rec(root,mu,true)

        recflag(root) % RECURSION


        poi_distr_column(root,root,lambda,mu,nodes)

        txtS= root.txt;
        str= txtS{1};
        str= strrep(str,'lambda','x(1)');
        str= strrep(str,'mu','x(2)');
        fprintf(fid_mat,'%s',str);

        for t=2:size(txtS,1)
            str= txtS{t};
            str= strrep(str,'lambda','x(1)');
            str= strrep(str,'mu','x(2)');

            fprintf(fid_mat,'+...\n');
            fprintf(fid_mat,'%s',str);
        end

        fprintf(fid_mat,'-%f;\n',columns_count(p,2));

        cleanTree(root)
   
    end
    
    fprintf(fid_mat,']...\n');
    fprintf(fid_mat,');\n\n');
    fprintf(fid_mat,'%%%%\n');
    
    %4
    fprintf(fid_mat, 'E=%f;\n',E);
    fprintf(fid_mat, 'x0=[E/10,1/10];\n');
    
    %5
    fprintf(fid_mat,'options.Algorithm= \''levenberg-marquardt\'';\n');
    fprintf(fid_mat,'options.MaxFunEvals= 1000;\n');
    fprintf(fid_mat,'options.Display= \''off\'';\n');
    fprintf(fid_mat,'s= lsqnonlin(fun,x0,[],[],options);\n');
    fprintf(fid_mat,'lambda= s(1);\n');
    fprintf(fid_mat,'mu= s(2);\n');
    
    fclose(fid_mat);

end

disp('End of Section II')

%% SECTION III 
% Generating ⋋ & μ

for u=1:nIter
    mat_functions_filesName= strcat(mat_functions_file,num2str(u));
    
    %% Create lambda_mu files
    fid_lambda_mu= fopen(strcat(lambda_mu_path,'/',lambda_mu_file,num2str(u)),'w');
    disp(strcat('Printing ⋋ & μ values...',num2str(u)))
    [lambda1,mu1]= feval(mat_functions_filesName); % Calling m functions
    fprintf(fid_lambda_mu,'%f,%f\n',lambda1,mu1);
    fclose(fid_lambda_mu);
    
end

disp('End of ⋋ & μ Generation')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%























