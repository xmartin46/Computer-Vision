function [imageJPG, imagePNG, b] = getImage(code)
    JPG = ['image_', num2str(code, '%04d'), '.jpg'];
    PNG = ['image_', num2str(code, '%04d'), '.png'];
    
    try
        imageJPG = imread(JPG);
        imagePNG = imread(PNG);
        b = 1;
    catch
        imageJPG = 0;
        imagePNG = 0;
        b = 0;
end

