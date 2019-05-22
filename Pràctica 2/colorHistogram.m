function [pixelCount, grayLevels] = colorHistogram(original, segmented, bins)
%     figure, imshow(original), title('Original')
    original = rgb2gray(original);
    % Binaritzar la imatge (queda blanc la flor)
    imMask = segmented;
    imMask(imMask == 1) = 255;
    imMask(imMask ~= 255) = 0;
%     figure, imshow(imMask), title('Mask')

    % Agafar el coloor utilitzant la mascara
    original(imMask == 0) = 0;
%     figure, imshow(original), title('Fusion')

    [pixelCount, grayLevels] = imhist(original, bins);
    pixelCount = pixelCount ./ sum(pixelCount);
    pixelCount(1) = 0;
end

