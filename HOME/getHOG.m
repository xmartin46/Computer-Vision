function [feature, HOGV] = getHOG(segmented)
    segmented = imresize(segmented, [500, 500]);

    ee = strel('disk', 1);
    dil = imdilate(segmented, ee);
    sub = imsubtract(double(dil), double(segmented));

    [feature, HOGV] = extractHOGFeatures(sub);
end

