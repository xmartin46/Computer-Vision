function [features] = getFeatures(color, segmented)
    % Treure la il·luminació
    rgb = NormalitzaRGB(color);
    gris = rgb(:, :, 1)/3 + rgb(:, :, 2)/3 + rgb(:, :, 3)/3;
    norm = cat(3, gris, gris, gris);
    rgbNorm = double(color)./(double(norm) + 0.001);

    % Histograma del color
    h1 = histo3D(rgbNorm, 16);
    h1 = imgaussfilt3(h1, 1.5);
    h1 = reshape(h1,1,[]);
    % Compactness
    C = getCompactness(segmented);
    
    % #Petals
    petals = getNumberPetals(segmented);
    
    % Fourier
    fourier = getForma(segmented, 5);
    fourier = reshape(fourier.',1,[]);
    % Relació BoundingBox amb Centroid
    [x, y] = boundingBox(segmented);
    
    features = cat(2, h1);
end

