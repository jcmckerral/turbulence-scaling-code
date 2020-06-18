function [R, C, ev] = modelEquilibria(lc, ppmr, adjflag)

%% Analytical solutions to the RM system with scaling values on size.
% coefficients standardised to n units per length scale
% coefficient and scaling values in table S2
% set consumer-resource size ratio, convert length to mass, solve for
% analytic equilibria points. r=birth rate, d=death rate, e=conversion
% efficiency, a=consumption rate, K=carrying capacity, h=half saturation

rho = ppmr;
r = (3E4) * (rho^(-0.25 * 3)) * lc^(-0.25 * 3);
d = (4.5E5) * lc^(-0.25 * 3);

% check whether to adjust for turbulence (0=no, 1=yes)
if adjflag == 0
    % account for turbulent swim cost.adds a size-dependent condition
    % for scaling on conversion efficiency and consumption rate.
    if lc < (0.1 / (10^(-7.5))) % standardise length
        e = (lc^(1 / 5) / 160);
    else
        e = 8E7 * lc^(-1.3);
    end
else
    e = (lc^(1 / 5) / 160);
end
a = 2E4 * lc^(0.25 * 3) / e;
K = 9E5 * (rho^(-0.25 * 3)) * lc^(-0.25 * 3);
h = 2E4 * lc^(0.23 * 3);

% convert/solve dimensionless sytem
c = d / r;
m = e * a / r;
k = K / h;
usol1 = c / (m - c);
vsol1 = (1 + usol1) * (1 - usol1 / k) / m;

% convert back to original system
R = (h * usol1);
C = (h * vsol1 * e);
ev = e;
end