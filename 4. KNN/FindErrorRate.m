% This function finds the error rate between predicted labels and actual labels
%
% Parameters
% predictedVector: Vector(N x 1)
% actualVector: Vector(N x 1) 
%
% Returns
% errorRate: Scalar (1x1) contains balanced error rate 


function [ errorRates ] = FindErrorRate( predictedLabels, actualLabels )

    totalErrorsOfClass0 = 0;
    totalErrorsOfClass1 = 0;
    totalOfClass0 = 0;
    totalOfClass1 = 0;

    % Loop through each Label
    for i = 1:size(predictedLabels)
        switch actualLabels(i)
            case 0
                % Calculate total classes to find the error ratio of Class 1
                totalOfClass0 = totalOfClass0 + 1;
                % Increment the error count if it was not predicted to be
                % Class 1
                if predictedLabels(i) ~= 0
                    totalErrorsOfClass0 = totalErrorsOfClass0 + 1;
                end
            case 1
                % Calculate total classes to find the error ratio of Class 2
                totalOfClass1 = totalOfClass1 + 1;
                % Increment the error count if it was not predicted to be
                % Class 2
                if predictedLabels(i) ~= 1
                    totalErrorsOfClass1 = totalErrorsOfClass1 + 1;
                end
        end
    end    
    
    errorRates(1) = totalErrorsOfClass0;
    errorRates(2) = totalErrorsOfClass1;
    errorRates(3) = (totalErrorsOfClass0 / totalOfClass0 + totalErrorsOfClass1 / totalOfClass1)/2;
    
end

