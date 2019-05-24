function [h1] = histo3D(image,nbins)
    h1 = zeros(nbins, nbins, nbins);
    [rows, cols, ~] = size(image);
    for i = 1:rows
        for j = 1:cols
            x = floor(double(image(i,j,1))/nbins) + 1;
            y = floor(double(image(i,j,2))/nbins) + 1;
            z = floor(double(image(i,j,3))/nbins) + 1;
            h1(x,y,z) = h1(x,y,z)+1;
        end
    end
    h1 = h1./(rows*cols);
end
