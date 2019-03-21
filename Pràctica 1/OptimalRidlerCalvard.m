function [threshold] = OptimalRidlerCalvard(im, error)
    [rows, cols] = size(im);

    % Actual threshold value
    T_act = min(im);
    
    % Initial background pixels (4 corners of the image)
    background_initial_pixels = im(1, 1) + im(rows, 1) + im(1, cols) + im(rows, cols);
    uB = double(background_initial_pixels/4);
    
    % Initial object pixels (all except from the 4 corners of the image)
    all = sum(im(:));
    uO = double((all - background_initial_pixels)/((cols * rows) - 4));
    
    % Next threshold value
    T_next = double((uB + uO)/2);

    while abs(double(T_next) - double(T_act)) > error % |T_next - T_act| > error
        O = im(im > T_act);
        B = im(im <= T_act);

        uB = double(sum(B)/size(B, 1));
        uO = double(sum(O)/size(O, 1));

        T_next = T_act;
        T_act = double((uB + uO)/2);
    end
    threshold = T_next/256;
end