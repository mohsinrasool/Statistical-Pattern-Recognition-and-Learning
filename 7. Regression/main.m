% Load Training Data
trainData = load('trainData.txt','-ascii');

% Load Valid Data
validData = load('validData.txt','-ascii');

% Load Test Data
testData = load('testData.txt','-ascii');

[ W, TransformedPoints ] =  applyRegression(trainData, 6);

% ezplot(plot2sym(W));
% Plot Test data. Uncomment to view the figure
plotData(trainData, [trainData(:,1) TransformedPoints] , 'Linear Regression');

% [errorRates] = FindErrorRate(Labels, test);

