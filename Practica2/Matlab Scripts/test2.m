clc

answer = inputdlg('Enter the name of your file (without the extension):',...
                  'Sample', [1 50]);

[color, segmented, ~] = getImage(answer{1});
featuresaux = getFeatures(color, segmented);
[prediction, score] = predict(classifier, featuresaux);
ans = ['The image ', answer{1}, ' has been classified as ', num2imageName(prediction(1))];
display(ans);