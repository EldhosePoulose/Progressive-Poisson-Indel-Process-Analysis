clear
clc
%% Add Paths
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava")

addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava")

%% OUTPUT paths and namings
outFolderName= 'reshuffled';

%% TRUE MSA
%PIPJava
True_P_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava"; 
True_P_files= dir(fullfile(True_P_Path,'*_MSA.fasta'));
True_P_Names= {True_P_files.name};
tk_p= regexp(True_P_Names,'((?<=sim-)\d*)|((?<=_MSA))','match');
[~,tp]= sortrows(str2double(cat(1,tk_p{:})));
True_P_Names= True_P_Names(tp); %ti for INDELible tp for PIPJava tr for real
nIter_P= length(True_P_Names);

%% Inferred MSAs

% Tool 1 MAFFT
Inf_P_Path1="/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/PIPJava"; 
Inf_P_files1= dir(fullfile(Inf_P_Path1,'*.fasta'));
Inf_P_Names1= {Inf_P_files1.name};
tk_p1= regexp(Inf_P_Names1,'((?<=mafftInferredMSA_P_)\d*)','match');
[~,tp1]= sortrows(str2double(cat(1,tk_p1{:})));
Inf_P_Names1= Inf_P_Names1(tp1); %tii for INDELible tpp for PIPJava trr for real
nIter_P1= length(Inf_P_Names1);

% Tool 2 PRANK
Inf_P_Path2="/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/PIPJava"; 
Inf_P_files2= dir(fullfile(Inf_P_Path2,'*.fasta'));
Inf_P_Names2= {Inf_P_files2.name};
tk_p2= regexp(Inf_P_Names2,'((?<=prankInferredMSA_P_)\d*)','match');
[~,tp2]= sortrows(str2double(cat(1,tk_p2{:})));
Inf_P_Names2= Inf_P_Names2(tp2); %tii for INDELible tpp for PIPJava trr for real
nIter_P2= length(Inf_P_Names2);

% Tool 3 ProPIP
Inf_P_Path3="/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava"; 
Inf_P_files3= dir(fullfile(Inf_P_Path3,'*.fasta'));
Inf_P_Names3= {Inf_P_files3.name};
tk_p3= regexp(Inf_P_Names3,'((?<=ProPIPinferredMSA_P_)\d*)','match');
[~,tp3]= sortrows(str2double(cat(1,tk_p3{:})));
Inf_P_Names3= Inf_P_Names3(tp3); %tii for INDELible tpp for PIPJava trr for real
nIter_P3= length(Inf_P_Names3);

%% Read in all PIP True MSAs and MAFFT/PRANK/ProPIP Inferred PIP MSAs

for nIter=1:100   
 
    filename1= char(True_P_Names(nIter));
    
    filename2= char(Inf_P_Names1(nIter));
    filename3= char(Inf_P_Names2(nIter));
    filename4= char(Inf_P_Names3(nIter));

    %%
    msaT=fastaread(filename1);
    
    msaM=fastaread(filename2); %MAFFT
    msaP=fastaread(filename3); %PRANK
    msaPro=fastaread(filename4); %ProPIP
    
    %%
    [mat1,mat2]=myScoreMSA(msaT,msaM); %Tool 1
    [mat1,mat3]=myScoreMSA(msaT,msaP); %Tool 2
    [mat1,mat4]=myScoreMSA(msaT,msaPro);  %Tool 3
    %% 
    %TRUE 
    T_path= strcat(True_P_Path,'/',outFolderName,'/');
    s1=split(filename1,'.fasta');
    filename1=strcat(s1{1},'_new','.fasta');
    mat2fasta(T_path,filename1,msaT,mat1)
    
    %% Tool 1
    
    %MAFFT
    Inf_path= strcat(Inf_P_Path1,'/',outFolderName,'/');
    s2=split(filename2,'.fasta');
    filename2=strcat(s2{1},'_new','.fasta');
    mat2fasta(Inf_path,filename2,msaM,mat2)
   
    %% Tool 2
    %PRANK    
    Inf_path= strcat(Inf_P_Path2,'/',outFolderName,'/');
    s3=split(filename3,'.fasta');
    filename3=strcat(s3{1},'_new','.fasta');
    mat2fasta(Inf_path,filename3,msaP,mat3)
   
    %% Tool 3
    %ProPIP
    Inf_path= strcat(Inf_P_Path3,'/',outFolderName,'/');
    s4=split(filename4,'.fasta');
    filename4=strcat(s4{1},'_new','.fasta');
    mat2fasta(Inf_path,filename4,msaPro,mat4)

end