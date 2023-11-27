originalImage = 
imread('https://cdnpt01.viewbug.com/media/mediafiles/2017/01/09/70755471_large.jpg');
laplacianFilter = fspecial('laplacian', 0.5);
laplacianImage = imfilter(originalImage, laplacianFilter);
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 2, 2);
imshow(laplacianImage);
title('Laplacian Filtered Image');
