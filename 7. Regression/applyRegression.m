function [ W, TransformedPoints ] = applyRegression( trainData, degree )

    noOfPoints = size(trainData,1);
    
    switch(degree)
        case 1
            X = [ ones(noOfPoints, 1) trainData(:,1)] ;
        case 2
            X = [ ones(noOfPoints, 1) trainData(:,1) trainData(:,1).^2 ] ;
        case 3
            X = [ ones(noOfPoints, 1) trainData(:,1) trainData(:,1).^2 trainData(:,1).^3 ] ;
        case 4
            X = [ ones(noOfPoints, 1) trainData(:,1) trainData(:,1).^2 trainData(:,1).^3 trainData(:,1).^4 ] ;
        case 5
            X = [ ones(noOfPoints, 1) trainData(:,1) trainData(:,1).^2 trainData(:,1).^3 trainData(:,1).^4 trainData(:,1).^5 ] ;
        case 6
            X = [ ones(noOfPoints, 1) trainData(:,1) trainData(:,1).^2 trainData(:,1).^3 trainData(:,1).^4 trainData(:,1).^5 trainData(:,1).^6 ] ;
    end
    R = trainData(:,2);

    A = X' * X;
    B = X' * R;
    
    W = inv(A) * B;
    
    TransformedPoints = X * W;
end

