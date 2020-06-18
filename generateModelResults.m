function [predLengths, rho, equilibria, efficiency] = generateModelResults(npairs, adjflag)

%% Worker script for generating equilibria
% input is simply how many pairs to simulate, and flag to indicate whether
% to use the model which includes turbulence or adjusts for it

% choose limits on PPMR, create a random selection of PPMRs in that
% interval. Will be evenly spaced on log scale.
b = -2;
a = -0.6;
rho = 10.^((b - a) .* rand(npairs, 1) + a);

% Set size interval. -2 in the PPMR is factored in i.e. the (log10) min
% size will be -7.5
IntStart = -7.5 - b;
IntEnd = 1.2;

% Generate random set of predator lengths, evenly spaced on the log10 size
% interval
predLengths = 10.^((IntEnd - IntStart) .* rand(npairs, 1) + IntStart);

% standardise the lengths
minStand = 10^(-7.5);
predLengths = predLengths / 10^(-7.5);

% set up results matrix and call model script
l = length(predLengths);
OUT1 = zeros(l, 2);
EV1 = zeros(l, 1);

for i = 1:l
    [R, C, e] = modelEquilibria(predLengths(i, 1), rho(i), adjflag);
    OUT1(i, 1) = R;
    OUT1(i, 2) = C;
    EV1(i) = e;
end


equilibria = log10(OUT1);
efficiency = EV1;

end