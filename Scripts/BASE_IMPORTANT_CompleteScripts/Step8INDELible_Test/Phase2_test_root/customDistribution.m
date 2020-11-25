%% Test4 Pr.1 for atleast 1 Insertion and 0 for rest. Emulate PIP. 

pr1= 1;
npr2= 1000;
distPIP=[pr1,zeros(npr2,1)']';

fid_PIP= fopen('mylengthmodel.txt','w');
fprintf(fid_PIP,'%d\n',distPIP);
