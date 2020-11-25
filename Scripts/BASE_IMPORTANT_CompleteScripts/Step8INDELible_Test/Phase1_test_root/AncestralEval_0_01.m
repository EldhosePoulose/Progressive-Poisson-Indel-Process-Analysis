clc
clear all

%paths
addpath("/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees/4_POW_1.7_method1_5000replicates/test3/test3_IR_0.01")

addpath('/Users/pouloeld/Documents/ProPIP/Params_Generation/scripts') 

AncestralPath= '/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees/4_POW_1.7_method1_5000replicates/test3/test3_IR_0.01';


Ancestralfiles= dir(fullfile(AncestralPath,'*_ANCESTRAL_1.fasta'));
allAncestralNames= {Ancestralfiles.name};
tk= regexp(allAncestralNames,'((?<=out_)\d*)|((?<=_ANCESTRAL_1))','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
allAncestralNames= allAncestralNames(tii);
nIter= length(allAncestralNames);

for names=1:nIter
    Ancestralmsa= fastaread(allAncestralNames(names));
    insLength=0;
    aaLength=0;
    for i=1:length(Ancestralmsa(7,1).Sequence)
        LatROOT(names)=length(Ancestralmsa(7,1).Sequence);
        if strcmp(Ancestralmsa(7,1).Sequence(i),'*')
            insLength=insLength+1;
        else
            aaLength= aaLength+1;
        end    
    end
    AAatROOT(names)=aaLength;
    IatROOT(names)=insLength;
end

%
% figure
% plot(1:100,IatROOT)
% title("Method 1- Number of INSERTIONS at the root/replicates")
% xlabel("replicates")
% ylabel("INSERTIONs at root")
% 
% 
% figure
% plot(1:100,LatROOT)
% title("Method 1- Total number of charcaters(L+ * ) at the root/replicates")
% xlabel("replicates")
% ylabel("Total number of charcaters(L+ * )  at root")
% 
% 

edgesL = unique(LatROOT);
countsL = histc(LatROOT(:), edgesL);

edgesI = unique(LatROOT);
countsI = histc(LatROOT(:), edgesI);

z=LatROOT;
z(z>500)=[];
subplot(2,1,1);
histogram(z,50,'Normalization','probability')
xlabel("L+num*")
ylabel("prob")
title("INDEL rate= 0.01")
hold on

zz=IatROOT;
zz(zz>500)=[];
subplot(2,1,2);
histogram(zz,50,'Normalization','probability')
xlabel("num*")
ylabel("prob")
title("INDEL rate= 0.01")



%[y,x]=hist(z,50);
%cftool

% figure,
% histogram(LatROOT,'Normalization','probability')
% title("Method1")
% xlabel("L+num*")
% ylabel("prob")
% 
% figure,
% histogram(IatROOT,'Normalization','probability')
% title("Method1")
% xlabel("num*")
% ylabel("prob")

