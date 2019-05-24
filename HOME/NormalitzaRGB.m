function [rgb] = NormalitzaRGB(im)
    [files, cols, ~] = size(im);
    im = double(im);
    sum = im(:,:,1) + im(:,:,2) + im(:,:,3);
    rgb = uint8(zeros(files, cols, 3));
    rgb(:,:,1) = uint8(255*im(:,:,1)./sum);
    rgb(:,:,2) = uint8(255*im(:,:,2)./sum);
    rgb(:,:,3) = uint8(255*im(:,:,3)./sum);
end