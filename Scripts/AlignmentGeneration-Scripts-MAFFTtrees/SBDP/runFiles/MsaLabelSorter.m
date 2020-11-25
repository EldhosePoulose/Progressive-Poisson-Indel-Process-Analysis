function MsaLabelSorter(path,fileName)
Inf_I_Path1= path; 
addpath(Inf_I_Path1)

Inf_I_files1= dir(fullfile(Inf_I_Path1,'*.fasta'));
Inf_I_Names1= {Inf_I_files1.name};
tk_i1= regexp(Inf_I_Names1,fileName,'match');
[~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
Inf_I_Names1= Inf_I_Names1(ti1); 
nIter_I1= length(Inf_I_Names1);


%% SORTING Labels

for namesI1=1:nIter_I1
    disp(Inf_I_Names1(namesI1))
    Inf_I_MSA1= fastaread(Inf_I_Names1(namesI1));
    disp(char(Inf_I_Names1(namesI1)))
    temp1= struct2table(Inf_I_MSA1);
    temp1= sortrows(temp1,'Header');
    Inf_I_MSA1= table2struct(temp1);
    fastawrite(strcat(Inf_I_Path1,'/',char(Inf_I_Names1(namesI1))),Inf_I_MSA1);  
end

end
