a=5
% 
% % originalRGB = imread('sun_akrwqbrbzktedeeb.jpg');
img = 'sun_advbapyfkehgemjf.jpg';


% 
% h = fspecial('motion', 50, 45);
% 
% 
% %filteredRGB = imfilter(originalRGB, h);
% %figure, imshow(filteredRGB);
% 
[myFilterBank] = createFilterBank();
% 
% h2 = myFilterBank(2);
% 
% for n = 1:20
%     f = myFilterBank(n);
%     [ filteredRGB ] = imfilter(imgLAB, f{1, 1});
%     figure, imshow(filteredRGB);
%     
% end

collectedFilterResponses = extractFilterResponses(img, myFilterBank);