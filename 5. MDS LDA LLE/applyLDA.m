function [ Z ] = applyLDA( dataSet, actualLabels )

[ Sw ] = computeWeightMatrix(dataSet, actualLabels);
[ Sb ] = computeBetweenMatrix([dataSet actualLabels]);

A = inv(Sw) * Sb;
[Z, eigenValues] = eigs(A, 2);

% eigenValues(2,1) = eigenValues(2,2);
% eigenValues(:,2) = [];


end

