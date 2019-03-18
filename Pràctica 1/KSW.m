function [threshold] = KSW(im)
% [h, ~] = imhist(img);
% h = h/sum(h); % Normalize the histogram so that it sums to 1.
% entropies = zeros(256, 1); % Intialize array for storing entropies.
% for t = 1:254
%     White = h(1:t);
%     Black = h(t+1:255);
%     % Add 0.001 to prevent division by zero(nan) and log of zero(-inf).
%     HB =  sum((Black/(0.001+sum(Black))).*log((Black+0.001)/(0.001 +sum(Black))));
%     HW =  sum((White/(0.001+sum(White))).*log((White+0.001)/(0.001 +sum(White))));
%     entropies(t) = HB+HW; 
% end
% [~, T] = max(abs(entropies)); % The Maximal entropy determines the threshold.
% threshold = (T - 1)/256;
% A = img > T;
% end

    [rows, cols] = size(im);
    H_max = -Inf;
    total_pixels = rows * cols;
    percentages = zeros(256, 1);
    B = 0;
    for i = 1:256
        percentages(i) = size(im(im == (i - 1)), 1)/total_pixels;
    end

    for t = 1:256
        Hb = 0;
        Hw = 0;
        B = B + percentages(t); 
        
        for i = 1:t
            Pi = percentages(i);
            Hb = Hb - double((Pi/(0.001 + B) * log((0.001 + Pi)/(0.001 + B))));
        end
        
        for j = (t + 1):256
            Pj = percentages(j);
            Hw = Hw - double(((Pj/(1 - B + 0.001)) * log((0.001 + Pj)/(1 - B + 0.001))));
        end

        H = Hb + Hw;
        if H_max <= H
            H_max = H;
            Tt = t;
        end
    end
    threshold = Tt/256;
    %threshold = 1 - threshold; %podria ser que fos així???
end
% % %     [rows, cols] = size(im);
% % %     H_max = -Inf;
% % %     Tt = 0; % min(im);
% % %     total_pixels = rows * cols;
% % %     percentages = double(zeros(256, 1));
% % %     B = 0;
% % %     for i = 1:256
% % %         percentages(i) = size(im(im == (i - 1)), 1)/total_pixels;
% % %     end
% % % 
% % %     for t = 1:256
% % %         Ps = 0;
% % % 
% % %         B = B + percentages(t);
% % %         if B ~= 0
% % %             for i = 1:t
% % %                 Ps = Ps + percentages(i);
% % % %                 if Pi ~= 0
% % % %                     Ps = Ps + double((Pi/B * log(Pi/B)));
% % % %                 end
% % %             end
% % % 
% % %             H = -Ps * log(Ps) - (1 - Ps) * log(1 - Ps);
% % %             if H_max <= H
% % %                 H_max = H;
% % %                 Tt = t;
% % %             end
% % %         end
% % %     end
% % %     threshold = Tt/256;


% % % % % % %     n = length(H);
% % % % % % %       
% % % % % % %     %Grey values
% % % % % % %     g = (0:n-1)';
% % % % % % %     
% % % % % % %     [w_b, w_f, mu_b, mu_f, var_b, var_f] = CumMeanVar(H);
% % % % % % %     
% % % % % % %     %Compute foreground and background entropy
% % % % % % %     E_b = zeros(1,n);
% % % % % % %     E_f = zeros(1,n);
% % % % % % %     for i = 1:n
% % % % % % %         
% % % % % % %         H_b = [H(1:i); zeros(1,n-1)'];
% % % % % % %         H_f = [zeros(1,i)'; H((i+1):n)];
% % % % % % %         
% % % % % % %         if w_b(i) ~= 0
% % % % % % %             H_b = H/w_b(i);
% % % % % % %         end
% % % % % % %         if w_f(i) ~= 0
% % % % % % %             H_f = H/w_f(i);
% % % % % % %         end
% % % % % % %         
% % % % % % %         for j = 1:n
% % % % % % %             if H_b(j) ~= 0
% % % % % % %                 E_b(i) = E_b(i) + H_b(j).* (-log2(H_b(j)));
% % % % % % %             end
% % % % % % %         end
% % % % % % %         for j = 1:n
% % % % % % %             if H_f(j) ~= 0
% % % % % % %                 E_f(i) = E_f(i) + H_f(j).* (-log2(H_f(j)));
% % % % % % %             end
% % % % % % %         end
% % % % % % %     end
% % % % % % %     
% % % % % % %     [maxVal, indices] = max(E_b + E_f);
% % % % % % %     threshold = g(indices(1));
% % % % % % %     
