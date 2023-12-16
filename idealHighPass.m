
imageURL = 'https://cdnpt01.viewbug.com/media/mediafiles/2017/01/09/70755471_large.jpg';
originalImage = imread(imageURL);
D0 = 50;
[M, N] = size(originalImage);
u = 0:(M-1);
v = 0:(N-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);
radius = sqrt(U.^2 + V.^2);
idealFilter = double(radius > D0);
idealHighPass = originalImage - imfilter(originalImage, idealFilter);
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 2, 2);
imshow(idealHighPass, []);
title('Ideal High Pass Filtered Image');