function mat=swapcolumns(mat,a,b)

c=mat(:,a);
mat(:,a)=mat(:,b);
mat(:,b)=c;