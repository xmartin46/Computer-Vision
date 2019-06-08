function [threshold] = KSW(im)
    [pixelPerValueArray, ~] = imhist(im);
    percentages = pixelPerValueArray/sum(pixelPerValueArray);

    H_max = -Inf;
    
    for t = 1:256
        Background = percentages(1:t);
        Foreground = percentages((t + 1):256);
        
        % We add 0.000001 to avoid NaN (division by 0) and -Inf (log(0)) errors
        % Log is the natural logarithm
        % Matricial operations
        Hb = sum((Background/(0.000001 + sum(Background))) .* log((Background + 0.000001)/(0.000001 + sum(Background))));
        Hf = sum((Foreground/(0.000001 + sum(Foreground))) .* log((Foreground + 0.000001)/(0.000001 + sum(Foreground))));
        
        % Compute the entropy value
        H_act = -Hb - Hf;
        
        if H_max <= H_act
            H_max = H_act;
            threshold = t;
        end
    end
    
    threshold = threshold/256;
end