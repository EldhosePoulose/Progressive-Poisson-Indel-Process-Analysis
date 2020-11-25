function n=col2num(col,filename,colID)

l=length(col);

str=char(zeros(1,l));

for i=1:l
    if col(i)=='-'
        val='0';
    else
        val='1';
    end
    str(i)=val;
end

n=bin2dec(str);

if n==0
    %str=strcat('ERROR in ',filename,'column',num2str(colID),' full of gaps!');
    %warning(str)
end