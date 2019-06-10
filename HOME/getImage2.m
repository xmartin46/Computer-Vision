function [imageJPG, imagePNG, b] = getImage2(code)
    JPG = ['image_', num2str(code, '%04d'), '.jpg'];
      
    try
        imageJPG = imread(JPG);
        imagePNG = segment(imageJPG);
        b = 1;
    catch
        imageJPG = 0;
        imagePNG = 0;
        b = 0;
end

