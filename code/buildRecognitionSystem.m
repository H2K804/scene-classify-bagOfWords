function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features
    
    % Size of dictionary
    dictSize = size(dictionary, 2);
    
    % Numbers of layers for SPM
    layerNum = 3;
    
    % Number of training images
    numTrain = size(train_imagenames, 1); 
    
    % Initialing matrix for training image features
    train_features = zeros(dictSize * (4^layerNum - 1) / 3, numTrain);
    
    % Computing features for every image
    for i = 1:numTrain
        % replace '.jpg' in train_imagenames to '.mat' to pick
        % corresponding wordMap of image
        imageWordMap = ['../data/', strrep(train_imagenames{i}, '.jpg', '.mat')];
        load(imageWordMap);
        
        % compute features for each training image
        h = getImageFeaturesSPM(layerNum, wordMap, dictSize);
        
        %Uncomment for running extra credit implementation
        %h = getImageFeaturesSPMweighted(layerNum, wordMap, dictSize);
        
        % Normalization across the three layers
        h = h / norm(h, 1);
        train_features(:, i) = h;
    end

	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end