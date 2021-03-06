% Load Training Data
train = load('syntheticTrain.txt','-ascii');

% Load Test Data
test = load('syntheticTest.txt','-ascii');

% Plot Test data. Uncomment to view the figure
% plotData(train);

% Classification using Naive Histogram Approach

KValues = [1 3 9 13 15 17 21 101];
Labels = zeros(size(test,1), size(KValues,2));
ErrorRates = zeros(size(KValues,2),3);

for i = 1:size(KValues,2)
    Labels(:,i) = KNNClassification( train, test, KValues(i) );
    ErrorRates(i, :) = FindErrorRate(Labels(:,i), test(:,3));
end 

% Find out the records that were mis-classified. Uncomment to find out.
% errorVectors = findErrorVectors(Labels(:,5), test);

% Plot errors. Uncomment to view the figure
% plotData(errorVectors);
