function [imageJPG, imagePNG, b] = getImage(code)
    %code
    JPG = [code, '.jpg'];
    PNG = [code, '.png'];
    
    try
        imageJPG = imread(JPG);
        imagePNG = imread(PNG);
        b = 1;
    catch
        imageJPG = imread(JPG);
        imagePNG = segment(imageJPG);
        imagePNG = bwlabel(imagePNG);
        b = 0;
end

