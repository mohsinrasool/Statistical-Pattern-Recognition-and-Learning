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
        % count number instances in each classes.
        noOfLabels1 = 0;
        noOfLabels2 = 0;
        noOfLabels3 = 0;
        for m=1:k
            if(Neighbor(m) == 1)
                noOfLabels1 = noOfLabels1 + 1;
            end
            if(Neighbor(m) == 2)
                noOfLabels2 = noOfLabels2 + 1;
            end
            if(Neighbor(m) == 3)
                noOfLabels3 = noOfLabels3 + 1;
            end
        end

        % Classify on the basis of most instances in k-neighborhood.
        if(noOfLabels1 > noOfLabels2 && noOfLabels1 > noOfLabels3)
            Labels(i) = 1;
        end
        if(noOfLabels2 > noOfLabels1 && noOfLabels2 > noOfLabels3)
            Labels(i) = 2;
        end
        if(noOfLabels3 > noOfLabels1 && noOfLabels3 > noOfLabels2)
            Labels(i) = 3;
        end
    end
end

