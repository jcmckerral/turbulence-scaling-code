%% plots the histograms of the bootstrap alpha estimates
% simply run script

% colours
mutedteal = [68, 170, 153] ./ 255;
mutedwine = [136, 34, 85] ./ 255;
mutedcyan = [136, 234, 238] ./ 255;
mutedindigo = [51, 34, 136] ./ 255;
mutedsand = [221, 204, 119] ./ 255;


figure
box on

ax = subtightplot(2, 5, 1, [0.1, .01]);
histogram(lamAlphaEst, 20, 'FaceColor', mutedindigo, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ylabel(ax, 'Full dataset');
xlim(ax, [-0.82, -0.72]);
ax.XTick = round(prctile(lamAlphaEst, [2.5, 50, 97.5]), 2);
ax.YLabel.FontSize = 16;

ax = subtightplot(2, 5, 2, [0.1, .01]);
histogram(turbAlphaEst, 20, 'FaceColor', mutedteal, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
xlim(ax, [-2.13, -1.71]);
ax.YTickLabels = [];
ax.XTick = round(prctile(turbAlphaEst, [2.5, 50, 97.5]), 2);


ax = subtightplot(2, 5, 3, [0.1, .01]);
histogram(fadjAlphaEst, 20, 'FaceColor', mutedsand, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ax.YTickLabels = [];
xlim(ax, [-1.85, -1.56]);
ax.XTick = round(prctile(fadjAlphaEst, [2.5, 50, 97.5]), 2);


ax = subtightplot(2, 5, 4, [0.1, .01]);
histogram(tadjAlphaEst, 20, 'FaceColor', mutedwine, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ax.YTickLabels = [];
xlim(ax, [-0.79, -0.34]);
ax.XTick = round(prctile(tadjAlphaEst, [2.5, 50, 97.5]), 2);


ax = subtightplot(2, 5, 5, [0.1, .01]);
histogram(fullAlphaEst, 20, 'FaceColor', mutedwine, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ax.YTickLabels = [];
xlim(ax, [-0.78, -0.665]);
ax.XTick = [-0.77, -0.73, -0.69];


ax = subtightplot(2, 5, 6, [0.1, 0.01]);
histogram(lamAlphaEstman, 20, 'FaceColor', mutedindigo, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ylabel(ax, 'Manually Curated');
xlim(ax, [-0.83, -0.66]);
xlabel(ax, 'Laminar');
ax.XLabel.FontSize = 16;
ax.XTick = round(prctile(lamAlphaEstman, [2.5, 50, 97.5]), 2);
ax.YLabel.FontSize = 16;

ax = subtightplot(2, 5, 7, [0.1, 0.01]);
histogram(turbAlphaEstman, 20, 'FaceColor', mutedteal, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ax.YTickLabels = [];
xlim(ax, [-2.84, -2.2]);
ax.XTick = round(prctile(turbAlphaEstman, [2.5, 50, 97.5]), 2);
xlabel(ax, 'Turb Raw');
ax.XLabel.FontSize = 16;

ax = subtightplot(2, 5, 8, [0.1, 0.01]);
histogram(fadjAlphaEstman, 20, 'FaceColor', mutedsand, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
xlabel(ax, 'Fish Adj');
ax.XLabel.FontSize = 16;
ax.YTickLabels = [];
xlim(ax, [-2.9, -2.1]);
ax.XTick = round(prctile(fadjAlphaEstman, [2.5, 50, 97.5]), 2);


ax = subtightplot(2, 5, 9, [0.1, 0.01]);
histogram(tadjAlphaEstman, 20, 'FaceColor', mutedwine, 'LineStyle', 'none');
ylim(ax, [0, 1800]);
ax.YTickLabels = [];
xlim(ax, [-1.3, -0.6]);
ax.XTick = round(prctile(tadjAlphaEstman, [2.5, 50, 97.5]), 2);
xlabel(ax, 'Turb Adj');
ax.XLabel.FontSize = 16;

ax = subtightplot(2, 5, 10, [0.1, 0.01]);
histogram(fullAlphaEstman, 20, 'FaceColor', mutedwine, 'LineStyle', 'none');
ylim(ax, [0, 2000]);
ax.YTickLabels = [];
xlim(ax, [-0.92, -0.74]);
ax.XTick = round(prctile(fullAlphaEstman, [2.5, 50, 97.5]), 2);
xlabel(ax, 'Full Spectrum');
ax.XLabel.FontSize = 16;

sgtitle('Bootstrapped \alpha estimates')

set(gcf, 'Position', [50, 50, 500, 250]);


tightfig;