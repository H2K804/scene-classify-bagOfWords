function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses

% TODO Implement your code here

    % imshow(originalLAB);
    % For gray-scale we replicate the channels into 3 channels 
    if (size(img,3) == 1)
        img = repmat(img,[1,1,3]);
    end
    
    % originalRGB = imread(img);
    doubleI = double(img);
    imgLAB = RGB2Lab(doubleI);
    % figure, imshow(originalRGB);

    sizeI = size(imgLAB,1)*size(imgLAB,2);

    % initializing filterResponses
    filterResponses = zeros(sizeI, length(filterBank)*3);

    for n = 1:20
        h = filterBank(n);
    %     figure, imshow(filteredRGB);
    %     filteredImg = imfilter(imgLAB, h{1, 1});
    %     filterResponses{idx} = filteredImg;
        filterResponses(:,n*3+1) = reshape(imfilter(imgLAB(:,:,1), h{1, 1}), sizeI, 1);
        filterResponses(:,n*3+2) = reshape(imfilter(imgLAB(:,:,2), h{1, 1}), sizeI, 1);
        filterResponses(:,n*3+3) = reshape(imfilter(imgLAB(:,:,3), h{1, 1}), sizeI, 1);
    %     figure, imshow(filteredRGB);
    end

end

