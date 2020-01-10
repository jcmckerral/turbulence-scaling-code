%% Plots Fig 2c (predator-prey limit cycles with and without turbulence)
clear
%% Set base values
load('data_for_figures.mat')
% predator size (m), prey size ratio
lc=1;
rho=0.1;

%% Set parameter values for laminar regime

mc = lc;
r=(18/2)*(rho^(-0.25*3))*mc^(-0.25*3);
d=(18/2)*mc^(-0.25*3);
e=mc^(1/5)/4.5;
a=16*mc^(-0.25*3)/e;
K=0.05*(rho^(-0.33*3))*mc^(-0.33*3);
h=0.08*mc^(-0.33*3);

% dimensionless system equilibria
c=d/r;
m=e*a/r;
k=K/h;
usol=c/(m-c);
vsol=usol*(1-usol/k)/c;
% analytic equilibria
R3=h*usol;
C3=h*vsol*e;

%% Change conversion efficiency and consumption rates for turbulent regime
e1=mc^(-1.7)/80.4;
a1=16*mc^(-0.25*3)/e1;
m1=e1*a1/r;
usol1=c/(m1-c);
vsol1=usol*(1-usol/k)/c;
% analytic equilibria 
R2=h*usol1;
C2=h*vsol1*e1;

%% Run ODE simulator for limit cycle
% initial values (x0) to be nearby to equilibria
ti=[0:.01:200];
    x0=[R3+.0001,C3+.000001];
[t1,y1] = ode23s(@rmaode_lam, ti, x0);

ti=[0:.005:200];
x0=[R2-.000001,C2-.000001];
[t2,y2] = ode23s(@rmaode_turb, ti, x0);

%% Plot
figure
hold on
box on
set(gca, 'YScale', 'log','XScale','log')
ax.XTick=[1.0E-3,1.0E-2,1.0E-1];
ax.YTick=[1.0E-3,1.0E-2,1.0E-1];
xlim([0.4E-3 0.7]);
ylim([0.0005 0.19]);
loglog(y1(:,1),y1(:,2),'LineStyle','-','Color',[0.60,0.60,0.60],'LineWidth',3)
loglog(y2(:,1),y2(:,2),'LineStyle','-','Color',[0.30,0.30,0.30],'LineWidth',3)
plot(R3,C3,'o','Color',[0.60,0.60,0.60],'MarkerSize',11,'MarkerFaceColor',[0.60,0.60,0.60])
plot(R2,C2,'o','Color',[0.30,0.30,0.30],'MarkerSize',11,'MarkerFaceColor',[0.30,0.30,0.30])
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
xlabel('Log_1_0 Prey (0.1m) (m^-^1)') 
ylabel('Log_1_0 Predators (1m) (m^-^1)')
