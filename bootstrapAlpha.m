function alphaEst = bootstrapAlpha(nboot, tblin, bins, nsamp, adjust)

%% Bootstraps the alpha estimate on subsampled data.
% Takes arguments:

% nboot     number of bootstraps you want
% tblin     the input table of data
% bins      log-transformed bin intervals
% nsamp     how many subsamples you want, will automatically subdivide
%           amongst bins and taxa
% adjust    binary flag. 0 means the data is in its raw form, 1 means it
%           is turbulence adjusted

% Output:
% alphaEst  a vector of bootstrapped estimtes of the linear regression
%           slope i.e. power law exponent alpha

%% Code

alphaVec = zeros(nboot, 1);
tblin.groups = findgroups(tblin.taxa);

for i = 1:nboot
    subSampledData = generateSubsampledData(tblin, bins, nsamp, adjust, 1);
    alphaVec(i) = fitLM_subsampling(subSampledData);
end

alphaEst = alphaVec;

end