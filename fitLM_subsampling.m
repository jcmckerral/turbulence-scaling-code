function [slope] = fitLM_subsampling(matrixin)

% quick function to get regression parameters
% matlab's fitlm is too slow for bootstrapping

% input is simply a subsampled n by 2 (size-abundance data) matrix
% *not* log transformed
% output is the alpha estimate for the input matrix

% transform to log scale
X = log10(matrixin(:, 1));
Y = log10(matrixin(:, 2));

% add intercept parameter so it's a fit to Y=mX+b
X = [ones(size(X)), X];

% fast coefficient fit
Coeff = X \ Y;

slope = Coeff(2); % we want the slope which is the second coefficient
end