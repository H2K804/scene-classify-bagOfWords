function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');
    
	% TODO Implement your code here

    % initializing confusion matrix
    numLabels = size(mapping,2);
    conf = zeros(numLabels, numLabels);
    
    
    % Num of test images
    numTest = size(test_imagenames,1);
    
    for i = 1: numTest
                
        % Predicting image class
        imgPath = ['../data/', test_imagenames{i}];
        guessLabel = guessImage(imgPath);
        % guessIndex = strfind(mapping, guessLabel);
        guessIndex = find(strcmp(mapping, guessLabel));

        % Picking index of actual label
        actualIndex = test_labels(i);
        disp(actualIndex);
        
        % increase count for (actual,predicted) value
        conf(actualIndex, guessIndex) = conf(actualIndex, guessIndex) + 1; 
    
    end
    
    % computing acccuracy
    % values along diagonal are correctly identified
    % accuracy  = correctly predicted / total 
    accuracy = trace(conf) / sum(conf(:));
    fprintf('Accuracy: %f\n', accuracy);
    
    % confusion matrix
    disp(conf);
    
end