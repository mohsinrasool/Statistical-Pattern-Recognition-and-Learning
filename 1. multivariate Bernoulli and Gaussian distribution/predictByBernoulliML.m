
% This function classifies input images into Class 2 or Class 5 based on
% provided probability vectors using Bernaulli Maximum Liklihood Classifier
%
% Parameters
% TestData: Matrix of N X 256
% probVectorClass2: Vector(256 x 1) contains probability P(Xi=1|C=2)
% probVectorClass5: Vector(256 x 1) contains probability P(Xi=1|C=5)
%
% Returns
% predictedLabels: Vector(N x 1) contains Label for each image

function [predictedLabels] = predictByBernoulliML(TestData, probVectorClass2, probVectorClass5)

    [numOfImages,numOfPixels] = size(TestData);

    predictedLabels = zeros(numOfImages, 1);
    imageProbVectorClass2 = ones(numOfImages, 1);
    imageProbVectorClass5 = ones(numOfImages, 1);

    % Loop through each image vector to find its probablity in each class
    for i = 1:numOfImages
        % Calculating Bern([pixel1 pixel2... pixeln] | C=2) and
        % Bern([pixel1 pixel2... pixeln] | C=2)
        for j = 1:numOfPixels
           if TestData(i,j) == 1
               imageProbVectorClass2(i) = imageProbVectorClass2(i) * probVectorClass2(j);
               imageProbVectorClass5(i) = imageProbVectorClass5(i) * probVectorClass5(j);
           else
               imageProbVectorClass2(i) = imageProbVectorClass2(i) * (1-probVectorClass2(j));
               imageProbVectorClass5(i) = imageProbVectorClass5(i) * (1-probVectorClass5(j));           
           end

        end
        
        % Classsify or predict the Label based on calculated probability
        if imageProbVectorClass2(i) >= imageProbVectorClass5(i)
            predictedLabels(i) = 2;
        else
            predictedLabels(i) = 5;
        end
    end
end