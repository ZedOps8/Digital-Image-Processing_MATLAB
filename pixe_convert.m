url = 'https://bit.ly/3tdQ9xG';
colorImage = imread(url);
grayImage = rgb2gray(colorImage);
subplot(1, 2, 1);
imshow(grayImage);
title('Original Grayscale Image');
thresholdedImage = grayImage;
thresholdedImage(thresholdedImage < 50) = 0;
thresholdedImage(thresholdedImage > 150) = 255;
subplot(1, 2, 2);
imshow(thresholdedImage);
title('Thresholded Image')
