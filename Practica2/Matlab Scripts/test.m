clc

Flower_types = dir('Testing/*.jpg');
Flower_types = Flower_types(3:end);

for i = 1:length(Flower_types)
    [color, segmented, ~] = getImage(Flower_types(i).name(1:end-4));
    featuresaux = getFeatures(color, segmented);
    [prediction, score] = predict(classifier, featuresaux);
    display(['The image ', Flower_types(i).name(1:end-4), ' has been classified as ', num2imageName(prediction(1))]);
end