function [ret] = getForma(imageSegmented, N)
    segmented = imageSegmented;
    segmented(segmented == 0) = 255;
    segmented(segmented == 1) = 255;
%      segmented = imfill(segmented,'holes');
    
    ee = strel('disk', 1);
    dil = imdilate(segmented, ee);
    new = imsubtract(dil, segmented);

    [fila, col] = find(new, 1);
    B = bwtraceboundary(new, [fila, col], 'E');
    
    cdm = mean(B);
    Bc(:, 1) = B(:, 1) - cdm(1);
    Bc(:, 2) = B(:, 2) - cdm(2);
    s = Bc(:, 1) + i * Bc(:, 2);
    s(end+1) = s(end);
    z = fft(s);
%     tmp = z;
%     tmp(N+1:end-N) = 0;
    [rows, cols] = size(z);
    aux = zeros(N, cols);
    aux(1:rows, cols) = z;
    [rows, cols] = size(z);
    ret = cat(2, real(aux(1:N)), real(aux(end-N+1:end)));
    
%     s2 = ifft(tmp);
%     files = round(real(s2) + cdm(1));
%     cols = round(imag(s2) + cdm(2));
%     aux = zeros(size(new));
%     aux(sub2ind(size(aux), files, cols)) = 1;
end

