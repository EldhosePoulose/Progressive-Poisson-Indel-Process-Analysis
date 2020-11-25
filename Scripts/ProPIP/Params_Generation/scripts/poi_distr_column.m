function poi_distr_column(node,root,lambda,mu,nodes)

if node.isLeaf
    
    funLeaf(node)
 
else
    
    %---------------------------------------------------------------------%
    %- INTERNAL NODE
    %---------------------------------------------------------------------%
    
    poi_distr_column(node.Left,root,lambda,mu,nodes);
    poi_distr_column(node.Right,root,lambda,mu,nodes);
    
    if node.allgap==1
        
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
                node.Left.br_l,...
                node.Right.br_l,...
                node.Left.name,...
                node.Right.name,...
                mu);
            
        elseif node.Left.isLeaf && ~node.Right.isLeaf
            
            %-------------------------------------------------------------%
            %    o
            %   / \
            %  -   o
            %     / \
            %    -   -
            %-------------------------------------------------------------%
            
            fun2(node,...
                node.Left.prob,...
                node.Right.prob,...
                node.Left.br_l,...
                node.Right.br_l,...
                node.Left.name,...
                node.Right.name,...
                node.Left.txt,...
                node.Right.txt,...
                mu);
            
        elseif ~node.Left.isLeaf && node.Right.isLeaf
            
            %-------------------------------------------------------------%
            %     o
            %    / \
            %   o   -
            %  / \
            % -   -
            %-------------------------------------------------------------%
            
            fun2(node,...
                node.Right.prob,...
                node.Left.prob,...
                node.Right.br_l,...
                node.Left.br_l,...
                node.Right.name,...
                node.Left.name,...
                node.Right.txt,...
                node.Left.txt,...
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
            
            fun3(node,...
                node.Left.prob,...
                node.Right.prob,...
                node.Left.br_l,...
                node.Right.br_l,...
                node.Left.name,...
                node.Right.name,...
                node.Left.txt,...
                node.Right.txt,...
                mu)
            
        end
        
    else
        
        %-----------------------------------------------------------------%
        %- at least one subtree contains a character
        %-----------------------------------------------------------------%
        
        if node.Left.isLeaf && node.Right.isLeaf
            
            %-------------------------------------------------------------%
            %- first internal node
            %-------------------------------------------------------------%
            
            if node.Left.allgap == 1
                
                %---------------------------------------------------------%
                %    o
                %   / \
                %  -   A
                %---------------------------------------------------------%
                
                if node.Right.setA==1
                    
                    fun5(node,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.iota,...
                        node.Right.iota,...
                        node.Left.beta,...
                        node.Right.beta,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun4(node,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        mu);
                    
                end
                
            elseif node.Right.allgap == 1
                
                %---------------------------------------------------------%
                %    o
                %   / \
                %  A   -
                %---------------------------------------------------------%
                
                if node.Left.setA==1
                    
                    fun5(node,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.iota,...
                        node.Left.iota,...
                        node.Right.beta,...
                        node.Left.beta,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun4(node,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        mu);
                    
                end
                
            else
                
                %---------------------------------------------------------%
                %    o
                %   / \
                %  A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun6(node,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        lambda,...
                        mu)
                    
                else
                    
                    fun7(node,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        mu)
                    
                end
                
            end
            
        elseif node.Left.isLeaf && ~node.Right.isLeaf
            
            if node.Left.allgap == 1
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    -   o
                %       / \
                %      A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun8(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun9(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        mu);
                    
                end
                
            elseif node.Right.allgap == 1
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    A   o
                %       / \
                %      -   -
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun12new(node,...
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
                    
                    fun13(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        mu);
                    
                end
                
            else
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    A   o
                %       / \
                %      A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun10(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun11(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        mu);
                    
                end
                
            end
            
        elseif ~node.Left.isLeaf && node.Right.isLeaf
            
            if node.Right.allgap == 1
                
                %---------------------------------------------------------%
                %     o
                %    / \
                %   o   -
                %  / \
                % A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun8(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun9(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        mu);
                    
                end
                
            elseif node.Left.allgap == 1
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    o   A
                %   / \
                %  -   -
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun12new(node,...
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
                    
                else
                    
                    fun13(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        mu);
                    
                end
                
            else
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    o   A
                %   / \
                %  A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun10(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun11(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        mu);
                    
                end
                
            end
            
        else
            
            if node.Left.allgap == 1
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    /   \
                %   o     o
                %  / \   / \
                % -   - A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun12(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun13(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        mu);
                    
                end
                
            elseif node.Right.allgap == 1
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    /   \
                %   o     o
                %  / \   / \
                % A   A -   -
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun12(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun13(node,...
                        node.Right.prob,...
                        node.Left.prob,...
                        node.Right.br_l,...
                        node.Left.br_l,...
                        node.Right.name,...
                        node.Left.name,...
                        node.Right.txt,...
                        node.Left.txt,...
                        mu);
                    
                end
                
            else
                
                %---------------------------------------------------------%
                %      o
                %     / \
                %    /   \
                %   o     o
                %  / \   / \
                % A   A A   A
                %---------------------------------------------------------%
                
                if node.setA==1
                    
                    fun14(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        lambda,...
                        mu);
                    
                else
                    
                    fun15(node,...
                        node.Left.prob,...
                        node.Right.prob,...
                        node.Left.br_l,...
                        node.Right.br_l,...
                        node.Left.name,...
                        node.Right.name,...
                        node.Left.txt,...
                        node.Right.txt,...
                        mu);
                    
                end
                
            end
            
        end
        
    end
    
end

end % function
%%
function funLeaf(node)

node.prob=1;
node.txt={''};

end
%%
function fun1(node,b1,b2,n1,n2,mu)

pL=1-exp(-mu*b1);
pR=1-exp(-mu*b2);

node.prob=pL*pR;

node.txt{1}=strcat('(1-exp(-mu*',n1,'.bl','))','*','(1-exp(-mu*',n2,'.bl','))');

end
%%
function fun2(node,p1,p2,b1,b2,n1,n2,t1,t2,mu)

pL=1-exp(-mu*b1);
pR=[p2 * exp(-mu*b2);
    1-exp(-mu*b2)];

p=zeros(length(pL)*length(pR),1);

pLtxt=cell(length(pL),1);
pLtxt{1}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(length(pR),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end
pRtxt{end}=strcat('(1-exp(-mu*',n2,'.bl','))');

txt=cell(length(pL)*length(pR),1);

k=1;
for i=1:length(pL)
    for j=1:length(pR)
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

node.prob=p;

node.txt=txt;

end
%%
function fun3(node,p1,p2,b1,b2,n1,n2,t1,t2,mu)

pL=[p1 * exp(-mu*b1);
    1-exp(-mu*b1)];
pR=[p2 * exp(-mu*b2);
    1-exp(-mu*b2)];

p=zeros(length(pL)*length(pR),1);

pLtxt=cell(length(pL),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end
pLtxt{end}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(length(pR),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end
pRtxt{end}=strcat('(1-exp(-mu*',n2,'.bl','))');

txt=cell(length(pL)*length(pR),1);

k=1;
for i=1:length(pL)
    for j=1:length(pR)
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

node.prob=p;

node.txt=txt;

end
%%
function fun4(node,b1,b2,n1,n2,mu)

pL=1-exp(-mu*b1);
pR=exp(-mu*b2);

node.prob=[pL*pR;
    exp(-mu*b2)];

node.txt{1}=strcat('(1-exp(-mu*',n1,'.bl','))','*','exp(-mu*',n2,'.bl',')');
node.txt{2}=strcat('exp(-mu*',n2,'.bl',')');

end
%%
function fun5(node,b1,b2,n1,n2,iota1,iota2,beta1,beta2,lambda,mu)

pL=1-exp(-mu*b1);
pR=exp(-mu*b2);

if isempty(node.Parent)
    node.txt=cell(2,1);
    node.txt{1}=strcat('lambda/mu*(1-exp(-mu*',n1,'.bl','))*exp(-mu*',n2,'.bl',')');
    %node.txt{2}=strcat('lambda*',n2,'.bl', '*',n2,'.beta');
    node.txt{2}=strcat('lambda/mu*','(1-exp(-mu*',n2,'.bl','))');
    
    node.prob=zeros(2,1);
    node.prob(1) = lambda/mu * pL*pR;
    node.prob(2) = (lambda*b2) * beta2;
else
    node.txt=cell(3,1);
    %node.txt{1}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*','(1-exp(-mu*',n1,'.bl','))','*','exp(-mu*',n2,'.bl',')');
    %node.txt{2}=strcat('lambda*',n2,'.bl','*',n2,'.beta');
    node.txt{1}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*','(1-exp(-mu*',n1,'.bl','))','*','exp(-mu*',n2,'.bl',')');
    node.txt{2}=strcat('lambda/mu*','(1-exp(-mu*',n2,'.bl','))');
    node.txt{3}=strcat('(1-exp(-mu*',n1,'.bl','))','*','exp(-mu*',n2,'.bl',')');
    
    node.prob=zeros(3,1);
    node.prob(1) = (lambda*node.br_l) * node.beta * pL*pR;
    node.prob(2) = (lambda*b2) * beta2;
    node.prob(3) = pL*pR;
end

end
%%
function fun6(node,b1,b2,n1,n2,lambda,mu)

pL=exp(-mu*b1);
pR=exp(-mu*b2);

if isempty(node.Parent)
    node.txt=cell(1,1);
    node.txt{1}=strcat('lambda/mu*','exp(-mu*',n1,'.bl',')','*','exp(-mu*',n2,'.bl',')');
    
    node.prob = lambda/mu * pL*pR;
else
    node.txt=cell(2,1);
    %node.txt{1}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*','exp(-mu*',n1,'.bl',')','*','exp(-mu*',n2,'.bl',')');
    node.txt{1}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*','exp(-mu*',n1,'.bl',')','*','exp(-mu*',n2,'.bl',')');
    node.txt{2}=strcat('exp(-mu*',n1,'.bl',')*exp(-mu*',n2,'.bl',')');
    
    node.prob=zeros(2,1);
    node.prob(1) = (lambda*node.br_l) * node.beta * pL*pR;
    node.prob(2) = pL*pR;
end

end
%%
function fun7(node,b1,b2,n1,n2,mu)

pL=exp(-mu*b1);
pR=exp(-mu*b2);

node.prob=pL*pR;
node.txt=cell(1,1);
node.txt{1}=strcat('exp(-mu*',n1,'.bl',')','*','exp(-mu*',n2,'.bl',')');

end
%%
function fun8(node,p1,p2,b1,b2,n1,n2,t1,t2,lambda,mu)

pL=1-exp(-mu*b1);
pR=p2;

pLtxt=cell(length(pL),1);
pLtxt{1}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=t2;

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
            exp(-mu*b2) * pR(j)];
        if isempty(pRtxt{j})
            txtRWO{end+1}=strcat('exp(-mu*',n2,'.bl',')');
        else
            txtRWO{end+1}=strcat('exp(-mu*',n2,'.bl',')','*',pRtxt{j});
        end
    end
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
if isempty(txtRWO)
    
    % ERROR
    error('ERROR, case not handled')
    
else
    
    if isempty(node.Parent)
        
        txt=cell(length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        p=zeros(length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = lambda/mu * pRWO(i) * pL(j);
                txt{k}=strcat('lambda/mu*',txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=txtRWI{i};
            k=k+1;
        end
        
    else
        
        txt=cell(2*length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        p=zeros(2*length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = (lambda*node.br_l) * node.beta * pRWO(i) * pL(j);
                %txt{k}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*',txtRWO{i},'*',pLtxt{j});
                txt{k}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = pRWO(i) * pL(j);
                txt{k}=strcat(txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=strcat(txtRWI{i});
            k=k+1;
        end
        
    end
    
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
node.prob=p;

node.txt=txt;

end
%%
function fun9(node,p1,p2,b1,b2,n1,n2,t1,t2,mu)

pL=1-exp(-mu*b1);
pR=p2 * exp(-mu*b2);

pLtxt=cell(length(pL),1);
pLtxt{1}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end

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

p=zeros(lL*lR,1);

txt=cell(lL*lR,1);

k=1;
for i=1:lL
    for j=1:lR
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

node.prob=p;

node.txt=txt;

end
%%
function fun10(node,p1,p2,b1,b2,n1,n2,t1,t2,lambda,mu)

pL = exp(-mu*b1) * p1;
pR = exp(-mu*b2) * p2;

pLtxt=cell(size(t1,1),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end

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

p=zeros(lL*lR,1);

txt=cell(lL*lR,1);

k=1;
for i=1:lL
    for j=1:lR
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

if isempty(node.Parent)
    node.txt=cell(length(txt),1);
    
    for i=1:length(txt)
        node.txt{i}=strcat('lambda/mu*',txt{i});
    end
    
    node.prob = lambda/mu * p;
else
    node.txt=cell(2*length(txt),1);
    k=1;
    for i=1:length(txt)
        %node.txt{k}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*',txt{i});
        node.txt{k}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',txt{i});
        k=k+1;
    end
    for i=1:length(txt)
        node.txt{k}=txt{i};
        k=k+1;
    end
    
    node.prob = [(lambda*node.br_l) * node.beta * p;
                p];

end

end
%%
function fun11(node,p1,p2,b1,b2,n1,n2,t1,t2,mu)

pL = exp(-mu*b1) * p1;
pR = exp(-mu*b2) * p2;

pLtxt=cell(size(t1,1),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end

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

p=zeros(lL*lR,1);

txt=cell(lL*lR,1);

k=1;
for i=1:lL
    for j=1:lR
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

node.prob=p;
node.txt=txt;

end
%%
function fun12(node,p1,p2,b1,b2,n1,n2,t1,t2,lambda,mu)

pL=[p1 * exp(-mu*b1);
    1-exp(-mu*b1)];
pR=p2;

pLtxt=cell(length(pL),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end
pLtxt{end}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    pRtxt{i}=t2{i};
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
            exp(-mu*b2) * pR(j)];
        if isempty(pRtxt{j})
            txtRWO{end+1}=strcat('exp(-mu*',n2,'.bl',')');
        else
            txtRWO{end+1}=strcat('exp(-mu*',n2,'.bl',')','*',pRtxt{j});
        end
    end
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
if isempty(txtRWO)
    
    % ERROR
    error('ERROR, case not handled')
    
else
    
    if isempty(node.Parent)
        
        txt=cell(length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        p=zeros(length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = lambda/mu * pRWO(i) * pL(j);
                txt{k}=strcat('lambda/mu*',txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=txtRWI{i};
            k=k+1;
        end
        
    else
        
        txt=cell(2*length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        p=zeros(2*length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = (lambda*node.br_l) * node.beta * pRWO(i) * pL(j);
                %txt{k}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*',txtRWO{i},'*',pLtxt{j});
                txt{k}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = pRWO(i) * pL(j);
                txt{k}=strcat(txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=strcat(txtRWI{i});
            k=k+1;
        end
        
    end
    
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
node.prob=p;

node.txt=txt;

end
%%
function fun12new(node,p1,p2,b1,b2,n1,n2,iota1,iota2,beta1,beta2,t1,t2,lambda,mu)

pL=[p1 * exp(-mu*b1);
    1-exp(-mu*b1)];
pR=[p2;
    (lambda*b2) * beta2];

pLtxt=cell(length(pL),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end
pLtxt{end}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(size(pR,1),1);
for i=1:size(t2,1)
    pRtxt{i}=t2{i};
end
%pRtxt{end}=strcat('lambda*',n2,'.bl','*',n2,'.beta');
pRtxt{end}=strcat('lambda/mu*','(1-exp(-mu*',n2,'.bl','))');

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
            exp(-mu*b2) * pR(j)];
        if isempty(pRtxt{j})
            txtRWO{end+1}=strcat('exp(-mu*',n2,'.bl',')');
        else
            txtRWO{end+1}=strcat('exp(-mu*',n2,'.bl',')','*',pRtxt{j});
        end
    end
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
if isempty(txtRWO)
    
    % ERROR
    error('ERROR, case not handled')
    
else
    
    if isempty(node.Parent)
        
        txt=cell(length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        p=zeros(length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = lambda/mu * pRWO(i) * pL(j);
                txt{k}=strcat('lambda/mu*',txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=txtRWI{i};
            k=k+1;
        end
        
    else
        
        txt=cell(2*length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        p=zeros(2*length(txtRWO)*length(pLtxt)+length(txtRWI),1);
        
        k=1;
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = (lambda*node.br_l) * node.beta * pRWO(i) * pL(j);
                %txt{k}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*',txtRWO{i},'*',pLtxt{j});
                txt{k}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWO)
            for j=1:length(pLtxt)
                p(k) = pRWO(i) * pL(j);
                txt{k}=strcat(txtRWO{i},'*',pLtxt{j});
                k=k+1;
            end
        end
        for i=1:length(txtRWI)
            p(k) = pRWI(i);
            txt{k}=strcat(txtRWI{i});
            k=k+1;
        end
        
    end
    
end
%.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.%
node.prob=p;

node.txt=txt;

end
%%
function fun13(node,p1,p2,b1,b2,n1,n2,t1,t2,mu)

pL=[p1 * exp(-mu*b1);
    1-exp(-mu*b1)];
pR=p2 * exp(-mu*b2);

pLtxt=cell(length(pL),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end
pLtxt{end}=strcat('(1-exp(-mu*',n1,'.bl','))');

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end

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

p=zeros(lL*lR,1);

txt=cell(lL*lR,1);

k=1;
for i=1:lL
    for j=1:lR
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

node.prob=p;

node.txt=txt;

end
%%
function fun14(node,p1,p2,b1,b2,n1,n2,t1,t2,lambda,mu)

pL = exp(-mu*b1) * p1;
pR = exp(-mu*b2) * p2;

pLtxt=cell(size(t1,1),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end

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

p=zeros(lL*lR,1);

txt=cell(lL*lR,1);

k=1;
for i=1:lL
    for j=1:lR
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

if isempty(node.Parent)
    node.txt=cell(length(txt),1);
    
    for i=1:length(txt)
        node.txt{i}=strcat('lambda/mu*',txt{i});
    end
    
    node.prob = lambda/mu * p;
else
    node.txt=cell(2*length(txt),1);
    k=1;
    for i=1:length(txt)
        %node.txt{k}=strcat('lambda*',node.name,'.bl','*',node.name,'.beta','*',txt{i});
        node.txt{k}=strcat('lambda/mu*','(1-exp(-mu*',node.name,'.bl','))','*',txt{i});
        k=k+1;
    end
    for i=1:length(txt)
        node.txt{k}=txt{i};
        k=k+1;
    end
    
    node.prob = [(lambda*node.br_l) * node.beta * p;
        p];
end

end
%%
function fun15(node,p1,p2,b1,b2,n1,n2,t1,t2,mu)

pL = exp(-mu*b1) * p1;
pR = exp(-mu*b2) * p2;

pLtxt=cell(size(t1,1),1);
for i=1:size(t1,1)
    if isempty(t1{i})
        pLtxt{i}=strcat(t1{i},'exp(-mu*',n1,'.bl',')');
    else
        pLtxt{i}=strcat(t1{i},'*','exp(-mu*',n1,'.bl',')');
    end
end

pRtxt=cell(size(t2,1),1);
for i=1:size(t2,1)
    if isempty(t2{i})
        pRtxt{i}=strcat(t2{i},'exp(-mu*',n2,'.bl',')');
    else
        pRtxt{i}=strcat(t2{i},'*','exp(-mu*',n2,'.bl',')');
    end
end

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

p=zeros(lL*lR,1);

txt=cell(lL*lR,1);

k=1;
for i=1:lL
    for j=1:lR
        p(k)=pL(i)*pR(j);
        
        txt{k}=strcat(pLtxt{i},'*',pRtxt{j});
        
        k=k+1;
    end
end

node.prob=p;
node.txt=txt;

end


