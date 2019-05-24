function [features] = getFeatures(color, segmented)
    % Treure la il�luminaci�
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
    % Relaci� BoundingBox amb Centroid
    [x, y] = boundingBox(segmented);
    
    % Light a and b color dimensions
    lab = rgb2lab(color);
    lab1 = reshape(lab(:,:,1), 1,[]);
    lab2 = reshape(lab(:,:,2),1,[]);
    lab3 = reshape(lab(:,:,3),1,[]);
    
    features = cat(2, petals, C, h1); %lab1,lab2,lab3);
end

