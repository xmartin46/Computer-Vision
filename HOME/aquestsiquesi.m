% 12 flors
[color, segmented] = getImage('1121');
featuresBotodOr1 = getFeatures(color, segmented);
[color, segmented] = getImage('1122');
featuresBotodOr2 = getFeatures(color, segmented);
[color, segmented] = getImage('1123');
featuresBotodOr3 = getFeatures(color, segmented);

[color, segmented] = getImage('1201');
featuresBuixol1 = getFeatures(color, segmented);
[color, segmented] = getImage('1202');
featuresBuixol2 = getFeatures(color, segmented);
[color, segmented] = getImage('1203');
featuresBuixol3 = getFeatures(color, segmented);

[color, segmented] = getImage('0322');
featuresCrocus1 = getFeatures(color, segmented);
[color, segmented] = getImage('0323');
featuresCrocus2 = getFeatures(color, segmented);
[color, segmented] = getImage('0324');
featuresCrocus3 = getFeatures(color, segmented);


featuresFlowers = [featuresBotodOr1;
                   featuresBotodOr2;
                   featuresBotodOr3;
                   featuresBuixol1;
                   featuresBuixol2;
                   featuresBuixol3;
                   featuresCrocus1;
                   featuresCrocus2;
                   featuresCrocus3
                   ];
               
labelVector = [{'a'};
               {'a'};
               {'a'};
               {'b'};
               {'b'};
               {'b'};
               {'c'};
               {'c'};
               {'c'}];

classifier = fitctree(featuresFlowers, labelVector, 'MinLeafSize',2);




























% [color, segmented] = getImage('0961');
% featuresDentdeLleo = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0081');
% featuresFadrins = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0641');
% featuresFritillaria = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0801');
% featuresGerbera = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0721');
% featuresGirasol = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0481');
% featuresHemerocallis = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0401');
% featuresLliri = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('0001');
% featuresNarcis = getFeatures(color, segmented);
% 
% [color, segmented] = getImage('1281');
% featuresViola = getFeatures(color, segmented);
% 
% 
% featuresFlowers = [featuresBotodOr;
%                    featuresBuixol;
%                    featuresCrocus;
%                    featuresDentdeLleo;
%                    featuresFadrins;
%                    featuresFritillaria;
%                    featuresGerbera;
%                    featuresGirasol;
%                    featuresHemerocallis;
%                    featuresLliri;
%                    featuresNarcis;
%                    featuresViola
%                    ];
%                
% labelVector = {'BotodOr';
%                'Buixol';
%                'Crocus';
%                'DentdeLleo';
%                'Fadrins';
%                'Fritillaria';
%                'Gerbera';
%                'Girasol';
%                'Hemerocallis';
%                'Lliri';
%                'Narcis';
%                'Viola'};
% 
% classifier = fitctree(featuresFlowers, labelVector);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% IMFILL per les imatges amb insectes %%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%