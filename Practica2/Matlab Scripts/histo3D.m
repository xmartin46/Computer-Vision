function [cluster_color, cluster_ratio, cluster_labels] = histo3D(color, segmented)
%     h1 = zeros(nbins);
%     [rows, cols, ~] = size(image);
    
    seg3 = cat(3, segmented, segmented, segmented);
    color(seg3 ~= 1) = 0;

    nCluster = 4;
    [cluster_color, cluster_ratio, cluster_labels] = image2palette( nCluster, color );
    
    
    
    
% % % % %     image = image(image > 0);
% % % %     im_r = double(image(:, :, 1));
% % % %     hr = hist(im_r(im_r > 0), nbins);
% % % %     
% % % %     im_g = double(image(:, :, 2));
% % % %     hg = hist(im_g(im_g > 0), nbins);
% % % %     
% % % %     im_b = double(image(:, :, 3));
% % % %     hb = hist(im_b(im_b > 0), nbins);
% % % %     
% % % % %     for i = 1:rows
% % % % %         for j = 1:cols
% % % % %             x = floor(double(image(i,j,1))/nbins) + 1;
% % % % %             y = floor(double(image(i,j,2))/nbins) + 1;
% % % % %             z = floor(double(image(i,j,3))/nbins) + 1;
% % % % %             h1(x,y,z) = h1(x,y,z)+1;
% % % % %         end
% % % % %     end
% % % % %     h1 = h1./(rows*cols);
end
