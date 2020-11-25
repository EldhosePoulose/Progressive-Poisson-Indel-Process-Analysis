%% NOISE Statistics Main Function

%% Date: 01.05.2020

clc
clear all
%% Add path
addpath('/Users/pouloeld/Documents/NoiseStatistics/runFunctions')

% #1
%% INDELible 
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/True/m_20";
fileName="out_";

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id";
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
out_id_name= 'True_I_id';
out_id_stat_name= 'True_I_id_stat';
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
out_Xid_name= 'True_I_Xid';
out_Xid_stat_name= 'True_I_Xid_stat';

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
out_Nid_name= 'True_I_Nid';
out_Nid_stat_name= 'True_I_Nid_stat';

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for INDELible True data')

%Indel length distribution Extraction
[True_I_id,True_I_id_stat]= IndelLengthdist(inDir,fileName);
save(strcat(outDir_id,'/',out_id_name,saveExt),'True_I_id')
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'True_I_id_stat')

disp('Done...extracting Indel distribution from INDELible True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[True_I_Xid,True_I_Xid_stat,True_I_Nid,True_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName);
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'True_I_Xid')
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'True_I_Xid_stat')
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'True_I_Nid')
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'True_I_Nid_stat')

disp('Done...extracting Xindel,Noise distribution from INDELible True data')
temTable= table();
temTable.Xid= True_I_Xid;
tempTable.Nid= True_I_Nid;
writetable(tempTable,'filename.csv');



