
% This function calculates all the required paramters of Bernaulli distribution
% 
%
% Parameters
% TrainData: Training Data Matrix of N X 256
% TrainDataLabels: Labels for each image either 2 or 5
%
% Returns
% probVectorClass2: Vector(256 x 1) contains probability P(Xi=1|C=2)
% probVectorClass5: Vector(256 x 1) contains probability P(Xi=1|C=5)
% prior: Scalar(1x1) contains P(C=2)

function [ probVectorClass2, probVectorClass5, prior ] = learnBernoulliParameters( TrainData, TrainDataLabels )

    [numOfImages,numOfPixels] = size(TrainData);

    probVectorClass2 = zeros(numOfPixels, 1);
    probVectorClass5 = zeros(numOfPixels, 1);

    sumVectorClass2 = zeros(numOfPixels, 1);
    sumVectorClass5 = zeros(numOfPixels, 1);
    
    numOfImagesOfClass2 = 0;

    % Loop through each image 
    for i = 1:numOfImages
        % Count number of Class2 images
        if TrainDataLabels(i) == 2
            numOfImagesOfClass2 = numOfImagesOfClass2 + 1;
        end
        
        % Loop through each pixel to find number of 1's in each feature
        % based on image's label/class
        for j = 1:numOfPixels
            if TrainData(i,j) == 1
                % Count the number of 1's in for each class separately
                if TrainDataLabels(i) == 2
                    sumVectorClass2(j) = sumVectorClass2(j) + 1;
                elseif TrainDataLabels(i) == 5
                    sumVectorClass5(j) = sumVectorClass5(j) + 1;
                end
            end
        end
    end

    % Loop through each feature to find its probability i.e. P(Xi=1|Class)
    for i = 1:numOfPixels
        % Calculate P(Xi=1|C=2)
        probVectorClass2(i) = sumVectorClass2(i) / (numOfImagesOfClass2);
        
        % Make it too low if its 0
        if probVectorClass2(i) == 0
            probVectorClass2(i) = 0.000001;
        end
        
        % Calculate P(Xi=1|C=5)
        probVectorClass5(i) = sumVectorClass5(i) / (numOfImages-numOfImagesOfClass2);

        % Make it too low if its 0
        if probVectorClass5(i) == 0
            probVectorClass5(i) = 0.000001;
        end
    end

    % Calculate P(C=2)
    prior = numOfImagesOfClass2/numOfImages;
    
    clear sumVectorClass2  sumVectorClass5 numOfImagesOfClass2;
    
end



