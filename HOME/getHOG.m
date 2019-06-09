% function [feature, HOGV] = getHOG(segmented)
%     segmented = segmented == 1;
%     segmented = imresize(segmented, [1000, 1000]);
%     segmented = imfill(segmented,'holes');
% 
%     ee = strel('disk', 1);
%     dil = imdilate(segmented, ee);
%     sub = imsubtract(dil, segmented);
% 
%     [feature, HOGV] = extractHOGFeatures(sub);
% end

function [hist] = getHog(segmented, bins)
    segmented(segmented == 0) = 255;
    segmented(segmented == 1) = 255;
    
    ee = strel('disk', 1);
    dil = imdilate(segmented, ee);
    new = imsubtract(dil, segmented);

    sob = fspecial("sobel");
    soby = sob/4;
    sobx = soby';
    
    grady = imfilter(double(new), soby, 'conv');
    gradx = imfilter(double(new), sobx, 'conv');
    
    arg = atan2(grady, gradx);
    
    neg = (arg < 0);
    arg(neg) = arg(neg) + 2*pi;

    angle = uint8((arg+pi)/2/pi*254);
    angle = angle/bins;
    
    mod = sqrt(gradx.^2+grady.^2);
    mask = (mod==0);
    angle(mask) = 255;
    h = imhist(angle);
    % El while és innecessari. No modifica cap valor de l'histograma.
    % L'utilitzem perquè quedi un histograma més bonic (no apareguin els 0s
    % inicials).
    j = 1;
    while h(j) == 0
        j = j + 1;
    end
    
    hog = h(j:end/bins-1);
    hog = hog/sum(hog);
    hist = hog;
end