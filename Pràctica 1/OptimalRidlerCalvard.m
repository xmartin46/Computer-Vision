function [Tt] = OptimalRidlerCalvard(im, error)
    [rows, cols] = size(im);

    Tt_1 = min(im);
    all = sum(im(:));
    background = im(1, 1) + im(rows, 1) + im(1, cols) + im(rows, cols);
    uB = double(background/4);
    uO = double((all - background)/((cols * rows) - 4));
    Tt = double((uB + uO)/2);

    while abs(double(Tt) - double(Tt_1)) > error % Tt ~= Tt_1
        O = im(im > Tt_1);
        B = im(im <= Tt_1);

        uB = double(sum(B)/size(B, 1));
        uO = double(sum(O)/size(O, 1));

        Tt = Tt_1;
        Tt_1 = double((uB + uO)/2);
    end
    Tt = Tt/256;
end

