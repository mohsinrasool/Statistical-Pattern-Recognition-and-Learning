
% This function applies MDS algorithm to reduce the dimensions of
% input data (NxD) from D spaces to 2D space. It returns the 
% transformed data matrix (Nx2).

function [ Z ] = applyMDS( dataSet )

normalizedData = dataSet;

% Step 1: Compute mean of the data
dataMean = mean(normalizedData);

% Step 2: Normalize data by subtracting its mean from it
for i=1:size(normalizedData,1)
    normalizedData(1,:) = normalizedData(1,:) - dataMean;
end

% Step 3: B = X X'
B = normalizedData * normalizedData';

% Step 4: Calculate eigen values and eigen vectors,
% Step 5: Pick two largest eigen values and corresponding eigen vectors.
[W, D] = eigs(B,2);

% Step 6: Z = W * sqrt(D)
Z = W * sqrt(D);

end

