function [ reshapedData ] = reshapeData( dataSet )

reshapedData = [];

for i = 1:size(dataSet,1)
    
    im = dataSet(i,:);
    im = reshape(im, 256, 256);
    im = imresize(im, [32 32]);
    im = reshape(im, 1, 1024);
    reshapedData = [reshapedData; im];
end

end

