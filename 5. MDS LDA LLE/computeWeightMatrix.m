function [ Sw ] = computeWeightMatrix(dataSet, actualLabels)


features = size(dataSet,2);
stdMatrix = [1:features; 1:features; zeros(1,features)]';

dataSetClass2 = [];
dataSetClass5 = [];
dataSetClass7 = [];

for i = 1:size(dataSet,1)
    switch actualLabels(i)
        case 2
            dataSetClass2 = [dataSetClass2; dataSet(i,:)];
        case 5
            dataSetClass5 = [dataSetClass5; dataSet(i,:)];
        case 7
            dataSetClass7 = [dataSetClass7; dataSet(i,:)];
    end
end

covClass2 = cov(dataSetClass2);
priorClass2 = size(dataSetClass2,1)/ size(dataSet,1);

covClass5 = cov(dataSetClass5);
priorClass5 = size(dataSetClass5,1)/ size(dataSet,1);

covClass7 = cov(dataSetClass7);
priorClass7 = size(dataSetClass7,1)/ size(dataSet,1);

Sw = priorClass2 * covClass2 + priorClass5 * covClass5 + priorClass7 * covClass7;

% Sw = priorClass2 * sparseCovMatrixClass2 + priorClass5 * sparseCovMatrixClass5;
end

