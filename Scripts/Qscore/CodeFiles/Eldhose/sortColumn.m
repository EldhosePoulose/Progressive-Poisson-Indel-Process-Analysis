function [mat,idx]=sortColumn(mat,idx,col,val)

for i=1:length(col)
    
    if i==1
        col_index_1=min(col(:));
        col_index_2=col(1);
    else
        col_index_1=col(i);
        col_index_2=max(col(1:i-1));
    end
    
    if col_index_1<col_index_2
        
        [mat,idx]=swapLeft(mat,idx,i,val,col_index_1,col_index_2);

        [mat,idx]=swapRight(mat,idx,i,val,col_index_1,col_index_2);
        
        col=indexOfChar(idx,val);
        
    end
    
end

end
%%
function [mat,idx]=swapLeft(mat,idx,num_rows,val,col_index_1,col_index_2)

for i=col_index_2-1:-1:col_index_1
    
    m=[idx(1:num_rows,i+1),idx(1:num_rows,i)];
    
    c=indexOfChar(m,val);
    
    c(isnan(c))=[];
    
    if issorted(c) && gapsBetweenTwoCols(mat,i,i+1)
        mat=swapcolumns(mat,i,i+1);
        idx=swapcolumns(idx,i,i+1);
    end
    
end

end
%%
function [mat,idx]=swapRight(mat,idx,num_rows,val,col_index_1,col_index_2)

for i=col_index_1:col_index_2-1
    
    m=[idx(1:num_rows,i+1),idx(1:num_rows,i)];
    
    c=indexOfChar(m,val);
    
    c(isnan(c))=[];
    
    if issorted(c) && gapsBetweenTwoCols(mat,i,i+1)
        mat=swapcolumns(mat,i,i+1);
        idx=swapcolumns(idx,i,i+1);
    end
    
end

end
%%
function allgaps=gapsBetweenTwoCols(s,a,b)

idx=(s(:,b)~='-');

allgaps=true;
for i=a:b-1
    col=s(:,i);
    col1=col(idx);
    allgaps = allgaps & sum(col1~='-')==0;
end

end
%%
function mat=swapcolumns(mat,a,b)

c=mat(:,a);
mat(:,a)=mat(:,b);
mat(:,b)=c;

end