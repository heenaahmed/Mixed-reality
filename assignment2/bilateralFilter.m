function  img_results = bilateralFilter(img)

%BILATERALFILTER Summary of this function goes here
%   Detailed explanation goes here
img_gray = img;
kernel_size = 50;
indent = (kernel_size-1)/2;
[height, width] = size(img_gray);
img_results = zeros(height,width);
img_gray = double(img_gray);
sigma_range = 25;
for i = indent + 1:height - indent
    for j = indent + 1:width - indent
        
        range_kernel1=exp(-abs(img_gray(i-indent:i+indent,j)-img_gray(i,j)).^2/(sigma_range*sigma_range));
        kernel1=range_kernel1;
        normalization = 1/sum(kernel1(:));
        temp1 = (kernel1.*double(img_gray(i - indent:i + indent,j)))*normalization;
        img_results(i,j) = sum(temp1(:));
        
        range_kernel2=exp(-abs( img_results(i,j-indent:j+indent)-img_results(i,j)).^2/(sigma_range*sigma_range));
        kernel2=range_kernel2;
        normalization2 = 1/sum(kernel2(:));
        temp2=(kernel2.*double(img_results(i,j-indent:j+indent)))*normalization2;
        img_results(i,j)=sum(temp2(:));
        
    end
end

end

