function [imageJPG, imagePNG] = getImage(code)
    JPG = ['image_', num2str(code, '%04d'), '.jpg'];
    PNG = ['image_', num2str(code, '%04d'), '.png'];
    
    imageJPG = imread(JPG);
    imagePNG = imread(PNG);
end

