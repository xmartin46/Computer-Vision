function [threshold] = Ptile(im, percentage);
    [pixelPerValueArray, ~] = imhist(im);
    percentages = pixelPerValueArray/sum(pixelPerValueArray);
    
    % Boolean
    found = 0;

    accumulated_percentage = 0;
    t = 1;
    while t <= 256 & ~found
        % percentages(1:t)
        accumulated_percentage = accumulated_percentage + percentages(t);
        
        if accumulated_percentage >= percentage
            threshold = t/256;
            found = 1;
        end
        t = t + 1;
    end
end



