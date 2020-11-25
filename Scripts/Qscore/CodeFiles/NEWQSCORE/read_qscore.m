function [Q,TC,Cline,Modeler]=read_qscore(filename,N)

fid=fopen(filename,'r');
Q=zeros(N,1);
TC=zeros(N,1);
Cline=zeros(N,1);
Modeler=zeros(N,1);
for i=1:N
   txt = fgetl(fid);
   str=strsplit(txt,'Q=');
   str=strsplit(str{2},';TC=');
   Q(i)=str2double(str{1});
   str=strsplit(str{2},';Cline=');
   TC(i)=str2double(str{1});
   str=strsplit(str{2},';Modeler=');
   Cline(i)=str2double(str{1});
   Modeler(i)=str2double(str{2});
end
fclose(fid);