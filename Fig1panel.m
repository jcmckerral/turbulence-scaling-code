%% Plots the empirical data for figure panel 1
% Uses: subtightplot.m by F. Nievinski - source at:
% https://www.mathworks.com/matlabcentral/fileexchange/39664-subtightplot
clear
load('data_for_figures.mat')
figure

%% Fig 1a

raw=subtightplot(3,2,1,[0.05,0.04]);
box on
hold on
plot(lss,lsa,'^','Color',[0.2,0.1333,0.5333],'MarkerFaceColor',[0.2,0.1333,0.5333],'MarkerSize',3);
plot(lms,lma,'^','Color',[0.2,0.1333,0.5333],'MarkerFaceColor',[0.2,0.1333,0.5333],'MarkerSize',3);
plot(lls,lla,'o','Color',[0.2667,0.667,0.6],'MarkerFaceColor',[0.2667 0.667 0.6],'MarkerSize',3);
xlim(raw,[-8 2]);
ylim(raw,[-8 8]);
ax=gca;
ax.XTick=[-8 -5 -2 1];
ax.XTickLabel={'10^-^8','10^-^5','10^-^2','10^1'};
ax.YTick=[-8 -3 2 7];
ax.YTickLabel={'10^-^8','10^-^3','10^2','10^7'};

%% Figs 1b and 1c

fish=subtightplot(3,2,3,[0.05,0.04]);
plot(lls,lla,'o','Color',[0.2667,0.667,0.6],'MarkerFaceColor',[0.2667,0.667,0.6],'MarkerSize',3);
hold on
plot(ladjs,ladja,'v','Color',[0.867 0.8 0.467],'MarkerFaceColor',[0.867 0.8 0.467],'MarkerSize',3);
xlim(fish,[-1 1.6]);
ylim(fish,[-8 3]);
ax=gca;
ax.XTick=[-1 0 1];
ax.XTickLabel={'10^-^1','10^0','10^1'};
ax.YTick=[-8 -4 0];
ax.YTickLabel={'10^-^8','10^-^4','10^0'};
ylabel('Log_1_0 Abundance (m^-^1)')

rot=subtightplot(3,2,4,[0.05,0.04]);
plot(ladjs,ladja,'v','Color',[0.867 0.8 0.467],'MarkerFaceColor',[0.867 0.8 0.467],'MarkerSize',3);
hold on
plot(lls,lrota,'o','Color',[0.533,0.133,0.333],'MarkerFaceColor',[0.533,0.133,0.333],'MarkerSize',3);
xlim(rot,[-1 1.6]);
ylim(rot,[-8 3]);
ax=gca;
ax.XTick=[-1 0 1 ];
ax.XTickLabel={'10^-^1','10^0','10^1'};
ax.YTick=[-8 -4 0 ];
ax.YTickLabel={'','','',''};


%% Fig 1d
tot=subtightplot(3,2,5,[0.05,0.04]);
plot(tots,tota,'o','Color',[0.533,0.133,0.333],'MarkerFaceColor',[0.533,0.133,0.333],'MarkerSize',3);
xlim(tot,[-8 2]);
ylim(tot,[-8 8]);
ax=gca;
ax.XTick=[-8 -5 -2 1];
ax.XTickLabel={'10^-^8','10^-^5','10^-^2','10^1'};
ax.YTick=[-8 -3 2 7];
ax.YTickLabel={'10^-^8','10^-^3','10^2','10^7'};
xlabel('Log_1_0 Size (m)') 

