function [ Sb ] = computeBetweenMatrix( train )

features = size(train,2)-1;

meanClass2 = mean(train(train(:,end) == 2,1:end-1))';
meanClass5 = mean(train(train(:,end) == 5,1:end-1))';
meanClass7 = mean(train(train(:,end) == 7,1:end-1))';

priorClass2 = size(find(train(:,end) == 2),1)/ size(train,1);
priorClass5 = size(find(train(:,end) == 5),1)/ size(train,1);
priorClass7 = size(find(train(:,end) == 7),1)/ size(train,1);

globalMean = (priorClass2 * meanClass2) + (priorClass5 * meanClass5) + (priorClass7 * meanClass7);
Sb = (priorClass2 * ((meanClass2-globalMean) * (meanClass2-globalMean)')) + (priorClass5 * ((meanClass5-globalMean) * (meanClass5-globalMean)')) + (priorClass7 * ((meanClass7-globalMean) * (meanClass7-globalMean)'));

% globalMean = priorClass2 * meanClass2 + priorClass5 * meanClass5;
% Sb = priorClass2 * (meanClass2-globalMean) * (meanClass2-globalMean)' + priorClass5 * (meanClass5-globalMean) * (meanClass5-globalMean)';

end

