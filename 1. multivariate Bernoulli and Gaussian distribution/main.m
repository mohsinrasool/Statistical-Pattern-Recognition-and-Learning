
% Load Training Data
X = load('lucapTrain.txt','-ascii');
Labels = load('lucapTrainTargets.txt','-ascii');

% Load Test Data
TestX = load('lucapTest.txt','-ascii');
ActualLabels = load('lucapTestTargets.txt','-ascii');

% Bernoulli Distribution
    % Learning 
    [ probVectorClass2, probVectorClass5, prior ] = learnBernoulliParameters(X, Labels);

    % Classification 
    BernoulliMAPLabels = predictByBernoulliMAP(TestX, probVectorClass2, probVectorClass5, prior);
    BernoulliMLLabels = predictByBernoulliML(TestX, probVectorClass2, probVectorClass5);
    
    % Compute Error Rates
    BernoulliMAPErrorRate = FindErrorRate(BernoulliMAPLabels, ActualLabels);
    BernoulliMLErrorRate = FindErrorRate(BernoulliMLLabels, ActualLabels);

% % Gaussian Distribution
%     % Learning 
%     [meanClass2, meanClass5, covMatrixClass2, covMatrixClass5, prior, zeroIndClass2, zeroIndClass5] = learnGaussianParameters(X, Labels);
% 
%     % Classification 
%     GaussianMLLabels = predictByGaussianML(TestX, meanClass2, meanClass5, covMatrixClass2, covMatrixClass5, zeroIndClass2, zeroIndClass5);
%     GaussianMAPLabels = predictByGaussianMAP(TestX, meanClass2, meanClass5, covMatrixClass2, covMatrixClass5, prior, zeroIndClass2, zeroIndClass5);
% 
%     % Compute Error Rates
%     GaussianMAPErrorRate = FindErrorRate(GaussianMAPLabels, ActualLabels);
%     GaussianMLErrorRate = FindErrorRate(GaussianMLLabels, ActualLabels);
%     
% 
% Setup and show table for nice display of the data
% TableLabels = {'ActualLabels' 'BernoulliMAPLabels' 'BernoulliMLLabels' 'GaussianMAPLabels' 'GaussianMLLabels'};
% table(ActualLabels,BernoulliMAPLabels,BernoulliMLLabels,GaussianMAPLabels,GaussianMLLabels,'VariableNames',TableLabels)
fprintf('\nBernaulli Error Rate for MAP Classifier: %d\n', BernoulliMAPErrorRate)
fprintf('Bernaulli Error Rate for ML Classifier: %d\n', BernoulliMLErrorRate)
% fprintf('Gaussian Error Rate for ML Classifier: %d\n', GaussianMLErrorRate)
% fprintf('Gaussian Error Rate for MAP Classifier: %d\n', GaussianMAPErrorRate)

    
    