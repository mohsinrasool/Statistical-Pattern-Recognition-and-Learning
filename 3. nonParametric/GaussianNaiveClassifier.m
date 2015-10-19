function [ Labels ] = GaussianNaiveClassifier( train, testData, h )

    Class1 = find(train(:,5)==1);
    Class2 = find(train(:,5)==2);
    Class3 = find(train(:,5)==3);
    
    N1 = size(Class1,1);
    N2 = size(Class2,1);
    N3 = size(Class3,1);
    N = size(train,1);
    
    temp = 0;
    Prob = zeros(size(testData,3));
    Labels = zeros(size(testData,1), 1);

    for i = 1: size(testData,1)
        % Calculate probability for Class 1
        temp =0;
        for j = 1:N1
            temp = temp + GaussianKernel( ( testData(i,:) - train(Class1(j),:) ) / h);
        end

        Prob(i,1) = (temp / (N1 * (h ^ 4) )) * N1/N;

        % Calculate probability for Class 2
        temp =0;
        for j = 1:N2
            temp = temp + GaussianKernel( ( testData(i,:) - train(Class2(j),:) ) / h);
        end

        Prob(i,2) = (temp / (N2 * (h ^ 4) )) * N2/N;

        % Calculate probability for Class 3
        temp =0;
        for j = 1:N3
            temp = temp + GaussianKernel( ( testData(i,:) - train(Class3(j),:) ) / h);
        end

        Prob(i,3) = (temp / (N3 * (h ^ 4) )) * N3/N;
    end
    
    % Classify the test data based on higher probability
    for i = 1:size(testData,1)
        % If test record does not lie under any bin, probability of each
        % class would be zero.
        if(max(Prob(i,:)) == 0)
            Labels(i,1) = 0;
        else
            maxProb = find( Prob(i,:) == max(Prob(i,:)) );
            % if there is one instance of max
            if(size(maxProb,2)==1)
                Labels(i,1) = maxProb;
            % if there are multiple max probablities (i.e. same same)
            else
                Labels(i,1) = maxProb(1);
            end
        end
    end
    
    
end


function [ kernelVal ] = GaussianKernel ( U ) 

    U(5) = [];  % delete label column
    kernelVal = ((1/sqrt(2*pi()))^4) * exp(-(norm(U)^2)/2);
    
end