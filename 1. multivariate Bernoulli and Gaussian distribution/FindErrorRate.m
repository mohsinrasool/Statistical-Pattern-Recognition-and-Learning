
% This function finds the error rate between predicted labels and actual labels
%
% Parameters
% predictedVector: Vector(N x 1)
% actualVector: Vector(N x 1) 
%
% Returns
% errorRate: Scalar (1x1) contains balanced error rate 

function [ errorRate ] = FindErrorRate( predictedLabels, actualLabels )

    totalErrorsOfClass2 = 0;
    totalErrorsOfClass5 = 0;
    totalOfClass2 = 0;
    totalOfClass5 = 0;

    % Loop through each Label
    for i = 1:size(predictedLabels)
        
        % Check if its a Class 2
        if actualLabels(i) == 2
            % Calculate total classes to find the error ratio of Class 2
            totalOfClass2 = totalOfClass2 + 1;
            % Increment the error count if it was not predicted to be
            % Class 5
            if predictedLabels(i) ~= 2
                totalErrorsOfClass2 = totalErrorsOfClass2 + 1;
            end
        else
            % Calculate total classes to find the error ratio of Class 2
            totalOfClass5 = totalOfClass5 + 1;
            % Increment the error count if it was not predicted to be
            % Class 5
            if predictedLabels(i) ~= 5
                totalErrorsOfClass5 = totalErrorsOfClass5 + 1;
            end
        end
    end    

    % Calculate the balanaced error rate 
    errorRate = (totalErrorsOfClass2/totalOfClass2 + totalErrorsOfClass5/totalOfClass5)/2;
end

