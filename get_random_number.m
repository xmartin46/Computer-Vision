function [num] = get_random_number(min,max)
    num = ceil((max-min).*rand(1) + min);
end