% % #2
% %% MAFFT
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/MAFFT/m_20"; % 1
% fileName="mafftInferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'mafft_I_id'; %3
% out_id_stat_name= 'mafft_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'mafft_I_Xid'; %5
% out_Xid_stat_name= 'mafft_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'mafft_I_Nid'; %7
% out_Nid_stat_name= 'mafft_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible mafft data') %9
% 
% %Indel length distribution Extraction
% [mafft_I_id,mafft_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'mafft_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'mafft_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [mafft_I_Xid,mafft_I_Xid_stat,mafft_I_Nid,mafft_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'mafft_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'mafft_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'mafft_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'mafft_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible mafft data') %16
% 
% 
% %% #3
% % PRANK
% % input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/PRANK/m_20"; % 1
% fileName="prankInferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'prank_I_id'; %3
% out_id_stat_name= 'prank_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'prank_I_Xid'; %5
% out_Xid_stat_name= 'prank_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'prank_I_Nid'; %7
% out_Nid_stat_name= 'prank_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible prank data') %9
% 
% %Indel length distribution Extraction
% [prank_I_id,prank_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'prank_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'prank_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [prank_I_Xid,prank_I_Xid_stat,prank_I_Nid,prank_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'prank_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'prank_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'prank_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'prank_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible prank data') %16
% 
% % #4 ProPIP
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP/m_20"; % 1
% fileName="ProPIPinferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'ProPIP_I_id'; %3
% out_id_stat_name= 'ProPIP_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'ProPIP_I_Xid'; %5
% out_Xid_stat_name= 'ProPIP_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'ProPIP_I_Nid'; %7
% out_Nid_stat_name= 'ProPIP_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible ProPIP data') %9
% 
% %Indel length distribution Extraction
% [ProPIP_I_id,ProPIP_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'ProPIP_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'ProPIP_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [ProPIP_I_Xid,ProPIP_I_Xid_stat,ProPIP_I_Nid,ProPIP_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'ProPIP_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'ProPIP_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'ProPIP_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'ProPIP_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible ProPIP data') %16
% 
% %% #5 ProPIP Gamma 1
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_Gamma/Gamma1"; % 1
% fileName="ProPIPgamma1inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'gamma1_I_id'; %3
% out_id_stat_name= 'gamma1_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'gamma1_I_Xid'; %5
% out_Xid_stat_name= 'gamma1_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'gamma1_I_Nid'; %7
% out_Nid_stat_name= 'gamma1_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible gamma1 data') %9
% 
% %Indel length distribution Extraction
% [gamma1_I_id,gamma1_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma1_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma1_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [gamma1_I_Xid,gamma1_I_Xid_stat,gamma1_I_Nid,gamma1_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma1_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma1_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma1_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma1_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible gamma1 data') %16
% 
% %% #6 Gamma2
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_Gamma/Gamma2"; % 1
% fileName="ProPIPgamma2inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'gamma2_I_id'; %3
% out_id_stat_name= 'gamma2_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'gamma2_I_Xid'; %5
% out_Xid_stat_name= 'gamma2_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'gamma2_I_Nid'; %7
% out_Nid_stat_name= 'gamma2_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible gamma2 data') %9
% 
% %Indel length distribution Extraction
% [gamma2_I_id,gamma2_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma2_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma2_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [gamma2_I_Xid,gamma2_I_Xid_stat,gamma2_I_Nid,gamma2_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma2_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma2_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma2_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma2_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible gamma2 data') %16
% 
% %% #7 Gamma3 
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_Gamma/Gamma3"; % 1
% fileName="ProPIPgamma3inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'gamma3_I_id'; %3
% out_id_stat_name= 'gamma3_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'gamma3_I_Xid'; %5
% out_Xid_stat_name= 'gamma3_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'gamma3_I_Nid'; %7
% out_Nid_stat_name= 'gamma3_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible gamma3 data') %9
% 
% %Indel length distribution Extraction
% [gamma3_I_id,gamma3_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma3_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma3_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [gamma3_I_Xid,gamma3_I_Xid_stat,gamma3_I_Nid,gamma3_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma3_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma3_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma3_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma3_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible gamma3 data') %16
% 
% %% #8 Gamma 010
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_Gamma/Gamma010"; % 1
% fileName="ProPIPgamma4inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'gamma010_I_id'; %3
% out_id_stat_name= 'gamma010_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'gamma010_I_Xid'; %5
% out_Xid_stat_name= 'gamma010_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'gamma010_I_Nid'; %7
% out_Nid_stat_name= 'gamma010_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible gamma010 data') %9
% 
% %Indel length distribution Extraction
% [gamma010_I_id,gamma010_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma010_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma010_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [gamma010_I_Xid,gamma010_I_Xid_stat,gamma010_I_Nid,gamma010_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma010_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma010_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma010_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma010_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible gamma010 data') %16
% 
% %% #9 Gamma 050
% 
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_Gamma/Gamma050"; % 1
% fileName="ProPIPgamma0inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'gamma050_I_id'; %3
% out_id_stat_name= 'gamma050_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'gamma050_I_Xid'; %5
% out_Xid_stat_name= 'gamma050_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'gamma050_I_Nid'; %7
% out_Nid_stat_name= 'gamma050_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible gamma050 data') %9
% 
% %Indel length distribution Extraction
% [gamma050_I_id,gamma050_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma050_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma050_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [gamma050_I_Xid,gamma050_I_Xid_stat,gamma050_I_Nid,gamma050_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma050_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma050_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma050_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma050_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible gamma050 data') %16
% 
% %% #10 k-scale k2
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kscale/k2"; % 1
% fileName="ProPIPk2inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'k2_I_id'; %3
% out_id_stat_name= 'k2_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'k2_I_Xid'; %5
% out_Xid_stat_name= 'k2_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'k2_I_Nid'; %7
% out_Nid_stat_name= 'k2_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible k2 data') %9
% 
% %Indel length distribution Extraction
% [k2_I_id,k2_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'k2_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k2_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [k2_I_Xid,k2_I_Xid_stat,k2_I_Nid,k2_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k2_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k2_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k2_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k2_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible k2 data') %16
% 
% %% #11 k-scale k3
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kscale/k3"; % 1
% fileName="ProPIPk3inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'k3_I_id'; %3
% out_id_stat_name= 'k3_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'k3_I_Xid'; %5
% out_Xid_stat_name= 'k3_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'k3_I_Nid'; %7
% out_Nid_stat_name= 'k3_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible k3 data') %9
% 
% %Indel length distribution Extraction
% [k3_I_id,k3_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'k3_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k3_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [k3_I_Xid,k3_I_Xid_stat,k3_I_Nid,k3_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k3_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k3_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k3_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k3_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible k3 data') %16
% 
% 
% %% 12 #k005
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kscale/k005"; % 1
% fileName="ProPIPk4inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'k005_I_id'; %3
% out_id_stat_name= 'k005_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'k005_I_Xid'; %5
% out_Xid_stat_name= 'k005_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'k005_I_Nid'; %7
% out_Nid_stat_name= 'k005_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible k005 data') %9
% 
% %Indel length distribution Extraction
% [k005_I_id,k005_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'k005_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k005_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [k005_I_Xid,k005_I_Xid_stat,k005_I_Nid,k005_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k005_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k005_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k005_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k005_I_Nid_stat') %15
% 
% disp('Done...extracting Xindel,Noise distribution from INDELible k005 data') %16
% 
% %% 13 #k010
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kscale/k010"; % 1
% fileName="ProPIPk5inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'k010_I_id'; %3
% out_id_stat_name= 'k010_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'k010_I_Xid'; %5
% out_Xid_stat_name= 'k010_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'k010_I_Nid'; %7
% out_Nid_stat_name= 'k010_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible k010 data') %9
% 
% %Indel length distribution Extraction
% [k010_I_id,k010_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'k010_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k010_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [k010_I_Xid,k010_I_Xid_stat,k010_I_Nid,k010_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k010_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k010_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k010_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k010_I_Nid_stat') %15
% 
% %% 14 #k025
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kscale/k025"; % 1
% fileName="ProPIPk0inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'k025_I_id'; %3
% out_id_stat_name= 'k025_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'k025_I_Xid'; %5
% out_Xid_stat_name= 'k025_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'k025_I_Nid'; %7
% out_Nid_stat_name= 'k025_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible k025 data') %9
% 
% %Indel length distribution Extraction
% [k025_I_id,k025_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'k025_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k025_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [k025_I_Xid,k025_I_Xid_stat,k025_I_Nid,k025_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k025_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k025_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k025_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k025_I_Nid_stat') %15
% 
% %% 15 #k050
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kscale/k050"; % 1
% fileName="ProPIPk1inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'k050_I_id'; %3
% out_id_stat_name= 'k050_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'k050_I_Xid'; %5
% out_Xid_stat_name= 'k050_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'k050_I_Nid'; %7
% out_Nid_stat_name= 'k050_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible k050 data') %9
% 
% %Indel length distribution Extraction
% [k050_I_id,k050_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'k050_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k050_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [k050_I_Xid,k050_I_Xid_stat,k050_I_Nid,k050_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k050_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k050_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k050_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k050_I_Nid_stat') %15
% 
% 
% %% 16 #kg0505
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kGamma/kg0505"; % 1
% fileName="ProPIPkg0inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'kg0505_I_id'; %3
% out_id_stat_name= 'kg0505_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'kg0505_I_Xid'; %5
% out_Xid_stat_name= 'kg0505_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'kg0505_I_Nid'; %7
% out_Nid_stat_name= 'kg0505_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible kg0505 data') %9
% 
% %Indel length distribution Extraction
% [kg0505_I_id,kg0505_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'kg0505_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg0505_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [kg0505_I_Xid,kg0505_I_Xid_stat,kg0505_I_Nid,kg0505_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg0505_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg0505_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg0505_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg0505_I_Nid_stat') %15
% 
% %% 17 #kg0510
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kGamma/kg0510"; % 1
% fileName="ProPIPkg01inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'kg0510_I_id'; %3
% out_id_stat_name= 'kg0510_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'kg0510_I_Xid'; %5
% out_Xid_stat_name= 'kg0510_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'kg0510_I_Nid'; %7
% out_Nid_stat_name= 'kg0510_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible kg0510 data') %9
% 
% %Indel length distribution Extraction
% [kg0510_I_id,kg0510_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'kg0510_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg0510_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [kg0510_I_Xid,kg0510_I_Xid_stat,kg0510_I_Nid,kg0510_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg0510_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg0510_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg0510_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg0510_I_Nid_stat') %15
% 
% %% 18 #kg1005
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kGamma/kg1005"; % 1
% fileName="ProPIPkg10inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'kg1005_I_id'; %3
% out_id_stat_name= 'kg1005_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'kg1005_I_Xid'; %5
% out_Xid_stat_name= 'kg1005_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'kg1005_I_Nid'; %7
% out_Nid_stat_name= 'kg1005_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible kg1005 data') %9
% 
% %Indel length distribution Extraction
% [kg1005_I_id,kg1005_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'kg1005_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg1005_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [kg1005_I_Xid,kg1005_I_Xid_stat,kg1005_I_Nid,kg1005_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg1005_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg1005_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg1005_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg1005_I_Nid_stat') %15
% 
% %% 19 #kg1010
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_kGamma/kg1010"; % 1
% fileName="ProPIPkg11inferredMSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'kg1010_I_id'; %3
% out_id_stat_name= 'kg1010_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'kg1010_I_Xid'; %5
% out_Xid_stat_name= 'kg1010_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'kg1010_I_Nid'; %7
% out_Nid_stat_name= 'kg1010_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible kg1010 data') %9
% 
% %Indel length distribution Extraction
% [kg1010_I_id,kg1010_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'kg1010_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg1010_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [kg1010_I_Xid,kg1010_I_Xid_stat,kg1010_I_Nid,kg1010_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg1010_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg1010_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg1010_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg1010_I_Nid_stat') %15
% 
% 
% %% 20 #w128
% %% input directory for each MSA set
% inDir= "/Users/pouloeld/Documents/NoiseStatistics/INDELible/ProPIP_STFT/w128"; % 1
% fileName="ProPIP_stft_w_128_MSA_I_"; %2
% 
% %% out put directory for each MSA set
% outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id"; 
% outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/id/id_stat";
% out_id_name= 'w128_I_id'; %3
% out_id_stat_name= 'w128_I_id_stat'; %4
% saveExt= '.mat';
% 
% outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid";
% outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Xid/Xid_stat";
% out_Xid_name= 'w128_I_Xid'; %5
% out_Xid_stat_name= 'w128_I_Xid_stat'; %6
% 
% outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid";
% outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/INDELible/Nid/Nid_stat";
% out_Nid_name= 'w128_I_Nid'; %7
% out_Nid_stat_name= 'w128_I_Nid_stat'; %8
% 
% %% Processing Data
% %% Label Sorting
% MsaLabelSorter(inDir,fileName)
% disp('Done...Sorting the labels for INDELible w128 data') %9
% 
% %Indel length distribution Extraction
% [w128_I_id,w128_I_id_stat]= IndelLengthdist(inDir,fileName); %17
% save(strcat(outDir_id,'/',out_id_name,saveExt),'w128_I_id') %10
% save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'w128_I_id_stat') %11
% 
% disp('Done...extracting Indel distribution from INDELible True data')
% %% Indel Xlength distribution and Noise in Indel distribution Extraction
% [w128_I_Xid,w128_I_Xid_stat,w128_I_Nid,w128_I_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
% save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'w128_I_Xid') %12
% save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'w128_I_Xid_stat') %13
% save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'w128_I_Nid')         %14
% save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'w128_I_Nid_stat') %15
% 
% 
% 
