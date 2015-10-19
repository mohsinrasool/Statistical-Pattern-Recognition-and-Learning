function [ Labels ] = KNNClassification( train, test, k )

    Neighbor = zeros(size(train,1), 2);
    Labels = zeros(size(test,1), 1);
    
    for i=1:size(test,1)
     
        Neighbor(:,1) = train(:,3);
        % X - Xi (for whole training vector)
        tmp1 = test(i,1) - train(:,1);
        % Y - Yi (for whole training vector)
        tmp2 = test(i,2) - train(:,2);
        
        % (X-Xi)^2
        tmp1 = tmp1.^2;
        % (Y-Yi)^2
        tmp2 = tmp2.^2;
        % (X-Xi)^2 + (X-Xi)^2
        Neighbor(:,2) = tmp1 + tmp2;        

        % skipped sqrt as it will hurt performance without effecting the
        % classification

        % Sort ascending by distance (without sqrt)
        Neighbor = sortrows(Neighbor,2);
        
        
        % count number instances in each classes.
        class2Instances = 0;
        class5Instances = 0;
        class7Instances = 0;
        for j=1:k
            switch Neighbor(j)
                case 2
                    class2Instances = class2Instances + 1;
                case 5
                    class5Instances = class5Instances + 1;
                case 7
                    class7Instances = class7Instances + 1;
            end
        end
        class2Instances = class2Instances/size( find(train(:,end) == 2), 1);
        class5Instances = class5Instances/size( find(train(:,end) == 5), 1);
        class7Instances = class7Instances/size( find(train(:,end) == 7), 1);
        
        Labels(i,1) = 0;
        % Classify on the basis of most instances in k-neighborhood.
        if(class2Instances>class5Instances && class2Instances > class7Instances)
            Labels(i,1) = 2;
        end
        if(class5Instances>class2Instances && class5Instances > class7Instances)
            Labels(i,1) = 5;
        end
        if(class7Instances>class2Instances && class7Instances > class5Instances)
            Labels(i,1) = 7;
        end
        
    end
end

