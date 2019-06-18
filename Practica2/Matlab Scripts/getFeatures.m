function [features] = getFeatures(color, segmented)
    % Treure la il�luminaci�
    rgb = NormalitzaRGB(color);
    gris = rgb(:, :, 1)/3 + rgb(:, :, 2)/3 + rgb(:, :, 3)/3;
    norm = cat(3, gris, gris, gris);
    rgbNorm = double(color)./(double(norm) + 0.001);

    % Histograma del color
%     [hr hg hb] = histo3D(rgbNorm, segmented, 16);
%     hr = imgaussfilt3(hr, 1.5);
%     hg = imgaussfilt3(hg, 1.5);
%     hb = imgaussfilt3(hb, 1.5);

    [cluster_color, cluster_ratio, ~] = histo3D(rgbNorm, segmented);
    cluster_color = reshape(cluster_color.', 1, []);
    ratios = cluster_ratio(2:end);
    ratios = ratios ./ sum(ratios(:));
    
    % Compactness
    C = getCompactness(segmented);
    
    % #Petals
    petals = getNumberPetals(segmented);
    
    % Fourier
    fourier = getForma(segmented, 6);
    fourier = reshape(fourier.',1,[]);
    % Relacio BoundingBox amb Centroid
    [x, y] = boundingBox(segmented);
    
    % Light a and b color dimensions
    %lab = rgb2lab(color);
    %lab1 = reshape(lab(:,:,1), 1,[]);
    %lab2 = reshape(lab(:,:,2),1,[]);
    %lab3 = reshape(lab(:,:,3),1,[]);

    hist = getHOG(segmented, 16);
    hist = reshape(hist.', 1, []);

    features = cat(2, cluster_color, ratios, fourier, C, petals, x, y, hist); %lab1,lab2,lab3);
end

