function [cluster_color, cluster_ratio, cluster_labels] = ...
    image2palette(nCluster, image, plotOption)
% Usage example: [c] = image2palette( 5, 'football.jpg' );
% 
% hiobeen.han@kaist.ac.kr, 2018-11-27.
% tested on MATLAB 9.5.0.944444 (R2018b)
% dependence: Image Processing Toolbox (v10.3)
if nargin<1, nCluster = 4; end
if nargin<2, [fname,path]=uigetfile('*.*');imgfullpath = [ path '\' fname ];end
if nargin<3, plotOption = false; end
%% (0) Configure options
resizeOption = false; sz = [200 200]; % size to resize
saveOption = true; % either [true] or [false]
fontsize = 11;
%% (1) Load image file
img = rgb2lab(image);
img = single(img);
if resizeOption, img=imresize(img, sz, 'bicubic'); end
L = img(:,:,1); L = L(:);
a = img(:,:,2); a = a(:);
b = img(:,:,3); b = b(:);
%% (2) Visualize image
if plotOption
    figure(1);
    subplot(2,2,1);
    imshow( lab2rgb( img ) );
    if ~resizeOption, title(['Source image'])
    else title(['Source image (resized, ' num2str(sz(1)) 'x' num2str(sz(2)) ')']); end
    set(gca, 'LineWidth', 2, 'Box', 'off', 'FontSize', fontsize);
    xlabel('Hi'); set(gca, 'XTick', []);
end
%% (3) Parse and visualize LAB values
img_parse = [];
img_parse(1,:) = L(:);
img_parse(2,:) = a(:);
img_parse(3,:) = b(:);
%% (4) K-means Clustering
% K-means clustering
[G] = kmeans( img_parse', nCluster,'distance','sqEuclidean', 'start','sample' );
% Calc percentage to rank
p = [];
for clusterIdx = 1:nCluster
    p(clusterIdx) = 100*length(find(G==clusterIdx)) / length(G);
end
[~,order]=sortrows(p'); order=order(end:-1:1);
% disp(['K-means clustering for image [ Hi ]'])
% Variables to return
cluster_color = []; 
cluster_ratio = [];
cluster_labels = {};
% Palette visualization
for clusterIdx = 1:nCluster
    
    % Cluster with smaller L value first
    id = find(G==order(clusterIdx));
    LAB = [ img_parse(:, id) ];
    mean_LAB = reshape( nanmean(LAB,2)', [1, 1, 3]);
    [color_label,errors] = rgb2label(255*lab2rgb(mean(LAB,2)'));
    
    % Append data
    cluster_color( clusterIdx, : ) = nanmean(LAB,2);
    cluster_ratio( clusterIdx ) = p(order(clusterIdx));
    cluster_labels{ clusterIdx } = color_label;
    
    if plotOption
        subplot(2,nCluster,nCluster+clusterIdx);
        imshow( lab2rgb( mean_LAB ) ); set(gca ,'XTick', [], 'YTick', []);
        title(['C_{' num2str(clusterIdx) '} (' num2str(round(100*p(order(clusterIdx))/100)) ' %)' ]);
        xlabel(color_label);
        ylabel(rgb2hex(lab2rgb(mean(LAB,2)')));
        set(gca, 'LineWidth', 2, 'Box', 'off', 'FontSize', fontsize);
        drawnow;
    end
end
% 3D scatter plot visuazliation
if plotOption
    subplot(2, 2, 2); hold off
    for clusterIdx = 1:nCluster
        id = find(G==clusterIdx);
        LAB = [ img_parse(:, id) ];
        mean_LAB = reshape( mean(LAB,2)', [1, 1, 3]);
        
        sc=scatter3(img_parse(1,id), img_parse(2,id), img_parse(3,id),'Marker','.');
        sc.MarkerEdgeColor = lab2rgb( mean_LAB );
        hold on
        xlim([0 100]);
        set(gca, 'LineWidth', 2, 'Box', 'off', 'FontSize', fontsize);
        drawnow;
    end
    view([-30 30])
    hold off
    xlabel('L'), ylabel('a'), zlabel('b');
    set(gca, 'LineWidth', 2, 'Box', 'off', 'FontSize', fontsize);
    grid on;
    axis vis3d;
    title(['PIxel color distribution'])
end
% Export figure?
if plotOption && saveOption
    saveas(gcf, ['output_nCluster_' num2str(nCluster) '.png'] );
end
%% (5) Text display of results
% for clusterIdx = 1:nCluster
%     lab = cluster_color(clusterIdx,:);
%     ratio = cluster_ratio( clusterIdx );
%     label = cluster_labels{clusterIdx};
%     
%     disp(['#' num2str(clusterIdx) ' Lab = [ '...
%         num2str(round(100*(lab(1))/100)) ',' ...
%         num2str(round(100*(lab(2))/100)) ',' ...
%         num2str(round(100*(lab(3))/100))  ' ], ' ...
%         label ', ' num2str(round(100*(ratio)/100)) '%' ])
% end
end
%% Subfunctions
function [matching_label, min_error] = rgb2label( input )
% input should be RGB (0~255)
% Written by Hio-Been Han, hiobeen.han@kaist.ac.kr, 2018-11-28
% Color label reference: https://en.wikipedia.org/wiki/Web_colors (2018-11-28)
if size(input,1)>size(input,2) input=input'; end
[rgb, labels] = get_color_list();
input_rep = repmat( input, [size(rgb,1), 1]);
[min_error,matchIdx] = min( mean([input_rep-rgb].^2, 2) );
matching_label = labels{ matchIdx };
if min_error > 1000, matching_label= [matching_label ' (?)']; end
end
function [rgb, labels] = get_color_list()
labels = {...
    'Pink',
    'LightPink',
    'HotPink',
    'DeepPink',
    'PaleVioletRed',
    'MediumVioletRed',
    'LightSalmon',
    'Salmon',
    'DarkSalmon',
    'LightCoral',
    'IndianRed',
    'Crimson',
    'Firebrick',
    'DarkRed',
    'Red',
    'OrangeRed',
    'Tomato',
    'Coral',
    'DarkOrange',
    'Orange',
    'Yellow',
    'LightYellow',
    'LemonChiffon',
    'LightGoldenrodYellow',
    'PapayaWhip',
    'Moccasin',
    'PeachPuff',
    'PaleGoldenrod',
    'Khaki',
    'DarkKhaki',
    'Gold',
    'Cornsilk',
    'BlanchedAlmond',
    'Bisque',
    'NavajoWhite',
    'Wheat',
    'Burlywood',
    'Tan',
    'RosyBrown',
    'SandyBrown',
    'Goldenrod',
    'DarkGoldenrod',
    'Peru',
    'Chocolate',
    'SaddleBrown',
    'Sienna',
    'Brown',
    'Maroon',
    'DarkOliveGreen',
    'Olive',
    'OliveDrab',
    'YellowGreen',
    'LimeGreen',
    'Lime',
    'LawnGreen',
    'Chartreuse',
    'GreenYellow',
    'SpringGreen',
    'MediumSpringGreen',
    'LightGreen',
    'PaleGreen',
    'DarkSeaGreen',
    'MediumAquamarine',
    'MediumSeaGreen',
    'SeaGreen',
    'ForestGreen',
    'Green',
    'DarkGreen',
    'Aqua',
    'Cyan',
    'LightCyan',
    'PaleTurquoise',
    'Aquamarine',
    'Turquoise',
    'MediumTurquoise',
    'DarkTurquoise',
    'LightSeaGreen',
    'CadetBlue',
    'DarkCyan',
    'Teal',
    'LightSteelBlue',
    'PowderBlue',
    'LightBlue',
    'SkyBlue',
    'LightSkyBlue',
    'DeepSkyBlue',
    'DodgerBlue',
    'CornflowerBlue',
    'SteelBlue',
    'RoyalBlue',
    'Blue',
    'MediumBlue',
    'DarkBlue',
    'Navy',
    'MidnightBlue',
    'Lavender',
    'Thistle',
    'Plum',
    'Violet',
    'Orchid',
    'Fuchsia',
    'Magenta',
    'MediumOrchid',
    'MediumPurple',
    'BlueViolet',
    'DarkViolet',
    'DarkOrchid',
    'DarkMagenta',
    'Purple',
    'Indigo',
    'DarkSlateBlue',
    'SlateBlue',
    'MediumSlateBlue',
    'White',
    'Snow',
    'Honeydew',
    'MintCream',
    'Azure',
    'AliceBlue',
    'GhostWhite',
    'WhiteSmoke',
    'Seashell',
    'Beige',
    'OldLace',
    'FloralWhite',
    'Ivory',
    'AntiqueWhite',
    'Linen',
    'LavenderBlush',
    'MistyRose',
    'Gainsboro',
    'LightGray',
    'Silver',
    'DarkGray',
    'Gray',
    'DimGray',
    'LightSlateGray',
    'SlateGray',
    'DarkSlateGray',
    'Black'
    };
rgb = [255	192	203
    255	182	193
    255	105	180
    255	20	147
    219	112	147
    199	21	133
    255	160	122
    250	128	114
    233	150	122
    240	128	128
    205	92	92
    220	20	60
    178	34	34
    139	0	0
    255	0	0
    255	69	0
    255	99	71
    255	127	80
    255	140	0
    255	165	0
    255	255	0
    255	255	224
    255	250	205
    250	250	210
    255	239	213
    255	228	181
    255	218	185
    238	232	170
    240	230	140
    189	183	107
    255	215	0
    255	248	220
    255	235	205
    255	228	196
    255	222	173
    245	222	179
    222	184	135
    210	180	140
    188	143	143
    244	164	96
    218	165	32
    184	134	11
    205	133	63
    210	105	30
    139	69	19
    160	82	45
    165	42	42
    128	0	0
    85	107	47
    128	128	0
    107	142	35
    154	205	50
    50	205	50
    0	255	0
    124	252	0
    127	255	0
    173	255	47
    0	255	127
    0	250	154
    144	238	144
    152	251	152
    143	188	143
    102	205	170
    60	179	113
    46	139	87
    34	139	34
    0	128	0
    0	100	0
    0	255	255
    0	255	255
    224	255	255
    175	238	238
    127	255	212
    64	224	208
    72	209	204
    0	206	209
    32	178	170
    95	158	160
    0	139	139
    0	128	128
    176	196	222
    176	224	230
    173	216	230
    135	206	235
    135	206	250
    0	191	255
    30	144	255
    100	149	237
    70	130	180
    65	105	225
    0	0	255
    0	0	205
    0	0	139
    0	0	128
    25	25	112
    230	230	250
    216	191	216
    221	160	221
    238	130	238
    218	112	214
    255	0	255
    255	0	255
    186	85	211
    147	112	219
    138	43	226
    148	0	211
    153	50	204
    139	0	139
    128	0	128
    75	0	130
    72	61	139
    106	90	205
    123	104	238
    255	255	255
    255	250	250
    240	255	240
    245	255	250
    240	255	255
    240	248	255
    248	248	255
    245	245	245
    255	245	238
    245	245	220
    253	245	230
    255	250	240
    255	255	240
    250	235	215
    250	240	230
    255	240	245
    255	228	225
    220	220	220
    211	211	211
    192	192	193
    169	169	169
    128	128	128
    105	105	105
    119	136	153
    112	128	144
    47	79	79
    0	0	0
    ];
end
function [ hex ] = rgb2hex(rgb)
% rgb2hex converts rgb color values to hex color format.
%
% This function assumes rgb values are in [r g b] format on the 0 to 1
% scale.  If, however, any value r, g, or b exceed 1, the function assumes
% [r g b] are scaled between 0 and 255.
%
% * * * * * * * * * * * * * * * * * * * *
% SYNTAX:
% hex = rgb2hex(rgb) returns the hexadecimal color value of the n x 3 rgb
%                    values. rgb can be an array.
%
% * * * * * * * * * * * * * * * * * * * *
% EXAMPLES:
%
% myhexvalue = rgb2hex([0 1 0])
%    = #00FF00
%
% myhexvalue = rgb2hex([0 255 0])
%    = #00FF00
%
% myrgbvalues = [.2 .3 .4;
%                .5 .6 .7;
%                .8 .6 .2;
%                .2 .2 .9];
% myhexvalues = rgb2hex(myrgbvalues)
%    = #334D66
%      #8099B3
%      #CC9933
%      #3333E6
%
% * * * * * * * * * * * * * * * * * * * *
% Chad A. Greene, April 2014
%
% Updated August 2014: Functionality remains exactly the same, but it's a
% little more efficient and more robust. Thanks to Stephen Cobeldick for
% his suggestions.
%
% * * * * * * * * * * * * * * * * * * * *
% See also hex2rgb, dec2hex, hex2num, and ColorSpec.
%% Check inputs:
assert(nargin==1,'This function requires an RGB input.')
assert(isnumeric(rgb)==1,'Function input must be numeric.')
sizergb = size(rgb);
assert(sizergb(2)==3,'rgb value must have three components in the form [r g b].')
assert(max(rgb(:))<=255& min(rgb(:))>=0,'rgb values must be on a scale of 0 to 1 or 0 to 255')
%% If no value in RGB exceeds unity, scale from 0 to 255:
if max(rgb(:))<=1
    rgb = round(rgb*255);
else
    rgb = round(rgb);
end
%% Convert (Thanks to Stephen Cobeldick for this clever, efficient solution):
hex(:,2:7) = reshape(sprintf('%02X',rgb.'),6,[]).';
hex(:,1) = '#';
end