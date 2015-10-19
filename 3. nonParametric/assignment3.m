
% Load Training Data
train = load('trainIrisNoisy.txt','-ascii');

% Load Test Data
test = load('testIris.txt','-ascii');

% Classification using Naive Histogram Approach

UniformHValues = [.001 .01 1 2 4 7 9 10 100 1000];
NaiveLabels = zeros(size(test,1), size(UniformHValues,2));
NaiveErrorRates = zeros(size(UniformHValues,2),4);

for i = 1:size(UniformHValues,2)
    B = [];
    B = NaiveClassifier( train, test, UniformHValues(i) );
    for j = 1:size(B)
        NaiveLabels(j,i) = B(j);
    end
    B = [];
    B = FindErrorRate(NaiveLabels(:,i), test(:,5));
    for j = 1:size(B,2)
        NaiveErrorRates(i,j) = B(j);
    end
end 

% Classification using Gaussian Kernel Density Function
GaussianHValues = [.001 .01 .1 .5 .6 .7 .9 1 10 100 1000];
GaussianNaiveLabels = zeros(size(test,1), size(GaussianHValues,2));
GaussianNaiveErrorRates = zeros(size(GaussianHValues,2),4);

for i = 1:size(GaussianHValues,2)
    B = [];
    B = GaussianNaiveClassifier( train, test, GaussianHValues(i) );
    for j = 1:size(B)
        GaussianNaiveLabels(j,i) = B(j);
    end
    B = [];
    B = FindErrorRate(GaussianNaiveLabels(:,i), test(:,5));
    for j = 1:size(B,2)
        GaussianNaiveErrorRates(i,j) = B(j);
    end
end 
