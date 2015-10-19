% Load Training Data
 X = load('facessubset.txt','-ascii');

actualLabels = X(:, end);
dataSet = X(:, 1:end-1);

%  train = load('train2_5.txt','-ascii');
%  label = load('train2_5Labels.txt','-ascii');
%  train = [train label];
%  
% zeroInd = find(sum(train)==0);
% train(:,zeroInd) = [];

% ------------------------------------------------------------------------%

% Reduce Dimensionality using LDA
% [ reshapedData ] = reshapeData(dataSet);
% [ LDA_Z ] = applyLDA(reshapedData, actualLabels); 
% LDA_2D = reshapedData * LDA_Z;

% Plot Test data. Uncomment to view the figure
% plotData([LDA_2D actualLabels],'Dimensionality Reduction using LDA');

% [ predictedLabels ] = KNNClassification([LDA_2D, actualLabels], [LDA_2D, actualLabels], 5);
% [ errorRate ] = FindErrorRate(predictedLabels, actualLabels );

% ------------------------------------------------------------------------%

% Reduce Dimensionality using MDS
% [ MDS_2D ] = applyMDS(dataSet); 

% plotData([MDS_2D actualLabels],'Dimensionality Reduction using MDS');

% [ predictedLabels ] = KNNClassification([MDS_2D, actualLabels], [MDS_2D, actualLabels], 5);
% [ errorRate ] = FindErrorRate(predictedLabels, actualLabels );

% ------------------------------------------------------------------------%

% Reduce Dimensionality using MDS
[ LLE_2D ] = applyLLE(A, 2); 

plotData([LLE_2D actualLabels],'Dimensionality Reduction using LLE');

% Classification using Naive Histogram Approach

% KValues = [.1 .3 .5 .7 .9];
% Labels = zeros(size(test,1), size(KValues,2));
% ErrorRates = zeros(size(KValues,2),3);
% 
% for i = 1:size(KValues,2)
%     Labels(:,i) = KNNClassification( train, test, KValues(i) );
%     ErrorRates(i, :) = FindErrorRate(Labels(:,i), test(:,3));
% end 

% Find out the records that were mis-classified. Uncomment to find out.
% errorVectors = findErrorVectors(Labels(:,5), test);

% Plot errors. Uncomment to view the figure
% plotData(errorVectors);
