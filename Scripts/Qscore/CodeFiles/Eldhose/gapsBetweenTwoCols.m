function [allgaps,type]=gapsBetweenTwoCols(s,a,b)

type=0;

col1=s(:,a);
col2=s(:,b);

c1=(col1~='-');
c2=(col2~='-');

idx=(c1 & c2);

if sum(idx)>0
    
    if isequal(col1(idx),col2(idx))
        
        type=1;
        
        if sum(c1)>sum(c2)
            
            nc2=not(c2);
            
            allgaps=true;
            for k=a+1:b
                col=s(nc2,k);
                allgaps = allgaps && (sum(col~='-')==0);
            end
        else
            
            nc1=not(c1);
            
            allgaps=true;
            for k=a:b-1
                col=s(nc1,k);
                allgaps = allgaps && (sum(col~='-')==0);
            end
        end
        
    else
        allgaps=false;
    end
    
else
    
    type=2;
    
    idx=(s(:,b)~='-');
    
    allgaps=true;
    for i=a:b-1
        col=s(:,i);
        col1=col(idx);
        allgaps = allgaps & sum(col1~='-')==0;
    end
    
end
