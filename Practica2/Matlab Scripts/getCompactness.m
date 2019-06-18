function [compactness] = getCompactness(segmentedImage)
    BW = segmentedImage;
    BW(BW == 0) = 255;
    BW(BW == 1) = 255;
    BW(BW ~= 255) = 0;
    BW = bwlabel(BW, 4);
%     figure, imshow(BW), title('Binaritzada')
    dades = regionprops(~BW, 'Area');

    % Get the contourn
    ero = imerode(BW, strel('disk', 1));
    cont = imsubtract(BW, ero);
%     figure, imshow(cont), title('Contorn')

    perimetre = sum(cont(:));
    area = dades.Area;
    C = perimetre * perimetre/area;
    compactness = C/(4 * pi);
end

