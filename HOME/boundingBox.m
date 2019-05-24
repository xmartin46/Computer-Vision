function [posX, posY] = boundingBox(imageSegmented) 
    segmented = imageSegmented == 1;
    [~, x1] =  find(segmented, 1, 'first');
    [~, y1] =  find(segmented', 1, 'first');
    [~, x2] =  find(segmented, 1, 'last');
    [~, y2] =  find(segmented', 1, 'last');
    
    s = regionprops(segmented,'centroid');
    centroids = cat(1,s.Centroid);
    x = centroids(1, 1);
    y = centroids(1, 2);
    
    posX = (x - x1)/(x2 - x1);
    posY = (y - y1)/(y2 - y1);
end

