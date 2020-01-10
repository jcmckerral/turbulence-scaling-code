%% Generate Fig 2a (data and model for fishing adjusted size-spectrum)
% Imports data and turbulent model script
clear
load('data_for_figures.mat')
%% Get consumer equilibria for different prey lengths
% set up output vector 
l=length(L);
OUT=zeros(l,2);

% call turbulent model function for turbulent regime
for i=1:l;
    [R C]=turb_ode(L(i,1));
    OUT(i,1)=R;
    OUT(i,2)=C;
end

% set up output vector and call turbulent model script for laminar regime
% (second call is just to colour the plot, the script is the same.)
l=length(L1);
OUT1=zeros(l,2);

for i=1:l;
    [R C]=turb_ode(L1(i,1));
    OUT1(i,1)=R;
    OUT1(i,2)=C;
end

logOUT=log10(OUT);
logOUT1=log10(OUT1);

%% Plot figure (consumer abundances at equlibrium)
figure
box on
% plot the empirical data
LSS=[lss;lms];
LSA=[lsa;lma];
hold on
%superimpose the model results and do some formatting
plot(LSS,LSA,'o','Color',[0.2,0.1333,0.5333],'MarkerFaceColor',[0.2,0.1333,0.5333],'MarkerSize',4)
plot(ladjs,ladja,'v','Color',[0.867 0.8 0.467],'MarkerFaceColor',[0.867 0.8 0.467],'MarkerSize',4)
plot(log10(L),logOUT(:,2),'LineStyle','-.','Color',[0.40,0.40,0.40],'LineWidth',4.5)
plot(log10(L1),logOUT1(:,2),'Color',[0.533,0.8,0.933],'LineWidth',4.5)
ax=gca;
xlim([-8 2]);
ylim([-8 6]);
ax.XTick=[-8 -4 0 4];
ax.XTickLabel={'10^-^8','10^-^4','10^0'};
ax.YTick=[-8 -4 0 4];
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
ax.YTickLabel={'10^-^8','10^-^4','10^0','10^4'};
xlabel('Log_1_0 Size (m)') 
ylabel('Log_1_0 Abundance (m^-^1)')