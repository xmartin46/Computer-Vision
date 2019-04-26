function [patch] = patch_aleatori(image, sX, sY)
    [files cols ~] = size(image);
    X = get_random_number(1, files - sX);
    Y = get_random_number(1, cols - sY);
    
    patch = image(X:(X+sX), Y:(Y+sY), :);
end

