function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.


    % TODO Implement your code here

    % Initialize filter bank
    filterBank = createFilterBank();

    % Number of random pixels for an image
    alpha = 100;

    % Initialize the output matrix
    % chosenResp = zeros(length(imPaths), length(filterBank) * 3); BUG cant
    % assign

    %% Read the images
    for i = 1:length(imPaths)
        fprintf('Computing image %i \n', i);

        % Calculate filter responces for the current image
        I = imread(imPaths{i});
        imgFeatures = extractFilterResponses( I, filterBank);

        % Choose random pixels indices from the given image
        N = size(imgFeatures, 1);
        % disp(N);
        indices = randperm(N, alpha);
        chosenResp( (alpha * (i - 1) + 1) : ( alpha * i ), : ) = imgFeatures(indices, :);

    end

    % Perform K-Means
    K = 100;
    [~, dictionary] = kmeans(chosenResp, K, 'EmptyAction', 'drop');

    dictionary = dictionary';

end