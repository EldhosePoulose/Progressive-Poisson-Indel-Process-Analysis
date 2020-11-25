function [mat,idx]=reorderMSA(mat,idx)

mval=max(idx(:));

for val=1:mval
    
    col=indexOfChar(idx,val);
            
    if not(issorted(col))
        [mat,idx]=sortColumn(mat,idx,col,val);
    end

end

