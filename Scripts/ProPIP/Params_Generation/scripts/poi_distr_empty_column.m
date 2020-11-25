function poi_distr_empty_column(node,root,lambda,mu,nodes)

if node.isLeaf
    
    funLeaf(node,lambda,mu)
    
else
    
    %---------------------------------------------------------------------%
    %- INTERNAL NODE
    %---------------------------------------------------------------------%
    
    poi_distr_empty_column(node.Left,root,lambda,mu,nodes);
    poi_distr_empty_column(node.Right,root,lambda,mu,nodes);
    
    %-----------------------------------------------------------------%
    %- both subtrees are gaps
    %-----------------------------------------------------------------%
    
    if node.Left.isLeaf && node.Right.isLeaf
        
        %-------------------------------------------------------------%
        %    o
        %   / \
        %  -   -
        %-------------------------------------------------------------%
        
        fun1(node,...
            node.Left.prob,...
            node.Right.prob,...
            node.Left.br_l,...
            node.Right.br_l,...
            node.Left.name,...
            node.Right.name,...
            node.Left.iota,...
            node.Right.iota,...
            node.Left.beta,...
            node.Right.beta,...
            node.Left.txt,...
            node.Right.txt,...
            lambda,...
            mu);
        
    elseif node.Left.isLeaf && ~node.Right.isLeaf
        
        %-------------------------------------------------------------%
        %    o
        %   / \
        %  -   o
        %     / \
        %    -   -
        %-------------------------------------------------------------%
        
        fun8(node,...
            node.Left.prob,...
            node.Right.prob,...
            node.Left.br_l,...
            node.Right.br_l,...
            node.Left.name,...
            node.Right.name,...
            node.Left.iota,...
            node.Right.iota,...
            node.Left.beta,...
            node.Right.beta,...
            node.Left.txt,...
            node.Right.txt,...
            lambda,...
            mu);
        
    elseif ~node.Left.isLeaf && node.Right.isLeaf
        
        %-------------------------------------------------------------%
        %     o
        %    / \
        %   o   -
        %  / \
        % -   -
        %-------------------------------------------------------------%
        
        fun8(node,...
            node.Right.prob,...
            node.Left.prob,...
            node.Right.br_l,...
            node.Left.br_l,...
            node.Right.name,...
            node.Left.name,...
            node.Right.iota,...
            node.Left.iota,...
            node.Right.beta,...
            node.Left.beta,...
            node.Right.txt,...
            node.Left.txt,...
            lambda,...
            mu);
        
    else
        
        %-------------------------------------------------------------%
        %      o
        %     / \
        %    /   \
        %   o     o
        %  / \   / \
        % -   - -   -
        %-------------------------------------------------------------%
        
        fun8(node,...
            node.Right.prob,...
            node.Left.prob,...
            node.Right.br_l,...
            node.Left.br_l,...
            node.Right.name,...
            node.Left.name,...
            node.Right.iota,...
            node.Left.iota,...
            node.Right.beta,...
            node.Left.beta,...
            node.Right.txt,...
            node.Left.txt,...
            lambda,...
            mu);
        
    end
    
    
    
end

end % function
%%
function funLeaf(node,lambda,mu)

node.prob=lambda*node.br_l-lambda/mu*(1-exp(-mu*node.br_l));

node.txt=cell(1,1);
node.txt{1}=strcat('lambda*',node.name,'.bl','-','lambda/mu*','(1-exp(-mu*',node.name,'.bl','))');;

end
%%
function fun1(node,p1,p2,b1,b2,n1,n2,iota1,iota2,beta1,beta2,t1,t2,lambda,mu)

pL=[p1;
    1-exp(-mu*b1)];
pR=[p2;
    1-exp(-mu*b2)];

if isempty(node.Parent)
 
    pLtxt=cell(2,1);
    pLtxt{1}=t1{1};
    pLtxt{2}=strcat('(1-exp(-mu*',n1,'.bl','))');
    
    pRtxt=cell(2,1);
    pRtxt{1}=t2{1};
    pRtxt{2}=strcat('(1-exp(-mu*',n2,'.bl','))');
    
    txt=cell(3,1);
    txt{1}=pLtxt{1};
    txt{2}=pRtxt{1};
    txt{3}=strcat('lambda/mu*',pLtxt{2},'*',pRtxt{2});
    
    p=zeros(3,1);
    p(1)=pL(1);
    p(2)=pR(1);
    p(3)=lambda/mu*pL(2)*pR(2);
    
