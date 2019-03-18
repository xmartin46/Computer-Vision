function [threshold] = KSW(im)
    [rows, cols] = size(im);
    H_max = -Inf;
    Tt = 0; % min(im);
    total_pixels = rows * cols;
    percentages = double(zeros(1, 256));
    B = 0;
    for i = 1:256
        percentages(i) = size(im(im == (i - 1)), 1)/total_pixels;
    end

    for t = 1:256
        Hb = 0;
        Hw = 0;
%         Pt = 0;
%         for i = 1:t
%             Pt = Pt + percentages(i);
%         end
        B = B + percentages(t); %PQ AIXÒ? mira el url que he posat 
        if B ~= 0
            for i = 1:t
                Pi = percentages(i);
                if Pi ~= 0
                    Hb = Hb - double((Pi/B * log(Pi/B)));
                end
            end

            for j = (t + 1):256
                Pj = percentages(j);
                if Pj ~= 0
                    Hw = Hw - double(((Pj/(1 - B)) * log(Pj/(1 - B))));
                end
            end

            H = double(Hb + Hw);
            if H_max <= H
                H_max = H;
                Tt = t;
            end
        end
    end
    threshold = Tt/256;
    %threshold = 1 - threshold; %podria ser que fos així???
end

