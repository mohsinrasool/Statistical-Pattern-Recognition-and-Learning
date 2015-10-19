
% This function classifies input images into Class 2 or Class 5 based 
% using Gaussian Maximum Liklihood Classifier
%
% Parameters
% TestData: Matrix of N X 256
% meanClass2: Vector(N x 1) contains probability E(X)/N
% meanClass5: Vector(N x 1) contains probability E(X)/N
% covMatrixClass2: Matrix(N x M) covariance matrix of Class 2
% covMatrixClass5: Matrix(N x M) covariance matrix of Class 5
% zeroIndClass2: Vector(N x 1) contains indexes of feature to be deleted
% for Class 2
% zeroIndClass5: Vector(N x 1) contains indexes of feature to be deleted
% for Class 5
%
% Returns
% predictedLabels: Vector(N x 1) contains Label for each image


function [predictedLabels] = predictByGaussianML(TestData, meanClass2, meanClass5, covMatrixClass2, covMatrixClass5, zeroIndClass2, zeroIndClass5)

    TestDataClass2 = TestData;
    TestDataClass5 = TestData;
    
    TestDataClass2(:,zeroIndClass2) = [];
    TestDataClass5(:,zeroIndClass5) = [];
    
    predictedLabels = zeros(size(TestData,1), 1);

    [numOfImages,numOfPixelsOfClass2] = size(TestDataClass2);
    probDensityVectorClass2 = zeros(numOfImages, 1);
    [numOfImages,numOfPixelsOfClass5] = size(TestDataClass5);
    probDensityVectorClass5 = zeros(numOfImages, 1);
    
    invCovMatrixClass2 = inv(covMatrixClass2);
    invCovMatrixClass5 = inv(covMatrixClass5);
    
    denominatorClass2 = (2 * pi() )^(numOfPixelsOfClass2/2) * sqrt(det(covMatrixClass2));
    denominatorClass5 = (2 * pi() )^(numOfPixelsOfClass5/2) * sqrt(det(covMatrixClass5));
    
    for i = 1:numOfImages
        
        % Calculate (X-U)
        differenceVectorClass2 = TestDataClass2(i,:) - meanClass2;
        % Calculate ( (X-U)' * inv(CovMatrix) * (X-U) )
        distanceClass2 = differenceVectorClass2 * invCovMatrixClass2 * differenceVectorClass2'; 
        % Calculate Guassian Density by  ( e^(-( (X-U)' * inv(CovMatrix) *
        % (X-U) )/2) / ((2*pi)^D * SQRT(|CovMatrix|))
        probDensityVectorClass2(i) = (exp(-distanceClass2/2)) / denominatorClass2;

        % Calculate (X-U)
        differenceVectorClass5 = TestDataClass5(i,:) - meanClass5;
        % Calculate ( (X-U)' * inv(CovMatrix) * (X-U) )
        distanceClass5 = differenceVectorClass5 * invCovMatrixClass5 * differenceVectorClass5';
        % Calculate Guassian Density by  ( e^(-( (X-U)' * inv(CovMatrix) *
        % (X-U) )/2) / ((2*pi)^D * SQRT(|CovMatrix|))
        probDensityVectorClass5(i) = (exp(-distanceClass5/2)) / denominatorClass5;

        % Classify image based on the probability
        if probDensityVectorClass2(i) > probDensityVectorClass5(i)
            predictedLabels(i) = 2;
        else
            predictedLabels(i) = 5;
        end    
    
    end
    
end

