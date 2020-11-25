pcPath='/home/eldhose/Documents/';
clusterPath='/cfs/earth/scratch/pouloeld/';
nIter= 1;
tool= 'INDELible'; %PIPJava %real
shfileName='run_ProPIP_0_5';

%addpath('/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ProPIP_k_params_I/k_0_25')
params_file_path_I= 'Alignment_Generation/inputs/INDELible_ins/ProPIP_k_params_I/k_0_5';
params_file_path_P= 'Alignment_Generation/inputs/ProPIP_ins/ProPIP_k_params_P/k_0_5';
params_file_path_r= 'Alignment_Generation/inputs/realData_ins/ProPIP_k_params_r/k_0_5';

%1. ParamFiles
% paramsPath= '/Users/pouloeld/Documents/Alignment_Generation/inputs/INDELible_ins/ProPIP_k_params_I/k_0_25';
% paramsfiles= dir(fullfile(paramsPath,'*.txt')); %Add path here (Where is your Input MSAs ?)
% allparamsNames= {paramsfiles.name};
% mk= regexp(allparamsNames,'((?<=ins_k0_params_I_)\d*)','match');
% [~,mii]= sortrows(str2double(cat(1,mk{:})));
% allparamsNames= allparamsNames(mii);

%% run file 1

for i=1:nIter
    %params_file_name= char(allparamsNames(i));
    fileParams= fopen(strcat(shfileName,tool,'.sh'),'w');
    
    new_line= '\n'; 
    baseBashcmd= '#SBATCH';
    str1= '%';
    
   
    line1= strcat('#!/bin/bash');
    line2= strcat(baseBashcmd,' --job-name=',tool);
    line3= strcat(baseBashcmd,' --output=/cfs/earth/scratch/pouloeld/binaries/ProPIP/Aligned/miniJATI-',str1,'j.out');
    line4= strcat(baseBashcmd,' --chdir=/cfs/earth/scratch/pouloeld/binaries/ProPIP/Aligned');
    line5= strcat(baseBashcmd,' --nodes=1');
    line6= strcat(baseBashcmd,' --ntasks=1');
    line7= strcat(baseBashcmd,' --mail-type=end');
    line8= strcat(baseBashcmd,' --mail-user=','pouloeld@students.zhaw.ch');
    line9= strcat(baseBashcmd,' --cpus-per-task=1');
    line10= strcat(baseBashcmd,' --partition=single');
    line11= strcat(baseBashcmd,' --qos=single');
    line12= strcat('module',' load',' slurm');
    
    
    line13= strcat('for',' nFiles',' in',' {1..100}');
    line14= 'do';
    line15= strcat('   srun',' ./miniJATI2',' params=',clusterPath,params_file_path_I,'/','ins_k1_params_I_$nFiles.txt');
    line151= strcat('   srun',' ./miniJATI2',' params=',clusterPath,params_file_path_P,'/','ins_k1_params_P_$nFiles.txt');
    line161='done';
    
    line132= strcat('for',' nFiles',' in',' {1..4}');
    line142= 'do';
    line152= strcat('   srun',' ./miniJATI2',' params=',clusterPath,params_file_path_r,'/','ins_k1_params_r_$nFiles.txt');
    line162='done';
    
    fprintf(fileParams,line1);
    fprintf(fileParams,new_line);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line2);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,'%s',line3);
    fprintf(fileParams,new_line);
   
    fprintf(fileParams,line4);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line5);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line6);
    fprintf(fileParams,new_line); 
    
    fprintf(fileParams,line7);
    fprintf(fileParams,new_line);

    fprintf(fileParams,line8);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line9);
    fprintf(fileParams,new_line);

    fprintf(fileParams,line10);
    fprintf(fileParams,new_line);

    
    fprintf(fileParams,line11);
    fprintf(fileParams,new_line);
    fprintf(fileParams,new_line);

    
    fprintf(fileParams,line12);
    fprintf(fileParams,new_line);  
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line13);
    fprintf(fileParams,new_line);
    
    
    fprintf(fileParams,line14);
    fprintf(fileParams,new_line);

    
    fprintf(fileParams,line15);
    fprintf(fileParams,new_line);
    
%     fprintf(fileParams,line16);
%     fprintf(fileParams,new_line);
%     
%     
%     fprintf(fileParams,line131);
%     fprintf(fileParams,new_line);
%     
%     
%     fprintf(fileParams,line141);
%     fprintf(fileParams,new_line);

    
    fprintf(fileParams,line151);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line161);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line132);
    fprintf(fileParams,new_line);
    
    
    fprintf(fileParams,line142);
    fprintf(fileParams,new_line);

    
    fprintf(fileParams,line152);
    fprintf(fileParams,new_line);
    
    fprintf(fileParams,line162);
    fprintf(fileParams,new_line);
    
    
end
