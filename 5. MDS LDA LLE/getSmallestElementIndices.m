function [smallestNIdx] = getSmallestElementIndices(A, n)
     [ASorted AIdx] = sort(A);
%      smallestNElements = ASorted(1:n);
     smallestNIdx = AIdx(2:n+1);
end