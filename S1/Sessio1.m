%% SESSIÓ 1
% Adrià Cabeza Sant'Anna, Xavier Martín Ballesteros

%% PART INTRODUCTÒRIA
im = zeros(256);
max(im(:))

%% Visualització de la imatge
im = imread('Floppy.bmp');
% Accés a píxels de la imatge
im(178, 344)
im(178:180, 334:336)

%% 2D
imshow(im), title('Imatge 2D')
impixelinfo
improfile

%% 3D
figure, surf(im), title('Imatge 3D')

%% Imatge aleatòria
b = rand(256);
figure, imshow(b), title('Imatge aleatòria')
b = b * 1000;
figure, imshow(b), title('Imatge aleatòria (valors multiplicats x1000)')
figure, imshow(b, [0 1000]), title('Imatge aleatòria')
figure, imshow(b, []), title('Imatge aleatòria 2')

%% MANIPULACIÓ D'UNA IMATGE
im = imread('flowers.tif');
imshow(im), title('Imatge inicial')

%% Canals RGB
r = im(:, :, 1);
figure, imshow(cat(3, r, zeros(362, 500, 2))), title('Canal Red')
g = im(:, :, 2);
figure, imshow(cat(3, zeros(362, 500, 1), g, zeros(362, 500, 1))), title('Canal Green')
b = im(:, :, 3);
figure, imshow(cat(3, zeros(362, 500, 2), b)), title('Canal Blue')
rgb = cat(3, r, g, b);
figure, imshow(rgb), title('RGB')

%% Imatge amb només il·luminació
gris = r/3+g/3+b/3;
figure, imshow(gris), title('Monocroma')

%% Traient la il·luminació
norm = cat(3, gris, gris, gris);
rgbNorm = double(im)./double(norm);
figure, imshow(rgbNorm), title('Normalització RGB')

%% RGB a HSV
hsv = rgb2hsv(im);
h = hsv(:, :, 1);
sat = hsv(:, :, 2);
v = hsv(:, :, 3);
figure, imshow(h), title('Hue')
figure, imshow(sat), title('Saturació')

%% Traiem il·luminació a HSV
v = ones(size(h));
% Value el que volguem
v = 0.5 * v;
hsv2 = cat(3, h, sat, v);
% Ho hem de passar a RGB per a visualitzar-ho correctament
rgb2 = hsv2rgb(hsv2);
figure, imshow(rgb2), title('HSV normalitzat (il·luminació treta)')