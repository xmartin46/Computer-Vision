% Volem fer una random permutation de les flors de cada tipus?
clear all
close all
clc

Flower_types = dir('Segmentades/');
Flower_types = Flower_types(3:end);
featureFlowers = [];
label = [];
split = 0.8;
j = 0;
l = 0;
for i = 1:length(Flower_types)
    Images_flower_type = dir(fullfile('Segmentades',Flower_types(i).name,'*.png'));
    Image_name = convertCharsToStrings(Flower_types(i).name);
    
    for k=1:floor(length(Images_flower_type) * split)
        [color, segmented, b] = getImage(Images_flower_type(k).name(1:end-4));

        if b
            featuresaux = getFeatures(color, segmented);
            featureFlowers = [featureFlowers; featuresaux]; % El MATLAB diu que va lent
            label = [label;imageName2num(convertCharsToStrings(Image_name))]; % El MATLAB diu que va lent
            l = l + 1;
        end
        j = j + 1;
        [j l]
    end
end

for i = 1:length(Flower_types)
    Images_flower_type = dir(fullfile('Segmentades',Flower_types(i).name,'/Augmentation/*.png'));
    Image_name = convertCharsToStrings(Flower_types(i).name);
    
    for k=1:floor(length(Images_flower_type) * split)
        [color, segmented, b] = getImage(Images_flower_type(k).name(1:end-4));
        
        if b
            segmented = rgb2gray(segmented);
            segmented = bwlabel(segmented);
            segmented(segmented==1) = 3;
            segmented(segmented==2)=1;
            featuresaux = getFeatures(color, segmented);
            featureFlowers = [featureFlowers; featuresaux]; % El MATLAB diu que va lent
            label = [label;imageName2num(convertCharsToStrings(Image_name))]; % El MATLAB diu que va lent
            l = l + 1;
        end
        j = j + 1;
        [j l]
    end
end

%classifier = fitctree(featureFlowers, label,"Prune","on","Surrogate","all","MinLeafSize",4);
% view(classifier,"Mode","graph")

% classifier = TreeBagger(50,featureFlowers,label,'OOBPrediction','On',...
%                                                 'Method','classification')

classifier = fitcensemble(featureFlowers,label,'OptimizeHyperparameters','auto', 'Method', 'Bag')




