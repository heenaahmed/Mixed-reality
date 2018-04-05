function  img_results = brute(img)

%BILATERALFILTER Summary of this function goes here
%   Detailed explanation goes here
%img_gray = rgb2gray(img);
img_gray = img;
kernel_size = 50;
gaussian_kernel = fspecial('gaussian', [kernel_size kernel_size], 5);
img_gray_gaussian = imfilter(img_gray, gaussian_kernel, 'replicate');
%figure, imshow(img_gray_gaussian);
indent = (kernel_size-1)/2;
[height, width] = size(img_gray);
img_results = zeros(height,width);
img_gray = double(img_gray);
sigma_range = 25;
for i = indent + 1:height - indent
for j = indent + 1:width - indent
% range_kernel = exp(-abs(img_gray(i - indent:i + indent,j - indent:j + indent )- img_gray(i,j)).^2/(sigma_range * sigma_range));
 range_kernel = createRangekernel(img_gray, i, j, kernel_size,sigma_range);
kernel = range_kernel .* gaussian_kernel;
normalization = 1/sum(kernel(:));
temp = (kernel.*double(img_gray(i - indent:i + indent,j - indent:j + indent))) * normalization;
img_results(i,j) = sum(temp(:));
end
end

end

