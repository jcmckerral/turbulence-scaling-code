function [R, C]=lamin_ode(lc)
%% Analytical solutions to the RM system with scaling values on size.
% coefficients standardised to n units per length scale
% coefficient and scaling values in table S2
% set consumer-resource size ratio, convert length to mass, solve for
% analytic equilibria points. r=birth rate, d=death rate, e=conversion
% efficiency, a=consumption rate, K=carrying capacity, h=half saturation
rho=0.1;
mc = lc;
r=(18/2)*(rho^(-0.25*3))*mc^(-0.25*3);
d=(18/2)*mc^(-0.25*3);
e=(mc^(1/5))/4.5;
a=16*mc^(-0.25*3)/e;
K=0.05*(rho^(-0.33*3))*mc^(-0.33*3);
h=0.08*mc^(-0.33*3); 

% convert/solve dimensionless sytem
c=d/r;
m=e*a/r;
k=K/h;

usol1=c/(m-c);
vsol1=usol1*(1-usol1/k)/c;

% convert back to original system
R=(h*usol1);
C=(h*vsol1*e);

end