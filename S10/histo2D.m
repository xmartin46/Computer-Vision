function [h1] = histo2D(image,nbins)
    h1 = zeros(nbins);
    [rows cols ~] = size(image);
    for i = 1:rows
        for j = 1:cols
            x = floor(double(image(i,j,1))/nbins) + 1;
            y = floor(double(image(i,j,2))/nbins) + 1;
            h1(x,y) = h1(x,y)+1;
        end
    end
    h1 = h1./(rows*cols);
end

