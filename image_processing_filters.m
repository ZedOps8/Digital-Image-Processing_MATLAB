imageUrl = 'https://media.licdn.com/dms/image/D5622AQH_NZrV05F6QQ/feedshare-shrink_800/0/1696411776790?e=1703116800&v=beta&t=-DdQCGtGuuMkbZ75NwVziUwDMbzV7iSvNafV061LLuk';

imageData = webread(imageUrl);

filename = 'downloaded_image.jpg';

imwrite(imageData, filename);

rgbImage = imread(filename);

figure;

subplot(2,3,1);

imshow(rgbImage);

title('Original Image');

greenNoise = rgbImage;

greenNoise(:,:,2) = imnoise(greenNoise(:,:,2), 'gaussian');

redNoise = rgbImage;

redNoise(:,:,1) = imnoise(redNoise(:,:,1), 'salt & pepper');

noisyImage = cat(3, redNoise(:,:,1), greenNoise(:,:,2), rgbImage(:,:,3));

subplot(2,3,2);

imshow(noisyImage);

title('Noisy Image');

avgFiltered = imfilter(noisyImage, fspecial('average'));

medianFiltered = medfilt3(noisyImage);

subplot(2,3,3);

imshow(avgFiltered);
title('Average Filtered');

subplot(2,3,4);

imshow(medianFiltered);

title('Median Filtered');

hsvImage = rgb2hsv(noisyImage);

hsvAvgFiltered = hsvImage;

hsvAvgFiltered(:,:,3) = imfilter(hsvImage(:,:,3), fspecial('average'));

hsvMedianFiltered = hsvImage;

hsvMedianFiltered(:,:,3) = medfilt2(hsvImage(:,:,3));

avgFilteredRGB = hsv2rgb(hsvAvgFiltered);

medianFilteredRGB = hsv2rgb(hsvMedianFiltered);

subplot(2,3,5);

imshow(avgFilteredRGB);

title('HSV- Average Filtered');

subplot(2,3,6);

imshow(medianFilteredRGB);

title('HSV Median Filtered');

figure;

subplot(1,2,1);

imshow(avgFilteredRGB);

title('RGB Average Filtered');

subplot(1,2,2);

imshow(hsv2rgb(hsvAvgFiltered));

title('HSV Average Filtered'); 
