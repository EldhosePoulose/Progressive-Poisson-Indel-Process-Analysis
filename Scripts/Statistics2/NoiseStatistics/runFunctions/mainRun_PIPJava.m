%% NOISE Statistics Main Function

%% Date: 01.05.2020

clc
clear all
%% Add path
addpath('/Users/pouloeld/Documents/NoiseStatistics/runFunctions')

% #1
%% PIPJava
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/True";
fileName="sim-";

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id";
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'True_P_id';
out_id_stat_name= 'True_P_id_stat';
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'True_P_Xid';
out_Xid_stat_name= 'True_P_Xid_stat';

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'True_P_Nid';
out_Nid_stat_name= 'True_P_Nid_stat';

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava True data')

%Indel length distribution Extraction
[True_P_id,True_P_id_stat]= IndelLengthdist(inDir,fileName);
save(strcat(outDir_id,'/',out_id_name,saveExt),'True_P_id')
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'True_P_id_stat')

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[True_P_Xid,True_P_Xid_stat,True_P_Nid,True_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName);
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'True_P_Xid')
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'True_P_Xid_stat')
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'True_P_Nid')
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'True_P_Nid_stat')

disp('Done...extracting Xindel,Noise distribution from PIPJava True data')

% #2
%% MAFFT
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/MAFFT"; % 1
fileName="mafftInferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'mafft_P_id'; %3
out_id_stat_name= 'mafft_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'mafft_P_Xid'; %5
out_Xid_stat_name= 'mafft_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'mafft_P_Nid'; %7
out_Nid_stat_name= 'mafft_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava mafft data') %9

