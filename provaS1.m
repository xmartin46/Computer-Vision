%-- 15/02/2019 10:18 --%
%% Getting started
% Manipulacio basica d'imatges
im = zeros(256);
max(im(:))
% Displayo el floppy
im = imread('Floppy.bmp');
im(178, 344)
im(178:280, 334:336)
im(178:180, 334:336)
imshow(im)
impixelinfo
imshow(im)
impixelinfo
improfile
figure, surf(im)
b = rand(256);
imshow(b)
b = b * 1000;
imshow(b)
figure, imshow(b, [0 1000])
figure, imshow(b, [0 1000]), title('imatge aleatòria')
figure, imshow(b, []), title('imatge aleatòria 2')