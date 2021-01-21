function [alphaEstModelLam, alphaEstModelTurb, alphaEstModelAdj] = bootstrapModelAlpha(nboot)

%% Randomly generated predator-prey pairs from the Rosenzweig-Macarthur model
% Simulates organisms to fit alpha estimates to the model. Automatically
% chooses the same number of organisms per roll as used in the empirical
% subsampling. (Can change in initialisation section if desired. If you
% increase you may need to adjust lines 51 and 80.)

% Input
% nboot     number of bootstraps to do

% Output
% alpha*    3 nbootx1 vectors of alpha estimates

%% Set values

% Choose number of organisms 
nAdjustedModel = 370;
nTurbModel = 236;
nLamModel = 284;

% Initialise output vectors
alphaEstModelAdj = zeros(nboot, 1);
alphaEstModelLam = zeros(nboot, 1);
alphaEstModelTurb = zeros(nboot, 1);

%% Run simulations

% Adjusted model
for i = 1:nboot

    % Simulated turbulence-adjusted data for 370 organisms 
    % (equates to 370/2 pp *pairs*)
    [predLengths, rho, equilibria, ~] = generateModelResults(nAdjustedModel / 2, 1);
    % Get size data for predator and prey
    lengths = [predLengths; predLengths .* rho];
    % The fitting function takes non-log data as input
    % Get abundance data for predator and prey
    abundances = 10.^[equilibria(:, 2); equilibria(:, 1)];
    % Get the alpha estimates
    alphaEstModelAdj(i) = fitLM_subsampling([lengths, abundances]);

end

% Turbulent regime
for i = 1:nboot

    % Simulate 236 organisms in the turbulent regime (model generates
    % across full spectrum; so we create a few extra)
    [predLengths, rho, equilibria, ~] = generateModelResults(700, 0);
    % Extract lengths for predator and prey
    lengths = [predLengths; predLengths .* rho];
    % fitting function needs non-log data
    abundances = 10.^[equilibria(:, 2); equilibria(:, 1)];
    % get organisms >=0.1m (non-standarised length)
    idx = lengths(:, 1) >= 0.1 ;
    
    % Now get 236 random size-abund rows from simulated turbulent data
    try
        turbData = [lengths(idx), abundances(idx)];
        rndIDX = randperm(size(turbData,1)); % randomise rows to choose
        turbData = turbData(rndIDX(1:nTurbModel),:); % get 236 random 'organisms'
    catch
        % catch unlikely case there are fewer than 236 in a roll
        turbData = [lengths(idx), abundances(idx)];
        badST = size(turbData,1);
        fprintf('warning: one turbulence roll only had %d organisms\n', badST)
    end
    % get alpha estimates
    alphaEstModelTurb(i) = fitLM_subsampling([turbData(:,1), turbData(:,2)]);
    
end

% Laminar regime
for i = 1:nboot

    % Simulate 284 organisms in the laminar regime (model generates
    % across full spectrum; so we create a few extra)
    [predLengths, rho, equilibria, ~] = generateModelResults(650, 0);
    % Extract lengths for predator and prey
    lengths = [predLengths; predLengths .* rho];
    % fitting function needs non-log  data
    abundances = 10.^[equilibria(:, 2); equilibria(:, 1)];
    % get organisms <0.1m (non-standarised length)
    idx = lengths(:, 1) < 0.1 ;
    
     % Now get 284 random size-abund rows from simulated laminar data
    try
        lamData = [lengths(idx), abundances(idx)];
        rndIDX = randperm(size(lamData,1)); % randomise rows to choose
        lamData = lamData(rndIDX(1:nLamModel),:); % get 284 random 'organisms'
    catch
        % catch unlikely case there are fewer than 284 in a roll
        lamData = [lengths(idx), abundances(idx)];
        badSL = size(lamData,1);
        fprintf('warning: one laminar roll only had %d organisms\n', badSL)
    end
    % get alpha estimates
    alphaEstModelLam(i) = fitLM_subsampling([lamData(:,1), lamData(:,2)]);
    
end


end
