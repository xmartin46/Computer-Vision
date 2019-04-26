function [rb] = NormalitzaRGB(im)
    [files cols ch] = size(im);
    im = double(im);
    sum = im(:,:,1) + im(:,:,2) + im(:,:,3);
    rb = uint8(zeros(files, cols,2));
    rb(:,:,1) = uint8(255*im(:,:,1)./sum);
    rb(:,:,2) = uint8(255*im(:,:,3)./sum);
end

