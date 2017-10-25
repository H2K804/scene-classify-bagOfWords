function [h] = getImageFeatures(wordMap, dictionarySize)
% Compute histogram of visual words
% Inputs:
% 	wordMap: WordMap matrix of size (h, w)
% 	dictionarySize: the number of visual words, dictionary size
% Output:
%   h: vector of histogram of visual words of size dictionarySize (l1-normalized, ie. sum(h(:)) == 1)

	% TODO Implement your code here
	
	h=zeros(size(dictionarySize,1), size(dictionarySize,2));
    
    %reshape wordMap to 1D vector for simpler traversal
    wordVec = reshape(wordMap,1, []);
    
%     for i = 1:dictionarySize
%         count = 0;
%         for j = 1:length(wordVec)
%         if wordVec(j) == i 
%             count = count + 1;
%         end
%         end
%         h(i) = count;
%     end
%     
%     disp(h);
%     disp(dictionarySize);
%     disp(size(h));
%     
%     assert(numel(h) == dictionarySize);
%     h2 = h.';
%     disp(size(h2));
%     hist(h2);

    h = hist(wordVec, 1:dictionarySize);
    % Normailization such sum(h) = 1
    h = h / norm(h, 1);
    h = h.';
    
    assert(numel(h) == dictionarySize);
end