function [Q,TC,Cline,Modeler]=read_q_scores(filename)

Q=[];
TC=[];
Cline=[];
Modeler=[];

fidI=fopen(filename,'r');

while ~feof(fidI)
    
    txt = fgetl(fidI);
    
    str=strsplit(txt,'Q=');
    str=strsplit(str{2},';TC=');
    Q = [Q;str2double(str{1})];
    
    str=strsplit(str{2},';Cline=');
    TC = [TC;str2double(str{1})];
    
    str=strsplit(str{2},';Modeler=');
    Cline = [TC;str2double(str{1})];
    
    Modeler = [Modeler;str2double(str{2})];
end
fclose(fidI);

