function [ Labels ] = KNNMapClassification( train, testMap, k )

    Neighbor = zeros(size(train,1), 2);
    rows = size(testMap,2);
    cols = size(testMap,3);
    Labels = zeros(rows, cols);
    
    for i=1:rows
        for j=1:cols
            Neighbor(:,1) = train(:,end);
           
            for z =1: size(testMap,1)
                
                % X - Xi (for whole training vector)
                tmp = testMap(z,i,j) - train(:,z);

                % (X-Xi)^2
                tmp = tmp.^2;

                % (X-Xi)^2 + (Y-Yi)^2 + ...
                Neighbor(:,2) = Neighbor(:,2) + tmp;
            end
            
            % skipped sqrt as it will hurt performance without effecting the
            % classification

            % Sort ascending by distance (without sqrt)
            Neighbor = sortrows(Neighbor,2);

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
                Labels(i,j) = 1;
            end
            if(noOfLabels2 > noOfLabels1 && noOfLabels2 > noOfLabels3)
                Labels(i,j) = 2;
            end
            if(noOfLabels3 > noOfLabels1 && noOfLabels3 > noOfLabels2)
                Labels(i,j) = 3;
            end
        end
    end
end

