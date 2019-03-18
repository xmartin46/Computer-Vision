function [threshold] = Ptile(im, percentage);
    [rows, cols] = size(im);
    total_pixels = rows * cols;
    
%     freq = zeros(256, 1);

%     for i = 1:256
%         freq(i) = size(im(im == (i - 1)), 1)/total_pixels;
%     end
    
    found = 0;
    f_total = 0;
    i = 1;
    while i <= 256 & ~found
        f_total = f_total + size(im(im == (i - 1)), 1)/total_pixels; % f_totla + freq(i);
        if f_total >= percentage
            threshold = i/256;
            found = 1;
        end
        i = i + 1;
    end
end



