function [ W, mappedTrain ] = applySOM( train, rows, cols, eetaNot, lembda, sigmaSqNot, beta, maxEpochs )

    d = size(train,2);
    noOfExamples = size(train,1);
    W = zeros(d, rows, cols);
    mappedTrain = zeros(noOfExamples, 2);
    
    % 1: Intialize W with random vectors
    for i=1:rows
        for j=1:cols
            W(:,i,j) = train( ceil(rand()*300), :)' ;%
        end
    end

    
    for epoch = 1: maxEpochs 
        
        % 2: Pick an example point
        for example = 1: noOfExamples
            D = zeros(rows,cols);
            
            % 2.1: calculate distance of example point with each weight
            % vector
            for i=1:rows
                for j=1:cols
                    D(i,j) = ones(1,d) * ((train(example,:)' - W(:,i,j)).^2);
                end
            end
            
            % 2.2: Find index of minimum distance
            bmuIndex = [1; 1];
            bmuMinValue = D(1,1);
            for i=1:rows
                for j=1:cols
                    if(D(i,j)<bmuMinValue)
                        bmuIndex = [i;j];
                        bmuMinValue = D(i,j);
                    end
                end
            end
            
            % 2.3: Compute eeta
            eeta = eetaNot * exp(-epoch * lembda);
            
            % 2.4: Find differenatial for Wij i.e. BMU
            dWij = eeta * (train(example,:)' - W(:,bmuIndex(1), bmuIndex(2)));
            
            % 2.5: Update BMU weight vector
            W(:,bmuIndex(1), bmuIndex(2)) = W(:,bmuIndex(1), bmuIndex(2)) + dWij;
            
            % 2.6: Update BMU neighbor weight vector
            
            for i=1:rows
                for j=1:cols
                    
                    % 2.6.1: Calculate distances of neighbors from BMU
                    D(i,j) = ones(1,2) * (([i; j] - bmuIndex).^2);
                    
                    % 2.6.2: Calculate Sigma Square
                    sigmaSq = sigmaSqNot * exp(-epoch*beta);
                    
                    % 2.6.3: Calculate e
                    ee = exp(-D(i,j)/(2*sigmaSq));
                    
                    % 2.6.4: Update corresponding weight vector with
                    % differntial
                    W(:,i,j) = W(:,i,j) + ee * eeta * ( train(example,:)' - W(:,i,j));
                end
            end
        end
    end
    
    for example = 1: noOfExamples
        D = zeros(rows,cols);

        % 2.1: calculate distance of example point with each weight
        % vector
        for i=1:rows
            for j=1:cols
                D(i,j) = ones(1,d) * ((train(example,:)' - W(:,i,j)).^2);
            end
        end

        % 2.2: Find index of minimum distance
        bmuIndex = [1; 1];
        bmuMinValue = D(1,1);
        for i=1:rows
            for j=1:cols
                if(D(i,j)<bmuMinValue)
                    bmuIndex = [i;j];
                    bmuMinValue = D(i,j);
                end
            end
        end
        mappedTrain(example,:) = bmuIndex';            
    end   
    
end

