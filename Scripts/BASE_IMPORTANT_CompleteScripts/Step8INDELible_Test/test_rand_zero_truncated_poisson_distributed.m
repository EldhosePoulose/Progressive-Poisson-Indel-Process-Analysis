clc
clear
close all



%%
N=100000;
lambda=1.7;
%%
u=rand(N,1);
Y=zeros(N,1);
for i=1:N
    Y(i)=rand_zero_truncated_poisson_distributed(lambda,u(i));
end
%%
figure
hhh= histogram(Y,1000,'normalization','probability')
H= hhh.Values;
xlabel('ins. length')
ylabel('prob')
grid on
set(gca,'FontSize',13)

% numIntervals = 5;
% intervalWidth = (max(Y) - min(Y))/numIntervals;
% x = 1:intervalWidth:9;
% ncount = histc(Y,x);
% relativefreq = ncount/length(Y);

X= tabulate(Y);
Xx= X(:,3)./100;

pr1= Y;
npr2= 990;
distPIP=vertcat(pr1')';
% distPIP=horzcat(pr1',zeros(npr2,1)')';

fid_PIP= fopen('mylengthmodel.txt','w');
fprintf(fid_PIP,'%f\n',distPIP);


