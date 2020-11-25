function I=equalMatrix(s1,s2)

len1=size(s1,2);
len2=size(s2,2);

I=zeros(len1,len2);

for ii=1:len1
    
    col1=s1(:,ii);
    
    for jj=1:len2
        
        col2=s2(:,jj);
        
        if isequal(col1,col2)
            I(ii,jj)=1;
        end
        
    end
end
