function [ Z ] = applyLLE( dataSet, k )

    noOfPoints = size(dataSet,1);
    noOfFeatures = size(dataSet,2);
    distanceMatrix = zeros(noOfPoints, noOfPoints);
    W = zeros(noOfPoints, noOfPoints);
    
%     distanceMatrix = pdist2(dataSet,dataSet);;
    for i=1:noOfPoints
        
        % Find distance to all other points 
        for j=1:noOfPoints
            if i ~= j
                distance = (dataSet(j,:) - dataSet(i,:)).^2;
                distanceMatrix(i,j) = sqrt(distance * ones(noOfFeatures,1));
            end
        end
        
        tmp = distanceMatrix(i,:);
        [sortedValues sortedIndices] = sort(tmp);
        % Skip first element which will be zero of diagonal entry
        smallestIndices = [];
        for i2 = 1:k
            index = find(distanceMatrix(i,:) == sortedValues(i2+1));
            smallestIndices = [smallestIndices; index];
        end
        
        G = zeros(k,k);
        for i2 = 1:k
            for j2 = 1:k
                G(i2,j2) = dot( dataSet(i,:) - dataSet(smallestIndices(i2),:), dataSet(i,:) - dataSet(smallestIndices(j2),:) );
            end
        end
        
        % solve the system for w
        wVector = G\ones(k,1);
        
        % Normalize so sum remains 1;
        sumW = ones(1, size(wVector,1)) * wVector;
        wVector = wVector / sumW;
        
        % Update weight matrix with Wij
        for i2 = 1:k
            W(i,smallestIndices(i2)) = wVector(i2);
        end
    end

    M = (eye(noOfPoints,noOfPoints)- W) * (eye(noOfPoints,noOfPoints)-W)';
    
    [eVectors, eValues] = eig(M);
    eD = diag(eValues)';
    
    [eD,idx] = sort(eD);
    eVectors =  eVectors(:,idx);
    
    %esVectors = sortcol([eVectors; eD],size([eVectors; eD],1));
    Z = eVectors(:,1:k);
end