else
    
    pLtxt=cell(2,1);
    pLtxt{1}=t1{1};
    pLtxt{2}=strcat('(1-exp(-mu*',n1,'.bl','))');
    
    pRtxt=cell(2,1);
    pRtxt{1}=t2{1};
    pRtxt{2}=strcat('(1-exp(-mu*',n2,'.bl','))');
    
    txt=cell(5,1);
    txt{1}=pLtxt{1};
    txt{2}=pRtxt{1};
    txt{3}=strcat('lambda*',node.name,'.bl','-','lambda/mu*','(1-exp(-mu*',node.name,'.bl','))');
    txt{4}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',pLtxt{2},'*',pRtxt{2});
    txt{5}=strcat('exp(-mu*',node.name,'.bl',')','*',pLtxt{2},'*',pRtxt{2});
    
    p=zeros(5,1);
    p(1)=pL(1);
    p(2)=pR(1);
    p(3)=lambda*node.br_l*(1-node.beta);
    p(4)=lambda/mu*(1-exp(-mu*node.br_l))*pL(2)*pR(2);
    p(5)=exp(-mu*node.br_l)*pL(2)*pR(2);
    
end

node.prob=p;

node.txt=txt;

end
%%
function fun8(node,p1,p2,b1,b2,n1,n2,iota1,iota2,beta1,beta2,t1,t2,lambda,mu)

pL=[p1;
    (1-exp(-mu*b1))];
pR=[p2;
    (1-exp(-mu*b2))];

pLtxt=cell(length(pL),1);
pLtxt(1:end-1)=t1(:);
pLtxt{end}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(length(pR),1);
pRtxt(1:end-1)=t2(:);
pRtxt{end}=strcat('(1-exp(-mu*',n2,'.bl','))');

if isempty(pLtxt)
    pLtxt={''};
    lL=1;
else
    lL=length(pLtxt);
end

if isempty(pRtxt)
    pRtxt={''};
    lR=1;
else
    lR=length(pRtxt);
end

%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
% splits the hom. paths with/without insertion
pRWI=[]; % hom. paths prob. with insertion
pRWO=[]; % hom. paths prob. without insertion

txtRWI=[]; % hom. paths with an insertion
txtRWO=[]; % hom. paths without an insertion
for j=1:lR
    if contains(pRtxt{j},'lambda','IgnoreCase',false)
        pRWI=[pRWI;
            pR(j)];
        txtRWI{end+1}=pRtxt{j};
    else
        pRWO=[pRWO;
              pR(j)];
        txtRWO{end+1}=pRtxt{j};
    end
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
% splits the hom. paths with/without insertion
pLWI=[]; % hom. paths prob. with insertion
pLWO=[]; % hom. paths prob. without insertion

txtLWI=[]; % hom. paths with an insertion
txtLWO=[]; % hom. paths without an insertion
for j=1:lL
    if contains(pLtxt{j},'lambda','IgnoreCase',false)
        pLWI=[pLWI;
            pL(j)];
        txtLWI{end+1}=pLtxt{j};
    else
        pLWO=[pLWO;
              pL(j)];
        txtLWO{end+1}=pLtxt{j};
    end
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
if isempty(txtRWO)
    
    % ERROR
    error('ERROR, case not handled')
    
else
    
    if isempty(node.Parent)
        
        txt=cell(length(txtRWO)*length(txtLWO)+length(txtRWI)+length(txtLWI),1);
        p=zeros(length(txtRWO)*length(txtLWO)+length(txtRWI)+length(txtLWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(txtLWO)
                p(k) = lambda/mu * pRWO(i) * pLWO(j);
                txt{k}=strcat('lambda/mu*',txtRWO{i},'*',txtLWO{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=txtRWI{i};
            k=k+1;
        end
        for i=1:length(txtLWI)
            p(k) = pLWI(i);
            txt{k}=txtLWI{i};
            k=k+1;
        end
        
    else
        
        txt=cell(2*length(txtRWO)*length(txtLWO)+length(txtRWI)+length(txtLWI)+1,1);
        p=zeros(length(txtRWO)*length(txtLWO)+length(txtRWI)+length(txtLWI)+1,1);
        
        
        p(1)=lambda*node.br_l*(1-node.beta);
        txt{1}=strcat('lambda*',node.name,'.bl','-','lambda/mu*','(1-exp(-mu*',node.name,'.bl','))');
        
        k=2;
        
        for i=1:length(txtRWO)
            for j=1:length(txtLWO)
                p(k) = lambda/mu*(1-exp(-mu*node.br_l))*pRWO(i) * pLWO(j);
                txt{k}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',txtRWO{i},'*',txtLWO{j});
                k=k+1;
                p(k) = exp(-mu*node.br_l)*pRWO(i) * pLWO(j);
                txt{k}=strcat('exp(-mu*',node.name,'.bl',')','*',txtRWO{i},'*',txtLWO{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=txtRWI{i};
            k=k+1;
        end
        for i=1:length(txtLWI)
            p(k) = pLWI(i);
            txt{k}=txtLWI{i};
            k=k+1;
        end
        
    end
    
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
node.prob=p;

node.txt=txt;

end

