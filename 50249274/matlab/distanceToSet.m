function histInter = distanceToSet(wordHist, histograms)
% Compute distance between a histogram of visual words with all training image histograms.
% Inputs:
% 	wordHist: visual word histogram - K * (4^(L+1) − 1 / 3) × 1 vector
% 	histograms: matrix containing T features from T training images - K * (4^(L+1) − 1 / 3) × T matrix
% Output:
% 	histInter: histogram intersection similarity between wordHist and each training sample as a 1 × T vector

	% TODO Implement your code here
    
    % Number of training image histograms to compare with    
    sizeH = size(histograms, 2); 
    
    % Replicating wordHist to same size as histograms so that we can apply
    % bsxfun
    wordHistRep = repmat(wordHist, 1, sizeH);
    
    % applying min function for training histogram
    dist = bsxfun(@min, histograms, wordHistRep);

    % summing distances for comparison in guessImage
    histInter = sum(dist);
	
end