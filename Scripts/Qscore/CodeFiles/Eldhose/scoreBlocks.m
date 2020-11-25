function [score,coordX,coordY]=scoreBlocks(s1,s2)

len1=size(s1,2);
len2=size(s2,2);

ROW=zeros(len1+1,len2+1);
COL=zeros(len1+1,len2+1);
M=-inf*ones(len1+1,len2+1);

I=equalMatrix_extra(s1,s2);

M(1,1)=0;
ROW(1,1)=1;
COL(1,1)=1;

for i=2:len1+1
    for j=2:len2+1

        mm = M(i-1,j-1);
        mx = M(i-1,j)-I(i-1,j);
        my = M(i,j-1)-I(i,j-1);

        val=max([mm,mx,my]);

        M(i,j)=I(i,j)+val;
        
        subM=M(1:i,1:j);
        subM(i,j)=subM(i,j)-I(i,j);
        [~,index]=max(subM(:));
        [r,c]=ind2sub(size(subM),index);
        ROW(i,j)=r;
        COL(i,j)=c;
    end
end

subM=M;
[val,index]=max(subM(:));
[r0,c0]=ind2sub(size(subM),index);

coordX=zeros(val,1);
coordY=zeros(val,1);

ic=1;
coordX(ic)=r0;
coordY(ic)=c0;

while true
    
    r1=ROW(r0,c0);
    c1=COL(r0,c0);
    
    if r1==1 && c1==1
        break;
    end
    
    ic=ic+1;
    coordX(ic)=r1;
    coordY(ic)=c1;
        
    r0=r1;
    c0=c1;
    
end

score=val;
coordX=coordX-1;
coordY=coordY-1;
coordX=flipud(coordX);
coordY=flipud(coordY);
