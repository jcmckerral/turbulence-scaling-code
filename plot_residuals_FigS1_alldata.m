%% plots residuals from representative linear model fits
% Simply run script. Will autogenerate random subsamples, fit linear
% models, and plot fitted, histogram, and QQ plot residuals. Colours match
% main manuscript. For the full database.

samptofitfullsmall = generateSubsampledData(laminartable, binsLam, 284, 0, 0);
mdlfullSmall = fitlm(log10(samptofitfullsmall(:, 1)), log10(samptofitfullsmall(:, 2)));

samptofitfullTurb = generateSubsampledData(turbulenttable, binsTurb, 236, 0, 0);
mdlfullTurb = fitlm(log10(samptofitfullTurb(:, 1)), log10(samptofitfullTurb(:, 2)));

samptofitfullAdj = generateSubsampledData(fishingadj, binsTurb, 236, 0, 0);
mdlfullAdj = fitlm(log10(samptofitfullAdj(:, 1)), log10(samptofitfullAdj(:, 2)));

samptofitfullTot = generateSubsampledData(scalingdata, binsAll, 370, 1, 0);
mdlfullTot = fitlm(log10(samptofitfullTot(:, 1)), log10(samptofitfullTot(:, 2)));


figure
box on

%% Laminar
fullSmallRFitAx = subtightplot(4, 3, 1, [0.1, 0.12]);
plotResiduals(mdlfullSmall, 'fitted', 'MarkerEdgeColor', '#332288');

ylabel(fullSmallRFitAx, 'Laminar');
fullSmallRFitAx.YLabel.FontSize = 16;

fullSmallRFitAx.YLim = [-2, 2];
fullSmallRFitAx.YTick = [-2, 0, 2];
fullSmallRFitAx.Title = [];
fullSmallRFitAx.XLabel = [];
fullSmallRFitAx.FontSize = 16;


fullSmallRHistAx = subtightplot(4, 3, 2, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullSmall, "histogram");
h.LineStyle = 'none';
h.FaceColor = '#332288';
fullSmallRHistAx.XLim = [-2, 2];
fullSmallRHistAx.YLim = [0, 0.7];
fullSmallRHistAx.YTick = [0, 0.3, 0.6];
fullSmallRHistAx.FontSize = 16;
fullSmallRHistAx.Title = [];


fullSmallRProbAx = subtightplot(4, 3, 3, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullSmall, "probability", 'MarkerEdgeColor', '#332288');
fullSmallRProbAx.YLabel = [];
fullSmallRProbAx.XLabel = [];
fullSmallRProbAx.YTickLabel = [];
fullSmallRProbAx.FontSize = 16;
fullSmallRProbAx.Title = [];

%% Turb uncorrected

fullTurbRFitAx = subtightplot(4, 3, 4, [0.1, 0.12]);

plotResiduals(mdlfullTurb, 'fitted', 'MarkerEdgeColor', '#009988');

ylabel(fullTurbRFitAx, 'Turb. Raw');
fullTurbRFitAx.YLabel.FontSize = 16;

fullTurbRFitAx.XLim = [-6, 0];
fullTurbRFitAx.YLim = [-2, 2];
fullTurbRFitAx.YTick = [-2, 0, 2];
fullTurbRFitAx.FontSize = 16;
fullTurbRFitAx.Title = [];
fullTurbRFitAx.XLabel = [];


fullTurbRHistAx = subtightplot(4, 3, 5, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullTurb, "histogram");
h.LineStyle = 'none';
h.FaceColor = '#009988';

fullTurbRHistAx.XLim = [-3, 3];
fullTurbRHistAx.YLim = [0, 0.7];
fullTurbRHistAx.YTick = [0, 0.3, 0.6];
fullTurbRHistAx.FontSize = 16;
fullTurbRHistAx.Title = [];


fullTurbRProbAx = subtightplot(4, 3, 6, [0.1, 0.12]);
box on

h = plotResiduals(mdlfullTurb, "probability", 'MarkerEdgeColor', '#009988');
fullTurbRProbAx.YLabel = [];
fullTurbRProbAx.XLabel = [];

fullTurbRProbAx.YTickLabel = [];

fullTurbRProbAx.FontSize = 16;
fullTurbRProbAx.Title = [];

%% Adj

fullAdjRFitAx = subtightplot(4, 3, 7, [0.1, 0.12]);

plotResiduals(mdlfullAdj, 'fitted', 'MarkerEdgeColor', '#DDCC77');
ylabel(fullAdjRFitAx, 'Fish Adj.');
fullAdjRFitAx.YLabel.FontSize = 16;


fullAdjRFitAx.XLim = [-5, 0];
fullAdjRFitAx.YLim = [-4, 4];
fullAdjRFitAx.YTick = [-4, 0, 4];
fullAdjRFitAx.FontSize = 16;
fullAdjRFitAx.Title = [];
fullAdjRFitAx.XLabel = [];


fullAdjRHistAx = subtightplot(4, 3, 8, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullAdj, "histogram");
h.LineStyle = 'none';
h.FaceColor = '#DDCC77';

fullAdjRHistAx.XLim = [-2, 2];
fullAdjRHistAx.YLim = [0, 0.7];
fullAdjRHistAx.YTick = [0, 0.3, 0.6];
fullAdjRHistAx.FontSize = 16;
fullAdjRHistAx.Title = [];


fullAdjRProbAx = subtightplot(4, 3, 9, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullAdj, "probability", 'MarkerEdgeColor', '#DDCC77');
fullAdjRProbAx.YLabel = [];
fullAdjRProbAx.XLabel = [];
fullAdjRProbAx.XLim = [-4, 4];
fullAdjRProbAx.YTickLabel = [];
fullAdjRProbAx.FontSize = 16;
fullAdjRProbAx.Title = [];

%% Full
fullTotRFitAx = subtightplot(4, 3, 10, [0.1, 0.12]);

plotResiduals(mdlfullTot, 'fitted', 'MarkerEdgeColor', '#882255');

ylabel(fullTotRFitAx, 'All Adj.');
xlabel(fullTotRFitAx, 'Fitted');

fullTotRFitAx.YLabel.FontSize = 16;

fullTotRFitAx.YLim = [-3, 3];
fullTotRFitAx.YTick = [-2, 0, 2];
fullTotRFitAx.FontSize = 16;
fullTotRFitAx.Title = [];


fullTotRHistAx = subtightplot(4, 3, 11, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullTot, "histogram");
h.LineStyle = 'none';
h.FaceColor = '#882255';
fullTotRHistAx.XLim = [-3, 3];
fullTotRHistAx.YLim = [0, 0.7];
fullTotRHistAx.YTick = [0, 0.3, 0.6];
fullTotRHistAx.FontSize = 16;
fullTotRHistAx.Title = [];
xlabel(fullTotRHistAx, 'Histogram');


fullTotRProbAx = subtightplot(4, 3, 12, [0.1, 0.12]);
box on
h = plotResiduals(mdlfullTot, "probability", 'MarkerEdgeColor', '#882255');
fullTotRProbAx.YLabel = [];
fullTotRProbAx.YTickLabel = [];
fullTotRProbAx.FontSize = 16;
fullTotRProbAx.Title = [];
xlabel(fullTotRProbAx, 'QQ plot');


tightfig;