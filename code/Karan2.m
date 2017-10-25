a=5;
close all;

traintest = load("../data/traintest.mat");
allImages = traintest.all_imagenames;

%originalRGB = imread('sun_advbapyfkehgemjf.jpg');
%imagePath = ('../data/art_gallery/sun_aaaxsldstlpzwrbe.jpg');
imagePath = strcat('../data/', allImages{1});
originalRGB = imread(imagePath);

imgLAB = RGB2Lab(originalRGB);

[myFilterBank] = createFilterBank();
allFilteredImgs=[];

for n = 1:20
    f = myFilterBank(n);
    filteredRGB = imfilter(imgLAB, f{1, 1});
    %figure, imshow(filteredRGB);
    allFilteredImgs = cat(4,allFilteredImgs,filteredRGB);
end

montage(allFilteredImgs, 'Size', [4 5])