%Indel length distribution Extraction
[mafft_P_id,mafft_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'mafft_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'mafft_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava MAFFT data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[mafft_P_Xid,mafft_P_Xid_stat,mafft_P_Nid,mafft_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'mafft_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'mafft_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'mafft_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'mafft_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava mafft data') %16


%% #3
% PRANK
% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/PRANK"; % 1
fileName="prankInferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'prank_P_id'; %3
out_id_stat_name= 'prank_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'prank_P_Xid'; %5
out_Xid_stat_name= 'prank_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'prank_P_Nid'; %7
out_Nid_stat_name= 'prank_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava prank data') %9

%Indel length distribution Extraction
[prank_P_id,prank_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'prank_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'prank_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[prank_P_Xid,prank_P_Xid_stat,prank_P_Nid,prank_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'prank_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'prank_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'prank_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'prank_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava prank data') %16

% #4 ProPIP
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP"; % 1
fileName="ProPIPinferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'ProPIP_P_id'; %3
out_id_stat_name= 'ProPIP_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'ProPIP_P_Xid'; %5
out_Xid_stat_name= 'ProPIP_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'ProPIP_P_Nid'; %7
out_Nid_stat_name= 'ProPIP_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava ProPIP data') %9

%Indel length distribution Extraction
[ProPIP_P_id,ProPIP_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'ProPIP_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'ProPIP_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[ProPIP_P_Xid,ProPIP_P_Xid_stat,ProPIP_P_Nid,ProPIP_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'ProPIP_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'ProPIP_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'ProPIP_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'ProPIP_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava ProPIP data') %16

%% #5 ProPIP Gamma 1
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_Gamma/Gamma1"; % 1
fileName="ProPIPgamma1inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'gamma1_P_id'; %3
out_id_stat_name= 'gamma1_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'gamma1_P_Xid'; %5
out_Xid_stat_name= 'gamma1_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'gamma1_P_Nid'; %7
out_Nid_stat_name= 'gamma1_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava gamma1 data') %9

%Indel length distribution Extraction
[gamma1_P_id,gamma1_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma1_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma1_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma1_P_Xid,gamma1_P_Xid_stat,gamma1_P_Nid,gamma1_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma1_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma1_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma1_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma1_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava gamma1 data') %16

%% #6 Gamma2
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_Gamma/Gamma2"; % 1
fileName="ProPIPgamma2inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'gamma2_P_id'; %3
out_id_stat_name= 'gamma2_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'gamma2_P_Xid'; %5
out_Xid_stat_name= 'gamma2_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'gamma2_P_Nid'; %7
out_Nid_stat_name= 'gamma2_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava gamma2 data') %9

%Indel length distribution Extraction
[gamma2_P_id,gamma2_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma2_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma2_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma2_P_Xid,gamma2_P_Xid_stat,gamma2_P_Nid,gamma2_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma2_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma2_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma2_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma2_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava gamma2 data') %16

%% #7 Gamma3 
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_Gamma/Gamma3"; % 1
fileName="ProPIPgamma3inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'gamma3_P_id'; %3
out_id_stat_name= 'gamma3_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'gamma3_P_Xid'; %5
out_Xid_stat_name= 'gamma3_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'gamma3_P_Nid'; %7
out_Nid_stat_name= 'gamma3_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava gamma3 data') %9

%Indel length distribution Extraction
[gamma3_P_id,gamma3_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma3_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma3_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma3_P_Xid,gamma3_P_Xid_stat,gamma3_P_Nid,gamma3_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma3_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma3_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma3_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma3_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava gamma3 data') %16

%% #8 Gamma 010
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_Gamma/Gamma010"; % 1
fileName="ProPIPgamma4inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'gamma010_P_id'; %3
out_id_stat_name= 'gamma010_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'gamma010_P_Xid'; %5
out_Xid_stat_name= 'gamma010_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'gamma010_P_Nid'; %7
out_Nid_stat_name= 'gamma010_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava gamma010 data') %9

%Indel length distribution Extraction
[gamma010_P_id,gamma010_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma010_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma010_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma010_P_Xid,gamma010_P_Xid_stat,gamma010_P_Nid,gamma010_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma010_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma010_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma010_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma010_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava gamma010 data') %16

%% #9 Gamma 050

%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_Gamma/Gamma050"; % 1
fileName="ProPIPgamma0inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'gamma050_P_id'; %3
out_id_stat_name= 'gamma050_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'gamma050_P_Xid'; %5
out_Xid_stat_name= 'gamma050_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'gamma050_P_Nid'; %7
out_Nid_stat_name= 'gamma050_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava gamma050 data') %9

%Indel length distribution Extraction
[gamma050_P_id,gamma050_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma050_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma050_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma050_P_Xid,gamma050_P_Xid_stat,gamma050_P_Nid,gamma050_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma050_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma050_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma050_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma050_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava gamma050 data') %16

%% #10 k-scale k2
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kscale/k2"; % 1
fileName="ProPIPk2inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'k2_P_id'; %3
out_id_stat_name= 'k2_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'k2_P_Xid'; %5
out_Xid_stat_name= 'k2_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'k2_P_Nid'; %7
out_Nid_stat_name= 'k2_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava k2 data') %9

%Indel length distribution Extraction
[k2_P_id,k2_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k2_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k2_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k2_P_Xid,k2_P_Xid_stat,k2_P_Nid,k2_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k2_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k2_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k2_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k2_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava k2 data') %16

%% #11 k-scale k3
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kscale/k3"; % 1
fileName="ProPIPk3inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'k3_P_id'; %3
out_id_stat_name= 'k3_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'k3_P_Xid'; %5
out_Xid_stat_name= 'k3_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'k3_P_Nid'; %7
out_Nid_stat_name= 'k3_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava k3 data') %9

%Indel length distribution Extraction
[k3_P_id,k3_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k3_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k3_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k3_P_Xid,k3_P_Xid_stat,k3_P_Nid,k3_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k3_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k3_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k3_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k3_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava k3 data') %16


%% 12 #k005
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kscale/k005"; % 1
fileName="ProPIPk4inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'k005_P_id'; %3
out_id_stat_name= 'k005_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'k005_P_Xid'; %5
out_Xid_stat_name= 'k005_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'k005_P_Nid'; %7
out_Nid_stat_name= 'k005_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava k005 data') %9

%Indel length distribution Extraction
[k005_P_id,k005_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k005_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k005_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k005_P_Xid,k005_P_Xid_stat,k005_P_Nid,k005_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k005_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k005_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k005_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k005_P_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from PIPJava k005 data') %16

%% 13 #k010
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kscale/k010"; % 1
fileName="ProPIPk5inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'k010_P_id'; %3
out_id_stat_name= 'k010_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'k010_P_Xid'; %5
out_Xid_stat_name= 'k010_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'k010_P_Nid'; %7
out_Nid_stat_name= 'k010_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava k010 data') %9

%Indel length distribution Extraction
[k010_P_id,k010_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k010_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k010_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k010_P_Xid,k010_P_Xid_stat,k010_P_Nid,k010_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k010_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k010_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k010_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k010_P_Nid_stat') %15

%% 14 #k025
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kscale/k025"; % 1
fileName="ProPIPk0inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'k025_P_id'; %3
out_id_stat_name= 'k025_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'k025_P_Xid'; %5
out_Xid_stat_name= 'k025_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'k025_P_Nid'; %7
out_Nid_stat_name= 'k025_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava k025 data') %9

%Indel length distribution Extraction
[k025_P_id,k025_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k025_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k025_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k025_P_Xid,k025_P_Xid_stat,k025_P_Nid,k025_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k025_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k025_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k025_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k025_P_Nid_stat') %15

%% 15 #k050
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kscale/k050"; % 1
fileName="ProPIPk1inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'k050_P_id'; %3
out_id_stat_name= 'k050_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'k050_P_Xid'; %5
out_Xid_stat_name= 'k050_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'k050_P_Nid'; %7
out_Nid_stat_name= 'k050_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava k050 data') %9

%Indel length distribution Extraction
[k050_P_id,k050_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k050_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k050_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k050_P_Xid,k050_P_Xid_stat,k050_P_Nid,k050_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k050_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k050_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k050_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k050_P_Nid_stat') %15


%% 16 #kg0505
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kGamma/kg0505"; % 1
fileName="ProPIPkg0inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'kg0505_P_id'; %3
out_id_stat_name= 'kg0505_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'kg0505_P_Xid'; %5
out_Xid_stat_name= 'kg0505_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'kg0505_P_Nid'; %7
out_Nid_stat_name= 'kg0505_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava kg0505 data') %9

%Indel length distribution Extraction
[kg0505_P_id,kg0505_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg0505_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg0505_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg0505_P_Xid,kg0505_P_Xid_stat,kg0505_P_Nid,kg0505_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg0505_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg0505_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg0505_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg0505_P_Nid_stat') %15

%% 17 #kg0510
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kGamma/kg0510"; % 1
fileName="ProPIPkg01inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'kg0510_P_id'; %3
out_id_stat_name= 'kg0510_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'kg0510_P_Xid'; %5
out_Xid_stat_name= 'kg0510_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'kg0510_P_Nid'; %7
out_Nid_stat_name= 'kg0510_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava kg0510 data') %9

%Indel length distribution Extraction
[kg0510_P_id,kg0510_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg0510_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg0510_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg0510_P_Xid,kg0510_P_Xid_stat,kg0510_P_Nid,kg0510_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg0510_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg0510_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg0510_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg0510_P_Nid_stat') %15

%% 18 #kg1005
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kGamma/kg1005"; % 1
fileName="ProPIPkg10inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'kg1005_P_id'; %3
out_id_stat_name= 'kg1005_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'kg1005_P_Xid'; %5
out_Xid_stat_name= 'kg1005_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'kg1005_P_Nid'; %7
out_Nid_stat_name= 'kg1005_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava kg1005 data') %9

%Indel length distribution Extraction
[kg1005_P_id,kg1005_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg1005_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg1005_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg1005_P_Xid,kg1005_P_Xid_stat,kg1005_P_Nid,kg1005_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg1005_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg1005_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg1005_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg1005_P_Nid_stat') %15

%% 19 #kg1010
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_kGamma/kg1010"; % 1
fileName="ProPIPkg11inferredMSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'kg1010_P_id'; %3
out_id_stat_name= 'kg1010_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'kg1010_P_Xid'; %5
out_Xid_stat_name= 'kg1010_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'kg1010_P_Nid'; %7
out_Nid_stat_name= 'kg1010_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava kg1010 data') %9

%Indel length distribution Extraction
[kg1010_P_id,kg1010_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg1010_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg1010_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg1010_P_Xid,kg1010_P_Xid_stat,kg1010_P_Nid,kg1010_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg1010_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg1010_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg1010_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg1010_P_Nid_stat') %15


%% 20 #w128
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/PIPJava/ProPIP_STFT/w128"; % 1
fileName="ProPIP_stft_w_128_MSA_P_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/id/id_stat";
out_id_name= 'w128_P_id'; %3
out_id_stat_name= 'w128_P_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Xid/Xid_stat";
out_Xid_name= 'w128_P_Xid'; %5
out_Xid_stat_name= 'w128_P_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/PIPJava/Nid/Nid_stat";
out_Nid_name= 'w128_P_Nid'; %7
out_Nid_stat_name= 'w128_P_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for PIPJava w128 data') %9

%Indel length distribution Extraction
[w128_P_id,w128_P_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'w128_P_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'w128_P_id_stat') %11

disp('Done...extracting Indel distribution from PIPJava True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[w128_P_Xid,w128_P_Xid_stat,w128_P_Nid,w128_P_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'w128_P_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'w128_P_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'w128_P_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'w128_P_Nid_stat') %15



