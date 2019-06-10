% Volem fer una random permutation de les flors de cada tipus?
clc

Flower_types = dir('Segmentades/');
Flower_types = Flower_types(3:end);

labels = [""];
predicted = [""];

correctesT = 0;
totalsT = 0;

split = 0.8;

for i = 1:length(Flower_types)
    Images_flower_type = dir(fullfile('Segmentades',Flower_types(i).name,'*.png'));
    Image_name = Flower_types(i).name;
    
    correctes = 0;
    totals = 0;

    for k=(floor(length(Images_flower_type) * split) + 1):length(Images_flower_type)
        [color, segmented, b] = getImage(Images_flower_type(k).name(7:end-4));
        if b
            featuresaux = getFeatures(color, segmented);
            prediction = predict(classifier, featuresaux);
            labels = [labels;imageName2num(convertCharsToStrings(Image_name))];
            predicted = [predicted; prediction(1)];
            if prediction(1) == imageName2num(convertCharsToStrings(Image_name))
               correctes = correctes + 1; 
               correctesT = correctesT + 1; 
            end
            totals = totals + 1;
            totalsT = totalsT + 1;
        end
    end
    
    result = double(correctes)/double(totals) * 100;
    display([imageName2num(convertCharsToStrings(Image_name)), num2str(result), "%"])
end

result = double(correctesT)/double(totalsT) * 100;
display(["total: ", num2str(result), "%"])

confusionchart(labels(2:end),predicted(2:end))