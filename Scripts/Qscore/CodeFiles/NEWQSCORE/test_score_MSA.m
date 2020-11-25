

if false

clc
clear all
close all
%%
example='1';  % (S=1.000;S=1.000) (Q=0.800;TC=0.800;Cline=0.840;Modeler=0.800)
example='2';  % (S=0.333;S=0.500) (Q=1.000;TC=1.000;Cline=0.667;Modeler=0.500)
example='3';  % (S=0.500;S=0.333) (Q=0.500;TC=0.500;Cline=0.667;Modeler=1.000)
example='4';  % (S=1.000;S=1.000) (Q=0.667;TC=0.667;Cline=0.733;Modeler=0.667)
example='5';  % (S=1.000;S=1.000) (Q=0.333;TC=0.333;Cline=0.347;Modeler=0.333)
example='6';  % (S=1.000;S=1.000) (Q=0.500;TC=0.500;Cline=0.600;Modeler=0.500)
example='7';  % (S=1.000;S=1.000) (Q=0.816;TC=0.500;Cline=0.848;Modeler=0.816)
example='8';  % (S=1.000;S=1.000) (Q=0.647;TC=0.600;Cline=0.608;Modeler=0.647)
example='10'; % (S=1.000;S=1.000) (Q=0.647;TC=0.600;Cline=0.608;Modeler=0.647)
example='12'; % (S=1.000;S=1.000) (Q=0.882;TC=0.667;Cline=0.904;Modeler=0.882)
example='13'; % (S=1.000;S=1.000) (Q=0.500;TC=0.500;Cline=0.525;Modeler=0.500)
example='14'; % (S=0.750;S=0.600) (Q=0.000;TC=0.000;Cline=-0.010;Modeler=0.000)
example='15'; % (S=0.600;S=0.600) (Q=0.500;TC=0.500;Cline=0.600;Modeler=0.500)
example='16'; % (S=0.583;S=0.700) (Q=0.939;TC=0.750;Cline=0.850;Modeler=0.795)
example='17'; % (S=1.000;S=1.000) (Q=0.929;TC=0.714;Cline=0.950;Modeler=0.929)
example='18'; % (S=1.000;S=1.000) (Q=0.894;TC=0.800;Cline=0.914;Modeler=0.894)
example='19'; % (S=1.000;S=1.000) (Q=0.562;TC=0.000;Cline=0.371;Modeler=0.562)
example='20'; % (S=1.000;S=1.000) (Q=1.000;TC=1.000;Cline=0.429;Modeler=1.000)
example='21'; % (S=1.000;S=1.000) (Q=0.000;TC=0.000;Cline=0.360;Modeler=0.000)

%example='22';

% example='9';
% example='11';
%%
filename1=strcat('MSAs/',example,'/msa1.fasta');
filename2=strcat('MSAs/',example,'/msa2.fasta');
%%
filename1='/Users/max/Desktop/CLUSTER_STFT/results/RV913_B290/msa_290_STFT_1.fasta';
filename2='/Users/max/Desktop/CLUSTER_STFT/results/RV913_B290/msa_290_NO_1.fasta';
%%
%correct=myScoreMSA(filename1,filename2)
%correct=myScoreMSA(filename2,filename1)

[correct,coordX,coordY]=myScoreMSA(filename1,filename2);


end

load('matlab.mat')

msa1=fastaread(filename1);
msa2=fastaread(filename2);
%msa2=sortMSA(msa1,msa2);
mat1=msa2matrix(msa1);
mat2=msa2matrix(msa2);

h=size(msa1,2);
w=size(msa2,2);

I=zeros(h,w);
for i=1:length(coordX)
    x=coordX(i);
    y=coordY(i);
    I(x,y)=1;
end

figure
imagesc(I)

for i=2:length(coordX)
   dx=coordX(i)-coordX(i-1);
   dy=coordY(i)-coordY(i-1);
   
   if dx~=1 || dy~=1
   
       xi=coordX(i-1);
       yi=coordY(i-1);
       xo=coordX(i);
       yo=coordY(i);
       
   end
   
end






row=2;
col=2;
x=0;
y=0;
path=[];
all_paths={};
all_paths=tri_tree_traversal(path,all_paths,row,col,x,y);























