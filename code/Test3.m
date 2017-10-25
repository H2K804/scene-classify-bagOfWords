load('../data/traintest.mat','all_imagenames','mapping');
load('dictionary.mat','filterBank','dictionary');

filterBank = filterBank;
dictionary = dictionary;

image = imread('sun_awizvltfovpkcfkd.jpg');

wordRepresentation = getVisualWords(image, filterBank, dictionary);

dictSize = size(dictionary,2);

%disp(wordRepresentation);
%disp(dictSize);

h1 = getImageFeaturesSPM(3,wordRepresentation, dictSize);
%disp(h1);