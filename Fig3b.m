%% Generate Fig 2b (turbulence corrected data and laminar regime model)
% Imports data and laminar model script
clear
load('data_for_figures.mat')
%% Get consumer equilibria for different prey lengths
% set up output vector 
l=length(L2);
OUT=zeros(l,2);

% call laminar regime
for i=1:l;
    [R C]=lamin_ode(L2(i,1));
    OUT(i,1)=R;
    OUT(i,2)=C;
end

logOUT=log10(OUT);

%% Plot figure (consumer abundances at equlibrium)
% load('data_for_figures.mat')
figure
box on
% plot the empirical data
LSS=[lss;lms];
LSA=[lsa;lma];
hold on
%superimpose the model results and do some formatting
plot(tots,tota,'o','Color',[0.533,0.133,0.333],'MarkerFaceColor',[0.533,0.133,0.333],'MarkerSize',4)
plot(log10(L2),logOUT(:,2),'LineStyle','-.','Color',[0.533,0.8,0.933],'LineWidth',4.5)
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