function [ret] = getForma(imageSegmented, N)
    segmented = imageSegmented;
    segmented(segmented == 0) = 255;
    segmented(segmented == 1) = 255;

    ee = strel('disk', 1);
    dil = imdilate(segmented, ee);
    new = imsubtract(double(dil), double(segmented));

    [fila, col] = find(new, 1);
    B = bwtraceboundary(new, [fila, col], 'E');
    
    cdm = mean(B);
    Bc(:, 1) = B(:, 1) - cdm(1);
    Bc(:, 2) = B(:, 2) - cdm(2);
    s = Bc(:, 1) + i * Bc(:, 2);
    s(end+1) = s(end);
    z = fft(s);

    tmp = z;
    tmp(N+1:end-N) = 0;
    
    ret = cat(2, real(tmp(1:N)), real(tmp(end-N+1:end)));
    
%     s2 = ifft(tmp);
%     files = round(real(s2) + cdm(1));
%     cols = round(imag(s2) + cdm(2));
%     aux = zeros(size(new));
%     aux(sub2ind(size(aux), files, cols)) = 1;
end

