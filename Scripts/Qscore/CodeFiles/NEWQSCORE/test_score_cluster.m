function test_score_cluster(filename1,filename2,filenameQ)

correct=myScoreMSA(filename1,filename2);

fid=fopen(filenameQ,'w');
fprintf(fid,'%16.14f\n',correct);
fclose(fid);

