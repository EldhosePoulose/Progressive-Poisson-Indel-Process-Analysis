clc
clear all

toolSelected= false;
if toolSelected ~= true
    disp('Make sure the tool selected, and change the toolSelected flag')
    exit
end    


% List of TRUE MSA length INDELible, PIPJava, real
% List of MAFFT_Inferred MSA length INDELible, PIPJava, real

%% WARNING !!! 
%During modification comment preffered tool section one at a time, to avoid variable names usage. 

%% Add PATH
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/INDELible")
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/TrueMSAs/real")

addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/INDELible")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/real")

addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/INDELible")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/real")

addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/INDELible")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava")
addpath("/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/real")

%%

% %% Readin all TRUE MSAs

%INDELible
True_I_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/INDELible"; 
True_I_files= dir(fullfile(True_I_Path,'*_TRUE_1.fasta'));
True_I_Names= {True_I_files.name};
tk_i= regexp(True_I_Names,'((?<=out_)\d*)|((?<=_TRUE_1))','match');
[~,ti]= sortrows(str2double(cat(1,tk_i{:})));
True_I_Names= True_I_Names(ti); %ti for INDELible tp for PIPJava tr for real
nIter_I= length(True_I_Names);

%PIPJava
% True_P_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/PIPJava"; 
% True_P_files= dir(fullfile(True_P_Path,'*_MSA.fasta'));
% True_P_Names= {True_P_files.name};
% tk_p= regexp(True_P_Names,'((?<=sim-)\d*)|((?<=_MSA))','match');
% [~,tp]= sortrows(str2double(cat(1,tk_p{:})));
% True_P_Names= True_P_Names(tp); %ti for INDELible tp for PIPJava tr for real
% nIter_P= length(True_P_Names);

%real
% True_r_Path="/Users/pouloeld/Documents/Statistics/TrueMSAs/real"; 
% True_r_files= dir(fullfile(True_r_Path,'*.fasta'));
% True_r_Names= {True_r_files.name};
% tk_r= regexp(True_r_Names,'((?<=realData_)\d*)','match');
% [~,tir]= sortrows(str2double(cat(1,tk_r{:})));
% True_r_Names= True_r_Names(tir); %ti for INDELible tp for PIPJava tr for real
% nIter_r= length(True_r_Names);

%% Reading all Inferred MSAs
%% TOOL 1 MAFFT 

% %% Readin all MAFFT Inferred MSAs change all True to Inf here
% %INDELible
% Inf_I_Path= "/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/INDELible"; 
% Inf_I_files= dir(fullfile(Inf_I_Path,'*.fasta'));
% Inf_I_Names= {Inf_I_files.name};
% tk_ii= regexp(Inf_I_Names,'((?<=mafftInferredMSA_I_)\d*)','match');
% [~,tii]= sortrows(str2double(cat(1,tk_ii{:})));
% Inf_I_Names= Inf_I_Names(tii); %tii for INDELible tpp for PIPJava trr for real
% nIter_Ii= length(Inf_I_Names);
% %PIPJava
% Inf_P_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/PIPJava"; 
% Inf_P_files= dir(fullfile(Inf_P_Path,'*.fasta'));
% Inf_P_Names= {Inf_P_files.name};
% tk_pp= regexp(Inf_P_Names,'((?<=mafftInferredMSA_P_)\d*)','match');
% [~,tpp]= sortrows(str2double(cat(1,tk_pp{:})));
% Inf_P_Names= Inf_P_Names(tpp); %tii for INDELible tpp for PIPJava trr for real
% nIter_Pp= length(Inf_P_Names);
% %real
% Inf_r_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/MAFFT/real"; 
% Inf_r_files= dir(fullfile(Inf_r_Path,'*.fasta'));
% Inf_r_Names= {Inf_r_files.name};
% tk_rr= regexp(Inf_r_Names,'((?<=mafftInferredMSA_r_)\d*)','match');
% [~,trr]= sortrows(str2double(cat(1,tk_rr{:})));
% Inf_r_Names= Inf_r_Names(trr); %tii for INDELible tpp for PIPJava trr for real
% nIter_rr= length(Inf_r_Names);

%% TOOL 2 PRANK

% %% Readin all PRANK Inferred MSAs change all True to Inf here
% %INDELible
% Inf_I_Path= "/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/INDELible"; 
% Inf_I_files= dir(fullfile(Inf_I_Path,'*.fasta'));
% Inf_I_Names= {Inf_I_files.name};
% tk_ii= regexp(Inf_I_Names,'((?<=prankInferredMSA_I_)\d*)','match');
% [~,tii]= sortrows(str2double(cat(1,tk_ii{:})));
% Inf_I_Names= Inf_I_Names(tii); %tii for INDELible tpp for PIPJava trr for real
% nIter_Ii= length(Inf_I_Names);
% %PIPJava
% Inf_P_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/PIPJava"; 
% Inf_P_files= dir(fullfile(Inf_P_Path,'*.fasta'));
% Inf_P_Names= {Inf_P_files.name};
% tk_pp= regexp(Inf_P_Names,'((?<=prankInferredMSA_P_)\d*)','match');
% [~,tpp]= sortrows(str2double(cat(1,tk_pp{:})));
% Inf_P_Names= Inf_P_Names(tpp); %tii for INDELible tpp for PIPJava trr for real
% nIter_Pp= length(Inf_P_Names);
% %real
% Inf_r_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/PRANK/real"; 
% Inf_r_files= dir(fullfile(Inf_r_Path,'*.fasta'));
% Inf_r_Names= {Inf_r_files.name};
% tk_rr= regexp(Inf_r_Names,'((?<=prankInferredMSA_r_)\d*)','match');
% [~,trr]= sortrows(str2double(cat(1,tk_rr{:})));
% Inf_r_Names= Inf_r_Names(trr); %tii for INDELible tpp for PIPJava trr for real
% nIter_rr= length(Inf_r_Names);

