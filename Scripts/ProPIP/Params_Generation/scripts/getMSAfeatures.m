function [N,M,nH,nG]=getMSAfeatures(msa)

nseq=size(msa,1);
%% M
M=size(msa,2);
%% N
N=0;
for i=1:nseq
    t=sum(msa(i,:) ~= '-');
    N=N+t;
end
N=N/nseq;
%% nG & nH
nH=0;
nG=0;
for i=1:M

    col=msa(:,i);

    if sum(col=='-')>0
        nG=nG+1;
    else
        nH=nH+1;
    end
end