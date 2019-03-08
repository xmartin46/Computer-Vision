function [value] = fib(n)
    if n == 0
        value = 0;
    elseif n == 1
        value = 1;
    else
        value = fib(n - 1) + fib(n - 2);
    end
end