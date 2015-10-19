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
        for j=1:k
            if(Neighbor(j) == 1)
                Labels(i,1) = Labels(i,1) + 1;
            else
                Labels(i,1) = Labels(i,1) - 1;
            end
        end
        
        % Classify on the basis of most instances in k-neighborhood.
        if(Labels(i,1)>0)
            Labels(i,1) = 1;
        else
            Labels(i,1) = 0;
        end
    end
end

