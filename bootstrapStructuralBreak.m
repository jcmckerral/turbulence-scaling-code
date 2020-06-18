function xpoint = bootstrapStructuralBreak(doublein)

%% Finds the structural break for a segmented regression
% Assumes the data is x,y and relationship is y=mx+c. Uses optimisation
% toolbox (minimises MSE when fitting two regressions).
% Code adapted from John D'Errico
% https://au.mathworks.com/matlabcentral/answers/475306-how-to-perform-piece-wise-linear-regression-to-determine-break-point#answer_386674


% INPUT
% doublein  nx2 matrix, untransformed size-abundance data

% OUTPUT
% xpoint    the point (in m) where the structural break is in the
%           regression

x = log10(doublein(:, 1));
y = log10(doublein(:, 2));

dx = max(x) - min(x);

[interiorbreak, ~] = fminbnd(@(b2) breakfit(b2, x, y), min(x)+dx/200, max(x)-dx/200);

xpoint = 10.^interiorbreak;

end