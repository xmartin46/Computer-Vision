function [w_b, w_f, mu_b, mu_f, var_b, var_f] = CumMeanVar(H)

%Computes cumulative mean and variance of a probability density function
%
%INPUT
%H        :   probability desnity function (histogram)
%
%OUTPUT
%w_b      :   background weight
%w_f      :   foreground weight
%mu_b     :   background means (1 x n array)
%mu_f     :   foreground means (1 x n array)
%sig_b    :   background standard deviations (1 x n array)
%sig_f    :   foreground standard deviations (1 x n array)

    %Get the number of grey levels
    n = length(H);   
    
    %Grey values
    g = (0:n-1)';   
    
    %Weights
    for t = 1:n
        w_b(t) = sum(H(1:t));
        w_f(t) = sum(H((t+1):n));
    end

    %Suppress divide by zero warnings
    previous_state = warning('off', 'MATLAB:divideByZero');
    
    %Cumulative means of background and foreground
    for t = 1:n
        mu_b(t) = sum(g(1:t).*H(1:t))/w_b(t);
        mu_f(t) = sum(g((t+1):n).*H((t+1):n))/w_f(t);    
    end
    
    %Cumulative variances of background and foreground
    for t = 1:n
        var_b(t) = sum(((g(1:t) - mu_b(t)).^2).*H(1:t))/w_b(t);
        var_f(t) = sum(((g((t+1):n) - mu_f(t)).^2).*H((t+1):n))/w_f(t);    
    end

    %Restore warning state
    warning(previous_state);
    
    mu_b(isnan(mu_b)) = 0;
    mu_f(isnan(mu_f)) = 0;
    var_b(isnan(var_b)) = 0;
    var_f(isnan(var_f)) = 0;
    
end

