% brute force
close all;
clear All;
clc;

img = imread('middle.jpg');
img_results = zeros(size(img));
figure,imshow(img);
img_gray = rgb2gray(img);
tic;
for c = 1:3
img_results(:,:,c) = brute(img(:,:,c));
end
toc;
figure, imshow(uint8(img_results));
title('brute');


% seperable filter

% close all;
% clear All;
% clc;

img = imread('middle.jpg');
img_results = zeros(size(img));
% figure,imshow(img);
img_gray = rgb2gray(img);
tic;
for c = 1:3
img_results(:,:,c) = bilateralFilter(img(:,:,c));
end
toc;
figure, imshow(uint8(img_results));
title('seperable');


% box kernel
% close all;
% clear All;
% clc;

img = imread('middle.jpg');
img_results = zeros(size(img));
% figure,imshow(img);
img_gray = rgb2gray(img);
tic;
for c = 1:3
img_results(:,:,c) = box(img(:,:,c));
end
toc;
figure, imshow(uint8(img_results));
title('box');
