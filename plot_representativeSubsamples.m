%% Plot some representative subsamples
% Uses: subtightplot.m by F. Nievinski - source at:
% https://www.mathworks.com/matlabcentral/fileexchange/39664-subtightplot

%% generate subsamples
% % Commented out for running in live script, uncomment if you run as
% % standalone script
% 
% lamRepSample = log10(generateSubsampledData(laminartable, binsLam, 284, 0, 0));
% turbRepSample = log10(generateSubsampledData(turbulenttable, binsTurb, 236, 0, 0));
% fadjRepSample = log10(generateSubsampledData(fishingadj, binsTurb, 236, 0, 0));
% tadjRepSample = log10(generateSubsampledData(turbulenttable, binsTurb, 236, 1, 0));
% fullRepSample = log10(generateSubsampledData(scalingdata, binsAll, 370, 1, 0));

figure

%% Fig 1a


raw = subtightplot(3, 2, 1, [0.05, -0.9]);
box on
hold on
plot(lamRepSample(:, 1), lamRepSample(:, 2), '^', 'Color', [0.2, 0.1333, 0.5333], 'MarkerFaceColor', [0.2, 0.1333, 0.5333], 'MarkerSize', 3);
plot(turbRepSample(:, 1), turbRepSample(:, 2), 'o', 'Color', [0.2667, 0.667, 0.6], 'MarkerFaceColor', [0.2667, 0.667, 0.6], 'MarkerSize', 3);
xlim(raw, [-8, 2]);
ylim(raw, [-8, 8]);
title(raw,'Plots of random subsamples (full dataset)')
ax = gca;
ax.Title.FontSize = 14;
ax.XTick = [-8, -5, -2, 1];
ax.XTickLabel = {'10^-^8', '10^-^5', '10^-^2', '10^1'};
ax.YTick = [-8, -3, 2, 7];
ax.YTickLabel = {'10^-^8', '10^-^3', '10^2', '10^7'};

%% Figs 1b and 1c

fish = subtightplot(3, 2, 3, [0.05, 0.04]);
plot(turbRepSample(:, 1), turbRepSample(:, 2), 'o', 'Color', [0.2667, 0.667, 0.6], 'MarkerFaceColor', [0.2667, 0.667, 0.6], 'MarkerSize', 3);
hold on
plot(fadjRepSample(:, 1), fadjRepSample(:, 2), 'v', 'Color', [0.867, 0.8, 0.467], 'MarkerFaceColor', [0.867, 0.8, 0.467], 'MarkerSize', 3);
xlim(fish, [-1, 1.6]);
ylim(fish, [-8, 3]);
ylabel(fish, 'Abundance (m^-^1)')
ax = gca;
ax.XTick = [-1, 0, 1];
ax.XTickLabel = {'10^-^1', '10^0', '10^1'};
ax.YTick = [-8, -4, 0];
ax.YTickLabel = {'10^-^8', '10^-^4', '10^0'};
ax.YLabel.FontSize = 16;


rot = subtightplot(3, 2, 4, [0.05, 0.01]);
plot(fadjRepSample(:, 1), fadjRepSample(:, 2), 'v', 'Color', [0.867, 0.8, 0.467], 'MarkerFaceColor', [0.867, 0.8, 0.467], 'MarkerSize', 3);
hold on
plot(tadjRepSample(:, 1), tadjRepSample(:, 2), 'o', 'Color', [0.533, 0.133, 0.333], 'MarkerFaceColor', [0.533, 0.133, 0.333], 'MarkerSize', 3);
xlim(rot, [-1, 1.6]);
ylim(rot, [-8, 3]);
ax = gca;
ax.XTick = [-1, 0, 1];
ax.XTickLabel = {'10^-^1', '10^0', '10^1'};
ax.YTick = [-8, -4, 0];
ax.YTickLabel = {'', '', '', ''};

%% Fig 1d
tot = subtightplot(3, 2, 5, [0.05, -0.9]);
plot(fullRepSample(:, 1), fullRepSample(:, 2), 'o', 'Color', [0.533, 0.133, 0.333], 'MarkerFaceColor', [0.533, 0.133, 0.333], 'MarkerSize', 3);
xlim(tot, [-8, 2]);
ylim(tot, [-8, 8]);
xlabel(tot, 'Size (m)')
ax = gca;
ax.XTick = [-8, -5, -2, 1];
ax.XTickLabel = {'10^-^8', '10^-^5', '10^-^2', '10^1'};
ax.YTick = [-8, -3, 2, 7];
ax.YTickLabel = {'10^-^8', '10^-^3', '10^2', '10^7'};
ax.XLabel.FontSize = 16;


set(gcf, 'Position', [50, 50, 300, 500]);

tightfig;