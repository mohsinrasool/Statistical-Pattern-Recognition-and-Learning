
% This function calculates all the required paramters of Gaussian distribution
% provided probability vectors using Gaussian Maximum Aposteriori Classifier
%
% Parameters
% TrainData: Training Data Matrix of N X 256
% TrainDataLabels: Labels for each image either 2 or 5
%
% Returns
% probVectorClass2: Vector(256 x 1) contains probability P(Xi=1|C=2)
% probVectorClass5: Vector(256 x 1) contains probability P(Xi=1|C=5)
% prior: Scalar(1x1) contains P(C=2)

function [meanClass2 meanClass5 covMatrixClass2 covMatrixClass5 prior zeroIndClass2 zeroIndClass5]  = learnGaussianParameters( X, Labels )

    %zeroInd = find(sum(X)==0);
	%X(:,zeroInd) = [];

    [numImages,numPixels] = size(X);
    
    sumVectorClass2 = zeros(1, numPixels);
    sumVectorClass5 = zeros(1, numPixels);
    numOfImagesOfClass2 = 0;

    
    for i = 1:numImages
        if Labels(i) == 2
            numOfImagesOfClass2 = numOfImagesOfClass2 + 1;
        end
        for j = 1:numPixels

            if X(i,j) == 1
                if Labels(i) == 2
                    sumVectorClass2(1, j) = sumVectorClass2(1, j) + 1;
                elseif Labels(i) == 5
                    sumVectorClass5(1, j) = sumVectorClass5(1, j) + 1;
                end
            end
        end
    end
    
    numOfImagesOfClass5 = numImages - numOfImagesOfClass2;
    
    zeroIndClass2 = find(sum(sumVectorClass2,1)==0);
    zeroIndClass5 = find(sum(sumVectorClass5,1)==0);
    sumVectorClass2(zeroIndClass2) = [];
    sumVectorClass5(zeroIndClass5) = [];

    numPixelsClass2 = size(sumVectorClass2, 2);
    numPixelsClass5 = size(sumVectorClass5, 2);

    meanClass2 = zeros(1, numPixelsClass2);
    meanClass5 = zeros(1, numPixelsClass5);
    
    for i = 1:numPixelsClass2
        meanClass2(1, i) = sumVectorClass2(1, i) / numOfImagesOfClass2;
    end
    for i = 1:numPixelsClass5
        meanClass5(1, i) = sumVectorClass5(1, i) / numOfImagesOfClass5;
    end
    
    
    covMatrixClass2 = zeros(numPixelsClass2, numPixelsClass2);
    covMatrixClass5 = zeros(numPixelsClass5, numPixelsClass5);
    
    
    for i = 1:numPixelsClass2
        sumOfClass2 = 0;
        for j = 1:numImages
            if Labels(j) == 2
                sumOfClass2 = sumOfClass2 + (X(j,i) - meanClass2(1, i))^2;
            end
        end
        covMatrixClass2(i,i) = sumOfClass2/numOfImagesOfClass2;
    end
    
    
    for i = 1:numPixelsClass5
        sumOfClass5 = 0;
        for j = 1:numImages
            if Labels(j) == 5
                sumOfClass5 = sumOfClass5 + (X(j,i) - meanClass5(1, i))^2;
            end
        end
        covMatrixClass5(i,i) = sumOfClass5/numOfImagesOfClass5;
    end
   
    prior = numOfImagesOfClass2/numImages;   
    
end

