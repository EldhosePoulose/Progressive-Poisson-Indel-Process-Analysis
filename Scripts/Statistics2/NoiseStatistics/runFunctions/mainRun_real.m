%% NOISE Statistics Main Function

%% Date: 01.05.2020

clc
clear all
%% Add path
addpath('/Users/pouloeld/Documents/NoiseStatistics/runFunctions')

% #1
%% real
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/True";
fileName="realData_";

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id";
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'True_r_id';
out_id_stat_name= 'True_r_id_stat';
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'True_r_Xid';
out_Xid_stat_name= 'True_r_Xid_stat';

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'True_r_Nid';
out_Nid_stat_name= 'True_r_Nid_stat';

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real True data')

%Indel length distribution Extraction
[True_r_id,True_r_id_stat]= IndelLengthdist(inDir,fileName);
save(strcat(outDir_id,'/',out_id_name,saveExt),'True_r_id')
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'True_r_id_stat')

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[True_r_Xid,True_r_Xid_stat,True_r_Nid,True_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName);
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'True_r_Xid')
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'True_r_Xid_stat')
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'True_r_Nid')
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'True_r_Nid_stat')

disp('Done...extracting Xindel,Noise distribution from real True data')

% #2
%% MAFFT
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/MAFFT"; % 1
fileName="mafftInferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'mafft_r_id'; %3
out_id_stat_name= 'mafft_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'mafft_r_Xid'; %5
out_Xid_stat_name= 'mafft_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'mafft_r_Nid'; %7
out_Nid_stat_name= 'mafft_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real mafft data') %9

%Indel length distribution Extraction
[mafft_r_id,mafft_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'mafft_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'mafft_r_id_stat') %11

disp('Done...extracting Indel distribution from real MAFFT data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[mafft_r_Xid,mafft_r_Xid_stat,mafft_r_Nid,mafft_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'mafft_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'mafft_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'mafft_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'mafft_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real mafft data') %16


%% #3
% PRANK
% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/PRANK"; % 1
fileName="prankInferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'prank_r_id'; %3
out_id_stat_name= 'prank_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'prank_r_Xid'; %5
out_Xid_stat_name= 'prank_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'prank_r_Nid'; %7
out_Nid_stat_name= 'prank_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real prank data') %9

