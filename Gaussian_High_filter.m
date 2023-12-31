imageURL = 'https://cdnpt01.viewbug.com/media/mediafiles/2017/01/09/70755471_large.jpg';
originalImage = imread(imageURL);
sigma = 10; 
gaussianFilter = fspecial('gaussian', size(originalImage), sigma);
gaussianHighPass = originalImage - imfilter(originalImage, gaussianFilter);
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 2, 2);
imshow(gaussianHighPass, []);
title('Gaussian High Pass Filtered Image');
