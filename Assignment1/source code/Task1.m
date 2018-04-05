%% Virtual computing and mixed Reality - Assignment 1 - Problem 1
% Histogram Equalization
% Naveena Katpally && Shruthi Kura
% Date : 09.29.2016
%%
clear all;
close all;
clc;
%% reading the color image
rgb_img=imread('bear.jpg');
figure;
imshow(rgb_img);
title('rgb color image');
%% converting the color image to gray image
gray_img=rgb2gray(rgb_img);
figure
imshow(gray_img);
title('gray image')
%% calculating the histogram
 gray_img=double(gray_img); 
maxv_gray=max(max(gray_img));
[x y]=size(gray_img);
l=x*y;
m=zeros(1,300);
n=zeros(1,300);
for i=1:x
  for j=1:y
     if gray_img(i,j) == 0
       gray_img(i,j)=1;
     end
  end
end
for i=1:x
  for j=1:y
    t = gray_img(i,j);
    m(t) = m(t) + 1;
  end
end
% The height of each bar is, (number of observations in the bin) / (total number of observations * width of bin)
probf = m/l;
% The height of each bar is equal to the cumulative relative number of observations in the bin and all previous bins.
cumf(1) = probf(1);
for x=2:maxv_gray
  cumf(x) = probf(x) + cumf(x-1);
end
v = round(cumf * maxv_gray);
v = v + 1;
for r=1:x
   for s=1:y
    temp=gray_img(r,s);
    val(r,s)=v(temp);
    t=val(r,s);
    n(t)=n(t)+1;
end
end
val=val-1;
figure
subplot(2,1,1)
bar(m) 
title('Histogram of the Original Image');
subplot(2,1,2)
bar(n) 
title('Histogram equalisation of Image');