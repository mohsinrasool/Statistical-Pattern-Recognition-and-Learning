% This function finds the error rate between predicted labels and actual labels
%
% Parameters
% predictedVector: Vector(N x 1)
% actualVector: Vector(N x 1) 
%
% Returns
% errorRate: Scalar (1x1) contains balanced error rate 


function [ errorRates ] = FindErrorRate( predictedLabels, actualLabels )

    totalErrorsOfClass1 = 0;
    totalErrorsOfClass2 = 0;
    totalErrorsOfClass3 = 0;
    totalOfClass1 = 0;
    totalOfClass2 = 0;
    totalOfClass3 = 0;

    % Loop through each Label
    for i = 1:size(predictedLabels)
        switch actualLabels(i)
            case 1
                % Calculate total classes to find the error ratio of Class 1
                totalOfClass1 = totalOfClass1 + 1;
                % Increment the error count if it was not predicted to be
                % Class 1
                if predictedLabels(i) ~= 1
                    totalErrorsOfClass1 = totalErrorsOfClass1 + 1;
                end
            case 2
                % Calculate total classes to find the error ratio of Class 2
                totalOfClass2 = totalOfClass2 + 1;
                % Increment the error count if it was not predicted to be
                % Class 2
                if predictedLabels(i) ~= 2
                    totalErrorsOfClass2 = totalErrorsOfClass2 + 1;
                end
            case 3
                % Calculate total classes to find the error ratio of Class 3
                totalOfClass3 = totalOfClass3 + 1;
                % Increment the error count if it was not predicted to be
                % Class 3
                if predictedLabels(i) ~= 3
                    totalErrorsOfClass3 = totalErrorsOfClass3 + 1;
                end
        end
    end    
    
    errorRates(1) = totalErrorsOfClass1;
    errorRates(2) = totalErrorsOfClass2;
    errorRates(3) = totalErrorsOfClass3;
    errorRates(4) = (totalErrorsOfClass1 / totalOfClass1 + totalErrorsOfClass2 / totalOfClass2 + totalErrorsOfClass3 / totalOfClass3)/3;
    
end

