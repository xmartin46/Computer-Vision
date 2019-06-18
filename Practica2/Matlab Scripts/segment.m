function [BW] = segment(imageJPG)
    % gray = rgb2gray(imageJPG);
    % mask = false(size(gray));
    % mask(170,70) = true;
    % W = graydiffweight(gray,mask,'GrayDifferenceCutoff',60);
    % thresh = 0.03;
    % [BW, D] = imsegfmm(W, mask, thresh);
    gray = rgb2gray(imageJPG);
    mask = zeros(size(gray));
    mask(10:end-10,10:end-10) = 1;
    %figure, imshow(mask), title('Màscara inicial')
    BW = activecontour(imageJPG,mask,500);
end