%Indel length distribution Extraction
[prank_r_id,prank_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'prank_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'prank_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[prank_r_Xid,prank_r_Xid_stat,prank_r_Nid,prank_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'prank_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'prank_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'prank_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'prank_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real prank data') %16

% #4 ProPIP
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP"; % 1
fileName="ProPIPinferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'ProPIP_r_id'; %3
out_id_stat_name= 'ProPIP_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'ProPIP_r_Xid'; %5
out_Xid_stat_name= 'ProPIP_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'ProPIP_r_Nid'; %7
out_Nid_stat_name= 'ProPIP_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real ProPIP data') %9

%Indel length distribution Extraction
[ProPIP_r_id,ProPIP_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'ProPIP_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'ProPIP_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[ProPIP_r_Xid,ProPIP_r_Xid_stat,ProPIP_r_Nid,ProPIP_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'ProPIP_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'ProPIP_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'ProPIP_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'ProPIP_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real ProPIP data') %16

%% #5 ProPIP Gamma 1
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_Gamma/Gamma1"; % 1
fileName="ProPIPgamma1inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'gamma1_r_id'; %3
out_id_stat_name= 'gamma1_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'gamma1_r_Xid'; %5
out_Xid_stat_name= 'gamma1_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'gamma1_r_Nid'; %7
out_Nid_stat_name= 'gamma1_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real gamma1 data') %9

%Indel length distribution Extraction
[gamma1_r_id,gamma1_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma1_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma1_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma1_r_Xid,gamma1_r_Xid_stat,gamma1_r_Nid,gamma1_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma1_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma1_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma1_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma1_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real gamma1 data') %16

%% #6 Gamma2
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_Gamma/Gamma2"; % 1
fileName="ProPIPgamma2inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'gamma2_r_id'; %3
out_id_stat_name= 'gamma2_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'gamma2_r_Xid'; %5
out_Xid_stat_name= 'gamma2_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'gamma2_r_Nid'; %7
out_Nid_stat_name= 'gamma2_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real gamma2 data') %9

%Indel length distribution Extraction
[gamma2_r_id,gamma2_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma2_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma2_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma2_r_Xid,gamma2_r_Xid_stat,gamma2_r_Nid,gamma2_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma2_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma2_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma2_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma2_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real gamma2 data') %16

%% #7 Gamma3 
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_Gamma/Gamma3"; % 1
fileName="ProPIPgamma3inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'gamma3_r_id'; %3
out_id_stat_name= 'gamma3_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'gamma3_r_Xid'; %5
out_Xid_stat_name= 'gamma3_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'gamma3_r_Nid'; %7
out_Nid_stat_name= 'gamma3_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real gamma3 data') %9

%Indel length distribution Extraction
[gamma3_r_id,gamma3_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma3_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma3_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma3_r_Xid,gamma3_r_Xid_stat,gamma3_r_Nid,gamma3_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma3_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma3_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma3_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma3_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real gamma3 data') %16

%% #8 Gamma 010
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_Gamma/Gamma010"; % 1
fileName="ProPIPgamma4inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'gamma010_r_id'; %3
out_id_stat_name= 'gamma010_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'gamma010_r_Xid'; %5
out_Xid_stat_name= 'gamma010_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'gamma010_r_Nid'; %7
out_Nid_stat_name= 'gamma010_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real gamma010 data') %9

%Indel length distribution Extraction
[gamma010_r_id,gamma010_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma010_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma010_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma010_r_Xid,gamma010_r_Xid_stat,gamma010_r_Nid,gamma010_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma010_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma010_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma010_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma010_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real gamma010 data') %16

%% #9 Gamma 050

%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_Gamma/Gamma050"; % 1
fileName="ProPIPgamma0inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'gamma050_r_id'; %3
out_id_stat_name= 'gamma050_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'gamma050_r_Xid'; %5
out_Xid_stat_name= 'gamma050_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'gamma050_r_Nid'; %7
out_Nid_stat_name= 'gamma050_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real gamma050 data') %9

%Indel length distribution Extraction
[gamma050_r_id,gamma050_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'gamma050_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'gamma050_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[gamma050_r_Xid,gamma050_r_Xid_stat,gamma050_r_Nid,gamma050_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'gamma050_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'gamma050_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'gamma050_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'gamma050_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real gamma050 data') %16

%% #10 k-scale k2
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kscale/k2"; % 1
fileName="ProPIPk2inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'k2_r_id'; %3
out_id_stat_name= 'k2_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'k2_r_Xid'; %5
out_Xid_stat_name= 'k2_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'k2_r_Nid'; %7
out_Nid_stat_name= 'k2_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real k2 data') %9

%Indel length distribution Extraction
[k2_r_id,k2_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k2_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k2_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k2_r_Xid,k2_r_Xid_stat,k2_r_Nid,k2_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k2_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k2_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k2_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k2_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real k2 data') %16

%% #11 k-scale k3
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kscale/k3"; % 1
fileName="ProPIPk3inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'k3_r_id'; %3
out_id_stat_name= 'k3_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'k3_r_Xid'; %5
out_Xid_stat_name= 'k3_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'k3_r_Nid'; %7
out_Nid_stat_name= 'k3_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real k3 data') %9

%Indel length distribution Extraction
[k3_r_id,k3_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k3_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k3_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k3_r_Xid,k3_r_Xid_stat,k3_r_Nid,k3_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k3_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k3_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k3_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k3_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real k3 data') %16


%% 12 #k005
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kscale/k005"; % 1
fileName="ProPIPk4inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'k005_r_id'; %3
out_id_stat_name= 'k005_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'k005_r_Xid'; %5
out_Xid_stat_name= 'k005_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'k005_r_Nid'; %7
out_Nid_stat_name= 'k005_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real k005 data') %9

%Indel length distribution Extraction
[k005_r_id,k005_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k005_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k005_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k005_r_Xid,k005_r_Xid_stat,k005_r_Nid,k005_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k005_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k005_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k005_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k005_r_Nid_stat') %15

disp('Done...extracting Xindel,Noise distribution from real k005 data') %16

%% 13 #k010
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kscale/k010"; % 1
fileName="ProPIPk5inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'k010_r_id'; %3
out_id_stat_name= 'k010_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'k010_r_Xid'; %5
out_Xid_stat_name= 'k010_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'k010_r_Nid'; %7
out_Nid_stat_name= 'k010_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real k010 data') %9

%Indel length distribution Extraction
[k010_r_id,k010_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k010_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k010_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k010_r_Xid,k010_r_Xid_stat,k010_r_Nid,k010_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k010_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k010_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k010_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k010_r_Nid_stat') %15

%% 14 #k025
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kscale/k025"; % 1
fileName="ProPIPk0inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'k025_r_id'; %3
out_id_stat_name= 'k025_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'k025_r_Xid'; %5
out_Xid_stat_name= 'k025_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'k025_r_Nid'; %7
out_Nid_stat_name= 'k025_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real k025 data') %9

%Indel length distribution Extraction
[k025_r_id,k025_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k025_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k025_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k025_r_Xid,k025_r_Xid_stat,k025_r_Nid,k025_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k025_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k025_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k025_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k025_r_Nid_stat') %15

%% 15 #k050
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kscale/k050"; % 1
fileName="ProPIPk1inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'k050_r_id'; %3
out_id_stat_name= 'k050_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'k050_r_Xid'; %5
out_Xid_stat_name= 'k050_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'k050_r_Nid'; %7
out_Nid_stat_name= 'k050_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real k050 data') %9

%Indel length distribution Extraction
[k050_r_id,k050_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'k050_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'k050_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[k050_r_Xid,k050_r_Xid_stat,k050_r_Nid,k050_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'k050_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'k050_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'k050_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'k050_r_Nid_stat') %15


%% 16 #kg0505
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kGamma/kg0505"; % 1
fileName="ProPIPkg0inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'kg0505_r_id'; %3
out_id_stat_name= 'kg0505_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'kg0505_r_Xid'; %5
out_Xid_stat_name= 'kg0505_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'kg0505_r_Nid'; %7
out_Nid_stat_name= 'kg0505_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real kg0505 data') %9

%Indel length distribution Extraction
[kg0505_r_id,kg0505_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg0505_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg0505_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg0505_r_Xid,kg0505_r_Xid_stat,kg0505_r_Nid,kg0505_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg0505_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg0505_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg0505_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg0505_r_Nid_stat') %15

%% 17 #kg0510
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kGamma/kg0510"; % 1
fileName="ProPIPkg01inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'kg0510_r_id'; %3
out_id_stat_name= 'kg0510_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'kg0510_r_Xid'; %5
out_Xid_stat_name= 'kg0510_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'kg0510_r_Nid'; %7
out_Nid_stat_name= 'kg0510_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real kg0510 data') %9

%Indel length distribution Extraction
[kg0510_r_id,kg0510_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg0510_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg0510_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg0510_r_Xid,kg0510_r_Xid_stat,kg0510_r_Nid,kg0510_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg0510_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg0510_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg0510_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg0510_r_Nid_stat') %15

%% 18 #kg1005
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kGamma/kg1005"; % 1
fileName="ProPIPkg10inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'kg1005_r_id'; %3
out_id_stat_name= 'kg1005_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'kg1005_r_Xid'; %5
out_Xid_stat_name= 'kg1005_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'kg1005_r_Nid'; %7
out_Nid_stat_name= 'kg1005_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real kg1005 data') %9

%Indel length distribution Extraction
[kg1005_r_id,kg1005_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg1005_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg1005_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg1005_r_Xid,kg1005_r_Xid_stat,kg1005_r_Nid,kg1005_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg1005_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg1005_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg1005_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg1005_r_Nid_stat') %15

%% 19 #kg1010
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_kGamma/kg1010"; % 1
fileName="ProPIPkg11inferredMSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'kg1010_r_id'; %3
out_id_stat_name= 'kg1010_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'kg1010_r_Xid'; %5
out_Xid_stat_name= 'kg1010_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'kg1010_r_Nid'; %7
out_Nid_stat_name= 'kg1010_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real kg1010 data') %9

%Indel length distribution Extraction
[kg1010_r_id,kg1010_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'kg1010_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'kg1010_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[kg1010_r_Xid,kg1010_r_Xid_stat,kg1010_r_Nid,kg1010_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'kg1010_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'kg1010_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'kg1010_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'kg1010_r_Nid_stat') %15


%% 20 #w128
%% input directory for each MSA set
inDir= "/Users/pouloeld/Documents/NoiseStatistics/real/ProPIP_STFT/w128"; % 1
fileName="ProPIP_stft_w_128_MSA_r_"; %2

%% out put directory for each MSA set
outDir_id= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id"; 
outDir_id_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/id/id_stat";
out_id_name= 'w128_r_id'; %3
out_id_stat_name= 'w128_r_id_stat'; %4
saveExt= '.mat';

outDir_Xid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid";
outDir_Xid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Xid/Xid_stat";
out_Xid_name= 'w128_r_Xid'; %5
out_Xid_stat_name= 'w128_r_Xid_stat'; %6

outDir_Nid= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid";
outDir_Nid_stat= "/Users/pouloeld/Documents/NoiseStatistics/runDataOut/real/Nid/Nid_stat";
out_Nid_name= 'w128_r_Nid'; %7
out_Nid_stat_name= 'w128_r_Nid_stat'; %8

%% Processing Data
%% Label Sorting
MsaLabelSorter(inDir,fileName)
disp('Done...Sorting the labels for real w128 data') %9

%Indel length distribution Extraction
[w128_r_id,w128_r_id_stat]= IndelLengthdist(inDir,fileName); %17
save(strcat(outDir_id,'/',out_id_name,saveExt),'w128_r_id') %10
save(strcat(outDir_id_stat,'/',out_id_stat_name,saveExt),'w128_r_id_stat') %11

disp('Done...extracting Indel distribution from real True data')
%% Indel Xlength distribution and Noise in Indel distribution Extraction
[w128_r_Xid,w128_r_Xid_stat,w128_r_Nid,w128_r_Nid_stat]= IndelLengthdistNoiseout(inDir,fileName); %18
save(strcat(outDir_Xid,'/',out_Xid_name,saveExt),'w128_r_Xid') %12
save(strcat(outDir_Xid_stat,'/',out_Xid_stat_name,saveExt),'w128_r_Xid_stat') %13
save(strcat(outDir_Nid,'/',out_Nid_name,saveExt),'w128_r_Nid')         %14
save(strcat(outDir_Nid_stat,'/',out_Nid_stat_name,saveExt),'w128_r_Nid_stat') %15



