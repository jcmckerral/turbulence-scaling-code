function [err, fittedlines] = breakfit(interiorbreak, x, y)

%% Function by John D'Errico
% Source:
% https://au.mathworks.com/matlabcentral/answers/475306-how-to-perform-piece-wise-linear-regression-to-determine-break-point#answer_386674

% objective function to estimate the interior break of a simple broken
% line fit. fittedlines is a cell array, containing the slope and
% intercepts of the pair of fitted lines.

% ensure that x and y are column vectors.
x = x(:);
y = y(:);

nx = numel(x);

breaks = [min(x), interiorbreak, max(x)];

% which points lie in which interval?
xbins = discretize(x, breaks);

% write the problem in matrix form
A = [ones(nx, 1), x - breaks(1), (x - breaks(2)) .* (xbins == 2)];

% we could use pinv here, but it would be slower then backslash,
% and I'll be careful to ensure the problem is not singular.
coef = A \ y;

err = norm(y-A*coef);

% unpack the coefficients so we can convert to a pair of line
% coefficients. I'll do this in a fairly long form so it might be more
% comprehensible.
c1 = coef(1);
s1 = coef(2);
s2 = coef(3);
b1 = breaks(1);
b2 = breaks(2);
fittedlines = {[s1, c1 - b1 * s1], [s2 + s1, c1 - b2 * s2]};

end