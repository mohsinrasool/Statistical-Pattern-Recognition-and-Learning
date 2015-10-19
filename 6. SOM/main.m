% Load Training Data
train = load('images.txt','-ascii');

% Load Test Data
test = load('imageLabels.txt','-ascii');

[ W, mappedTrain ] =  applySOM (train, 30, 30, 1, .3, 5, .3, 2);

[Labels] = KNNClassification( [mappedTrain test], mappedTrain, 3 );

% Plot Test data. Uncomment to view the figure
plotData([mappedTrain Labels], 'Self Organising Map (30x30)');

[errorRates] = FindErrorRate(Labels, test);

