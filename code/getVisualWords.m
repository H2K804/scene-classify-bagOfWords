function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    
    % img = imread('sun_akrwqbrbzktedeeb.jpg');
    
    %[sizeI] = size(img);
    
    filterResponses = extractFilterResponses(img, filterBank);
    
    %disp(size(filterResponses));
    %disp(size(dictionary));
    
    % We calculate the distances between the filterResponses with each
    % cluster center in dictionary.
    % We tranpose to dictionary such that number of columns are the same
    dist = pdist2(filterResponses, dictionary.');
    
    % Find the minimum distance, and its index, for each row i.e. pixel
    [min_dist, index] = min(dist,[],2);
    
    % Creating a wordMap of the img, where each pixel in represented by its
    % closest cluster in the dictionary.
    %wordMap = reshape(index, sizeI);
    wordMap = reshape(index, [size(img,1), size(img,2)]);
    disp(wordMap);
    
    %imagesc(wordMap);
    %figure, imshow(wordMapI);
    
end
