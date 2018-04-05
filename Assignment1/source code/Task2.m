%% Virtual Reality - Assignment 1 - Problem 2
% Histogram Equalization
% Naveena Katpally && Shruthi Kura
% Date : 09.29.2016
%% median filter
clc;
clear all;
close all;
image=imread('spin.jpg'); %read the image
figure
imshow(image)
title('rgb image')
image=rgb2gray(image); %convert the rgb image to grayscale image
figure
imshow(image);  %show the original image
title('gray image')
image=imnoise(image,'salt & pepper',0.05); 
figure,imshow(image) %show the noise  image 
title('noise image')
p=4;
z=uint8(zeros(size(image)+2*(p-1))); %padding the zeros
%loop for padding the zeros
for x=1:size(image,1)
            for y=1:size(image,2)
                z(x+p-1,y+p-1)=image(x,y); 
            end
end 
%loop for finding the median & replacing the central pixel
 for image= 1:size(z,1)-(p-1)
    for j=1:size(z,2)-(p-1)
        kernel=uint8(ones((p-1)^2,1)); 
        t=1;
        for x=1:p-1
          for y=1:p-1
                kernel(t)=z(image+x-1,j+y-1);
                t=t+1;
          end
        end
        filt=sort(kernel);
        out(image,j)=filt(5);
    end
 end
figure,imshow(out);
title(' output image after median filtering')


%% min filter
A = imread('spin.jpg');
A = rgb2gray(A(1:250,1:250,:));
%preallocating the output matrix
L=zeros(size(A));
%zero padding
z=padarray(A,[1 1]);
        x=[1:3]';
        y=[1:3]';
       
for image= 1:size(z,1)-2
    for j=1:size(z,2)-2
        window=reshape(z(image+x-1,j+y-1),[],1);
       L(image,j)=max(window);
   L=uint8(L);

    end
end
figure,imshow(L),title('output image after min filtering');
      
for image= 1:size(z,1)-2
    for j=1:size(z,2)-2
       window=reshape(z(image+x-1,j+y-1),[],1);
        L(image,j)=min(window);

    end
end
L=uint8(L);
figure,imshow(L),title('output image after max filtering');