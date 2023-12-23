url = 'https://media.licdn.com/dms/image/D5622AQH_NZrV05F6QQ/feedshare-shrink_800/0/1696411776790?e=1703116800&v=beta&t=-DdQCGtGuuMkbZ75NwVziUwDMbzV7iSvNafV061LLuk';
filename = 'downloaded_image.jpg';

urlwrite(url, filename);

rgbImage = imread(filename);

rgbImage = double(rgbImage) / 255;

redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

cyanChannel = 1 - redChannel;
magentaChannel = 1 - greenChannel;
yellowChannel = 1 - blueChannel;

cmyImage = cat(3, cyanChannel, magentaChannel, yellowChannel);

figure;
subplot(1, 2, 1);
imshow(rgbImage);
title('RGB Image');

subplot(1, 2, 2);
imshow(cmyImage);
title('CMY Image');

imwrite(cmyImage, 'cmy_image.jpg');