%% %TOOL 3 ProPIP

% %% Readin all ProPIP Inferred MSAs change all True to Inf here
% %INDELible
% Inf_I_Path= "/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/INDELible"; 
% Inf_I_files= dir(fullfile(Inf_I_Path,'*.fasta'));
% Inf_I_Names= {Inf_I_files.name};
% tk_ii= regexp(Inf_I_Names,'((?<=ProPIPinferredMSA_I_)\d*)','match');
% [~,tii]= sortrows(str2double(cat(1,tk_ii{:})));
% Inf_I_Names= Inf_I_Names(tii); %tii for INDELible tpp for PIPJava trr for real
% nIter_Ii= length(Inf_I_Names);
% %PIPJava
% Inf_P_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava"; 
% Inf_P_files= dir(fullfile(Inf_P_Path,'*.fasta'));
% Inf_P_Names= {Inf_P_files.name};
% tk_pp= regexp(Inf_P_Names,'((?<=ProPIPinferredMSA_P_)\d*)','match');
% [~,tpp]= sortrows(str2double(cat(1,tk_pp{:})));
% Inf_P_Names= Inf_P_Names(tpp); %tii for INDELible tpp for PIPJava trr for real
% nIter_Pp= length(Inf_P_Names);
% %real
% Inf_r_Path="/Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/real"; 
% Inf_r_files= dir(fullfile(Inf_r_Path,'*.fasta'));
% Inf_r_Names= {Inf_r_files.name};
% tk_rr= regexp(Inf_r_Names,'((?<=ProPIPinferredMSA_r_)\d*)','match');
% [~,trr]= sortrows(str2double(cat(1,tk_rr{:})));
% Inf_r_Names= Inf_r_Names(trr); %tii for INDELible tpp for PIPJava trr for real
% nIter_rr= length(Inf_r_Names);


%% %% Sort all TRUE MSA (labels and corresponding Sequences)
%INDELible
for namesI=1:nIter_I
    True_I_MSA= fastaread(True_I_Names(namesI));
    temp= struct2table(True_I_MSA);
    temp= sortrows(temp,'Header');
    True_I_MSA= table2struct(temp);
    fastawrite(strcat(True_I_Path,'/',char(True_I_Names(namesI))),True_I_MSA);  
end

%PIPJava
% for namesP=1:nIter_P
%     True_P_MSA= fastaread(True_P_Names(namesP));
%     temp= struct2table(True_P_MSA);
%     temp= sortrows(temp,'Header');
%     True_P_MSA= table2struct(temp);
%     %fastawrite(strcat(True_P_Path,'/',char(True_P_Names(namesP))),True_P_MSA);  
% end

%real

% for namesr=1:nIter_r
%     True_r_MSA= fastaread(True_r_Names(namesr));
%     temp= struct2table(True_r_MSA);
%     temp= sortrows(temp,'Header');
%     True_r_MSA= table2struct(temp);
%     %fastawrite(strcat(True_r_Path,'/',char(True_r_Names(namesr))),True_r_MSA);  
% end

%% %% Sort all mafft Inferred MSA (labels and corresponding Sequences)
% Sort this section for PRANK and ProPIP to sort its aligned MSA's in
% ordered labels way.

%% WARNING !!! 
%Common scetion for all make sure you commented the unused tool sections
% 
% %INDELible
% for namesI=1:nIter_Ii
%     Inf_I_MSA= fastaread(Inf_I_Names(namesI));
%     temp= struct2table(Inf_I_MSA);
%     temp= sortrows(temp,'Header');
%     Inf_I_MSA= table2struct(temp);
%     %fastawrite(strcat(Inf_I_Path,'/',char(Inf_I_Names(namesI))),Inf_I_MSA);  
% end
% %PIPJava
% for namesP=1:nIter_Pp
%     Inf_P_MSA= fastaread(Inf_P_Names(namesP));
%     temp= struct2table(Inf_P_MSA);
%     temp= sortrows(temp,'Header');
%     Inf_P_MSA= table2struct(temp);
%     %fastawrite(strcat(Inf_P_Path,'/',char(Inf_P_Names(namesP))),Inf_P_MSA);  
% end
% %real
% for namesr=1:nIter_rr
%     Inf_r_MSA= fastaread(Inf_r_Names(namesr));
%     temp= struct2table(Inf_r_MSA);
%     temp= sortrows(temp,'Header');
%     Inf_r_MSA= table2struct(temp);
%     %fastawrite(strcat(Inf_r_Path,'/',char(Inf_r_Names(namesr))),Inf_r_MSA);  
% end