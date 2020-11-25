clc
clear all

% Date: 22.04.2020
%% This process is with INDELible data with cut-off, m=20, k scale values
%% Add paths
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_0_25")
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_0_5")
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_2_0")
addpath("/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_3_0")


%% Readin TRUE MSA
% %INDELible
% True_I_Path="/Users/pouloeld/Documents/Statistics2/PIPJava/True"; 
% True_I_files= dir(fullfile(True_I_Path,'*_TRUE_1.fasta'));
% True_I_Names= {True_I_files.name};
% tk_i= regexp(True_I_Names,'((?<=out_)\d*)|((?<=_TRUE_1))','match');
% [~,ti]= sortrows(str2double(cat(1,tk_i{:})));
% True_I_Names= True_I_Names(ti); %ti for INDELible tp for PIPJava tr for real
% nIter_I= length(True_I_Names);

%% Readin all Inferred MSAs
% k_0_25
Inf_I_Path1= "/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_0_25"; 
Inf_I_files1= dir(fullfile(Inf_I_Path1,'*.fasta'));
Inf_I_Names1= {Inf_I_files1.name};
tk_i1= regexp(Inf_I_Names1,'((?<=ProPIPk0inferredMSA_P_)\d*)','match');
[~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
Inf_I_Names1= Inf_I_Names1(ti1); %tii for INDELible tpp for PIPJava trr for real
nIter_I1= length(Inf_I_Names1);

% k_0_5
Inf_I_Path2= "/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_0_5"; 
Inf_I_files2= dir(fullfile(Inf_I_Path2,'*.fasta'));
Inf_I_Names2= {Inf_I_files2.name};
tk_i2= regexp(Inf_I_Names2,'((?<=ProPIPk1inferredMSA_P_)\d*)','match');
[~,ti2]= sortrows(str2double(cat(1,tk_i2{:})));
Inf_I_Names2= Inf_I_Names2(ti2); %tii for INDELible tpp for PIPJava trr for real
nIter_I2= length(Inf_I_Names2);

% k_2_0
Inf_I_Path3= "/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_2_0"; 
Inf_I_files3= dir(fullfile(Inf_I_Path3,'*.fasta'));
Inf_I_Names3= {Inf_I_files3.name};
tk_i3= regexp(Inf_I_Names3,'((?<=ProPIPk2inferredMSA_P_)\d*)','match');
[~,ti3]= sortrows(str2double(cat(1,tk_i3{:})));
Inf_I_Names3= Inf_I_Names3(ti3); %tii for INDELible tpp for PIPJava trr for real
nIter_I3= length(Inf_I_Names3);

% k_3_0
Inf_I_Path4= "/Users/pouloeld/Documents/Statistics2/PIPJava/ProPIP/k_scale/k_3_0"; 
Inf_I_files4= dir(fullfile(Inf_I_Path4,'*.fasta'));
Inf_I_Names4= {Inf_I_files4.name};
tk_i4= regexp(Inf_I_Names4,'((?<=ProPIPk3inferredMSA_P_)\d*)','match');
[~,ti4]= sortrows(str2double(cat(1,tk_i4{:})));
Inf_I_Names4= Inf_I_Names4(ti4); %tii for INDELible tpp for PIPJava trr for real
nIter_I4= length(Inf_I_Names4);

%% SORTING Labels
% TRUE
% for namesI=1:nIter_I
%     True_I_MSA= fastaread(True_I_Names(namesI));
%     temp= struct2table(True_I_MSA);
%     temp= sortrows(temp,'Header');
%     True_I_MSA= table2struct(temp);
%     fastawrite(strcat(True_I_Path,'/',char(True_I_Names(namesI))),True_I_MSA);  
% end

% k_0_25
for namesI1=1:nIter_I1
    Inf_I_MSA1= fastaread(Inf_I_Names1(namesI1));
    temp1= struct2table(Inf_I_MSA1);
    temp1= sortrows(temp1,'Header');
    Inf_I_MSA1= table2struct(temp1);
    fastawrite(strcat(Inf_I_Path1,'/',char(Inf_I_Names1(namesI1))),Inf_I_MSA1);  
end

% k_0_5
for namesI2=1:nIter_I2
    Inf_I_MSA2= fastaread(Inf_I_Names2(namesI2));
    temp2= struct2table(Inf_I_MSA2);
    temp2= sortrows(temp2,'Header');
    Inf_I_MSA2= table2struct(temp2);
    fastawrite(strcat(Inf_I_Path2,'/',char(Inf_I_Names2(namesI2))),Inf_I_MSA2);  
end

% k_2_0
for namesI3=1:nIter_I3
    Inf_I_MSA3= fastaread(Inf_I_Names3(namesI3));
    temp3= struct2table(Inf_I_MSA3);
    temp3= sortrows(temp3,'Header');
    Inf_I_MSA3= table2struct(temp3);
    fastawrite(strcat(Inf_I_Path3,'/',char(Inf_I_Names3(namesI3))),Inf_I_MSA3);  
end

% k_3_0
for namesI4=1:nIter_I4
    Inf_I_MSA4= fastaread(Inf_I_Names4(namesI4));
    temp4= struct2table(Inf_I_MSA4);
    temp4= sortrows(temp4,'Header');
    Inf_I_MSA4= table2struct(temp4);
    fastawrite(strcat(Inf_I_Path4,'/',char(Inf_I_Names4(namesI4))),Inf_I_MSA4);  
end



























