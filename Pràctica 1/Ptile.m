function [threshold] = Ptile(im, percentage)
    [rows, cols] = size(im);
    total_pixels = rows * cols;
    px = 0;
    t = 1;
    found = 0;
    Tt = 0;
    while t <= 256 & ~found
        px = px + size(im(im == (t - 1)), 1);

        if px/total_pixels >= (1 - percentage)
            found = 1;
            Tt = t + 1;
        end
        t = t + 1;
    end
    threshold = Tt/256;
end



