%% Plots the empirical data for figure panel 1
% Uses: subtightplot.m by F. Nievinski - source at:
% https://www.mathworks.com/matlabcentral/fileexchange/39664-subtightplot

%% generate subsamples
lamData = generateSubsampledData(laminartable, binsLam, 1000, 0, 0);
turbRaw = generateSubsampledData(turbulenttable, binsTurb, 500, 0, 0);
turbFadj = generateSubsampledData(fishingadj, binsTurb, 500, 0, 0);
turbTadj = generateSubsampledData(turbulenttable, binsTurb, 500, 1, 0);
allData = generateSubsampledData(scalingdata, binsAll, 1500, 1, 0);

% uncomment the below lines if you want to plot the entire dataset instead

% lamdata = [laminartable.size,laminartable.abund];
% turbRaw = [turbulenttable.size, turbulenttable.abund];
% turbFadj = [fishingadj.size,fishingadj.abund];
% turbTadj = [turbulenttable.size,turbulenttable.adj];
% allData = [scalingdata.size,scalingdata.adj];


lamdata = log10(lamData);
turbRaw = log10(turbRaw);
turbFadj = log10(turbFadj);
turbTadj = log10(turbTadj);
allData = log10(allData);

figure

%% Fig 1a


raw = subtightplot(3, 2, 1, [0.05, -0.9]);
box on
hold on
plot(lamdata(:, 1), lamdata(:, 2), '^', 'Color', [0.2, 0.1333, 0.5333], 'MarkerFaceColor', [0.2, 0.1333, 0.5333], 'MarkerSize', 3);
plot(turbRaw(:, 1), turbRaw(:, 2), 'o', 'Color', [0.2667, 0.667, 0.6], 'MarkerFaceColor', [0.2667, 0.667, 0.6], 'MarkerSize', 3);
xlim(raw, [-8, 2]);
ylim(raw, [-8, 8]);
ax = gca;
ax.XTick = [-8, -5, -2, 1];
ax.XTickLabel = {'10^-^8', '10^-^5', '10^-^2', '10^1'};
ax.YTick = [-8, -3, 2, 7];
ax.YTickLabel = {'10^-^8', '10^-^3', '10^2', '10^7'};

%% Figs 1b and 1c

fish = subtightplot(3, 2, 3, [0.05, 0.04]);
plot(turbRaw(:, 1), turbRaw(:, 2), 'o', 'Color', [0.2667, 0.667, 0.6], 'MarkerFaceColor', [0.2667, 0.667, 0.6], 'MarkerSize', 3);
hold on
plot(turbFadj(:, 1), turbFadj(:, 2), 'v', 'Color', [0.867, 0.8, 0.467], 'MarkerFaceColor', [0.867, 0.8, 0.467], 'MarkerSize', 3);
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
plot(turbFadj(:, 1), turbFadj(:, 2), 'v', 'Color', [0.867, 0.8, 0.467], 'MarkerFaceColor', [0.867, 0.8, 0.467], 'MarkerSize', 3);
hold on
plot(turbTadj(:, 1), turbTadj(:, 2), 'o', 'Color', [0.533, 0.133, 0.333], 'MarkerFaceColor', [0.533, 0.133, 0.333], 'MarkerSize', 3);
xlim(rot, [-1, 1.6]);
ylim(rot, [-8, 3]);
ax = gca;
ax.XTick = [-1, 0, 1];
ax.XTickLabel = {'10^-^1', '10^0', '10^1'};
ax.YTick = [-8, -4, 0];
ax.YTickLabel = {'', '', '', ''};

%% Fig 1d
tot = subtightplot(3, 2, 5, [0.05, -0.9]);
plot(allData(:, 1), allData(:, 2), 'o', 'Color', [0.533, 0.133, 0.333], 'MarkerFaceColor', [0.533, 0.133, 0.333], 'MarkerSize', 3);
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