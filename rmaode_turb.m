%% Script to simulate the Rosenzweig-Macarthur system in the turbulent regime
% coefficients standardised to n units per length scale
% r=birth rate, d=death rate, e=conversion
% efficiency, a=consumption rate, K=carrying capacity, h=half saturation
function oderma=rmaode_turb(t,X);
oderma=X;
% set predator length, predator/prey size ratio and parameter values
mc=1;
rho=0.1;

r=(9)*(rho^(-0.25*3))*mc^(-0.25*3);
d=(9)*mc^(-0.25*3);
e=mc^(-1.7)/80.4;
a=16*mc^(-0.25*3)/e;
K=0.05*(rho^(-0.33*3))*mc^(-0.33*3);
h=0.08*mc^(-0.33*3);


% Rosenzweig-Macarthur equations
oderma(1)=(r*X(1)*(1-(X(1)/K))- ((a*X(1)*X(2))/(h+X(1))));
oderma(2)=(e*X(2)*a*X(1)/(h+X(1)) - d*X(2));
end