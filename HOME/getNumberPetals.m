function [numberPetals] = getNumberPetals(imageSegmented)
    segmented = imageSegmented;
    segmented(segmented == 1) = 255;
    segmented(segmented ~= 255) = 0;

    skeleton = bwmorph(segmented, 'skel', inf);
    ee = strel('disk', 4);
    new = imerode(segmented, ee);
    new(skeleton == 1) = 0;

    petals = bwlabel(new, 4);
    numberPetals = max(petals(:));
end

