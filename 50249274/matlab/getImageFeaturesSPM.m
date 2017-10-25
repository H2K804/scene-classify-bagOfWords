function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    %hard coding layerNum = 3 for the project.
    layerNum = 3;
        
    % for layer 0
    h0 = getImageFeatures(wordMap, dictionarySize);
    h0 = h0 * 0.25;
    
    % for layer 1
    % dividing into 4 cells
    rowsize = floor(size(wordMap,1)/2^1);
    colsize = floor(size(wordMap,2)/2^1);
    
    for i = 1:2
        for j = 1:2
            % setting indices for the cell
            cell = wordMap((i-1)*rowsize  + 1 : i*rowsize, (j-1)*colsize + 1 : j*colsize);
            cellCount = (i-1)* 2 + j;
            %setting the ending index
            idx = cellCount*dictionarySize;
            h1(1+(cellCount-1)*dictionarySize: idx, 1) = getImageFeatures(cell, dictionarySize) .* 0.25;
        end
    end 
    
    % for layer 2
    %dividing into 8 cells
    rowsizeL2 = floor(size(wordMap,1)/2^2);
    colsizeL2 = floor(size(wordMap,2)/2^2);

    for i = 1:2^2
        for j = 1:2^2
            cell = wordMap((i-1)*rowsizeL2  + 1 : i*rowsizeL2, (j-1)*colsizeL2 + 1 : j*colsizeL2);
            cellCountL2 = (i-1)* 2^2 + j;
            idxL2 = cellCountL2*dictionarySize;
            h2(1+(cellCountL2-1)*dictionarySize: idxL2, 1) = getImageFeatures(cell, dictionarySize) .* 0.5;
        end
    end 
%     disp(size(h0));
%     disp(size(h1));
%     disp(size(h2));

    % concatenating the values of the histograms of the 3 layers
    h = cat(1, h0, h1, h2);
    % Normalization is performed again in buildRecomendation and
    % guessImage, such that histograms of each layer are on the same scale.
    
%     disp(h);
%     disp(sum(h));
%     disp(size(h));


end