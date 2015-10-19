% This function finds the error rate between predicted labels and actual labels
%
% Parameters
% predictedVector: Vector(N x 1)
% actualVector: Vector(N x 1) 
%
% Returns
% errorRate: Scalar (1x1) contains balanced error rate 


function [ errorRates ] = FindErrorRate( predictedLabels, actualLabels )

    totalErrorsOfClass2 = 0;
    totalErrorsOfClass5 = 0;
    totalErrorsOfClass7 = 0;
    totalOfClass2 = 0;
    totalOfClass5 = 0;
    totalOfClass7 = 0;

    % Loop through each Label
    for i = 1:size(predictedLabels)
        switch actualLabels(i)
            case 2
                % Calculate total classes to find the error ratio of Class 1
                totalOfClass2 = totalOfClass2 + 1;
                % Increment the error count if it was not predicted to be
                % Class 1
                if predictedLabels(i) ~= 2
                    totalErrorsOfClass2 = totalErrorsOfClass2 + 1;
                end
            case 5
                % Calculate total classes to find the error ratio of Class 2
                totalOfClass5 = totalOfClass5 + 1;
                % Increment the error count if it was not predicted to be
                % Class 2
                if predictedLabels(i) ~= 5
                    totalErrorsOfClass5 = totalErrorsOfClass5 + 1;
                end
            case 7
                % Calculate total classes to find the error ratio of Class 2
                totalOfClass7 = totalOfClass7 + 1;
                % Increment the error count if it was not predicted to be
                % Class 2
                if predictedLabels(i) ~= 7
                    totalErrorsOfClass7 = totalErrorsOfClass7 + 1;
                end
        end
    end    
    
    errorRates(1) = totalErrorsOfClass2;
    errorRates(2) = totalErrorsOfClass5;
    errorRates(3) = totalErrorsOfClass7;
    errorRates(4) = (totalErrorsOfClass2 / totalOfClass2 + totalErrorsOfClass5 / totalOfClass5 + totalErrorsOfClass7 / totalOfClass7)/3;
    
end

