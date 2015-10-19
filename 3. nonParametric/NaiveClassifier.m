function [ Labels ] = NaiveClassifier( train, testData, h )

    Class1 = find(train(:,5)==1);
    Class2 = find(train(:,5)==2);
    Class3 = find(train(:,5)==3);
    
    N1 = size(Class1,1);
    N2 = size(Class2,1);
    N3 = size(Class3,1);
    N = size(train,1);
    
    sum = 0;
    Prob = zeros(size(testData,3));
    Labels = zeros(size(testData,1), 1);

    for i = 1: size(testData,1)
        sum =0;
        for j = 1:N1
            sum = sum + UniformKernel( (testData(i,:) - train(Class1(j),:)) / h);
        end

        Prob(i,1) = (sum / (N1 * (h ^ 4) )) * N1/N;
    end
    
    for i = 1: size(testData,1)
        sum =0;
        for j = 1:N2
            sum = sum + UniformKernel( (testData(i,:) - train(Class2(j),:)) / h);
        end

        Prob(i,2) = (sum / (N2 * (h ^ 4) )) * N2/N;
    end

    for i = 1: size(testData,1)
        sum = 0;
        for j = 1:N3
            sum = sum + UniformKernel( (testData(i,:) - train(Class3(j),:)) / h);
        end

        Prob(i,3) = (sum / (N3 * (h ^ 4) )) * N3/N;
    end
    
    for i = 1:size(testData,1)
        if(max(Prob(i,:)) == 0)
            Labels(i,1) = 0;
        else
            maxProb = find( Prob(i,:) == max(Prob(i,:)) );
            if(size(maxProb,2)==1)
                Labels(i,1) = maxProb;
            else
                Labels(i,1) = maxProb(1);
            end
        end
    end
    
    
end


function [ step ] = UniformKernel ( U ) 

    U(5) = [];
    step = 1;
    % Do not cater label column
    for i = 1:size(U,2)
        if( abs(U(i)) > 0.5 )
            step = 0;
            break;
        end
    end
    
end