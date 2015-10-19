function [ errorVector ] = findErrorVectors( predictedLabels, actualDataWithLabels )

    errorIndex = 1;
    
    % Loop through each Label
    for i = 1:size(predictedLabels)
        switch actualDataWithLabels(i,3)
            case 0
                % Increment the error count if it was not predicted to be
                % Class 1
                if predictedLabels(i) ~= 0
                    errorVector(errorIndex,1) = actualDataWithLabels(i,1);
                    errorVector(errorIndex,2) = actualDataWithLabels(i,2);
                    errorVector(errorIndex,3) = actualDataWithLabels(i,3);
                    errorIndex = errorIndex + 1;
                end
            case 1
                % Increment the error count if it was not predicted to be
                % Class 2
                if predictedLabels(i) ~= 1
                    errorVector(errorIndex,1) = actualDataWithLabels(i,1);
                    errorVector(errorIndex,2) = actualDataWithLabels(i,2);
                    errorVector(errorIndex,3) = actualDataWithLabels(i,3);
                    errorIndex = errorIndex + 1;
                end
        end
    end    
    
end

