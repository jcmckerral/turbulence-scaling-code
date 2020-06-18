function sampout = generateSubsampledData(tblin, binlim, sizesamp, abadj, groupflag)

%% This is the subsampling routine to create bootstrapped datasets.
% Here we stratify per size bin and then by taxa. Get even numbers of
% samples per size bin and weight the sampling probabilities to even out
% the likelihood of sampling any particular taxa (i.e. balanced and
% stratified sampling).

% INPUTS:
% tblin       data table (full, manually curated, or fishing adjusted,
%             etc). Must have columns labelled taxa, size, abund, and if
%             turbulent adjusted data is needed, adj
% binlim      which size subdivisions you want for bins. Vector of length
%             3, Bin interval start, step size, interval end on log10
%             scale e.g. [1,0.1,2]
% sizesamp    integer, number of points in subsample
% abadj       binary flag as to whether to use raw data or turbulence
%             adjusted data. 0=raw, 1=adjusted.
% groupflag   binary flag. If 0, table has not been pregrouped, if 1 it has
%             a groups column (speed up bootstraps)

% OUTPUT:
% sampout     an nx2 matrix with size-abund data. n may be a little less
%             than sizesamp if some bins don't have enough data (some of
%             the very small organisms)

%% Set up key variables

bins = 10.^(binlim(1):binlim(2):binlim(3)); % bin intervals
nbins = length(bins); % number of bins
sampsize = sizesamp; % sample size
nPerBin = ceil(sampsize/(nbins - 1)); % ceiling of how many samples per bin

if groupflag == 0
    tblin.groups = findgroups(tblin.taxa); % allocate uids for taxa
else
    % the groups have been preallocated, nothing to do
end

% make output vector a little bigger than needed as we used ceil rather
% than floor. Else must have dynamic growth each loop
subSampleData = zeros(ceil(1.5 * sampsize), 2);

%% Sampling

% loop over each bin
for i = 1:nbins - 1

    % only use the data in the size bin of interest
    tblBin = tblin((tblin.size > bins(i)) & (tblin.size <= bins(i + 1)), :);

    numGroups = length(unique(tblBin.groups)); % count how many taxa
    numtoSelect = nPerBin; % how many samples to take

    % choose raw data or turbulence adjusted, create matrix
    if abadj == 0
        binDataMatrix = [tblBin.size, tblBin.abund, tblBin.groups];
    else
        binDataMatrix = [tblBin.size, tblBin.adj, tblBin.groups];
    end

    % get frequency counts for unique taxa in the bin
    uniqGs = unique(tblBin.groups);
    freqCounts = [uniqGs, histc(tblBin.groups(:), uniqGs)];

    % convert the frequency counts to a probability
    freqCounts(:, 3) = freqCounts(:, 2) / sum(freqCounts(:, 2));

    % assign the sampling probabilities to even out biases in the
    % database (i.e. ensure a broad taxonomic diversity makes it
    % into the resampling scheme). taxa with few entries are weighted
    % higher, taxa with many entries weighted lower.
    [~, freqTblRows] = ismember(binDataMatrix(:, 3), freqCounts(:, 1));
    probWeights = (1 ./ freqCounts(freqTblRows, 3)) * (1 / numGroups);

    % the row indices we'll use to sample from
    indexingVec = 1:1:size(binDataMatrix, 1);


    % make sure bin has data in it
    if size(tblBin, 1) > 0
        % next we use a workaround to stop us having to recalculate the
        % probability weights for the taxa groups on every sample and
        % destroying speed. matlab does not have a library for weighted
        % sampling without replacement, so we take a few extra samples
        % to deal with the (very unlikely) case a point is resampled.

        % get indices of randomly sampled rows, with a few extra in
        % case we get a duplicate
        sampIndex = randsample(indexingVec, numtoSelect+2, true, probWeights);
        % discard any inadvertent duplicates
        sampIndex = unique(sampIndex);
        try
            % take the quantity of (non-replacement) rand samples
            % requested
            sampIndex = sampIndex(1:numtoSelect);
        catch
            % nothing to do if fewer samples in bin
            % than samples requested
        end

        % add this bin's data to the output matrix

        % get first zero row of output vector
        zeroInd = find(subSampleData == 0, 1, 'first');
        % insert the new data into the output vector at the first zero row
        subSampleData(zeroInd:(zeroInd + length(sampIndex) - 1), :) = binDataMatrix(sampIndex, 1:2);
    else
        % nothing to do if the bin had no data
    end
end

% delete the zero rows in the output matrix (we had more than we needed
% when we preallocated the size of the output)
subSampleData(~any(subSampleData, 2), :) = [];

% assign return value
sampout = subSampleData;
end
