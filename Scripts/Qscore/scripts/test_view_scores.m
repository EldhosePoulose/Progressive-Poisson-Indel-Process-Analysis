clc
clear all
close all
%%
filenameI='qscore_913_20';
fontsize=18;
linewidth=2;
%%
[Q,TC,Cline,Modeler]=read_q_scores(filenameI);
%%
figure
hold on
plot(Q,'b-','LineWidth',linewidth)
plot(TC,'r-','LineWidth',linewidth)
xlabel('N')
ylabel('scores')
legend('Q','TC')
legend 'boxoff'
legend('location','bestoutside')
axis tight
grid on
set(gca,'fontsize', fontsize);
hold off



