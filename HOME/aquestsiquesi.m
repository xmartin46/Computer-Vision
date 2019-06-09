clear all
close all
clc
% TOTES LES IMATGES PNG 
% ARA MATEIX CUTRE I KNOW
BOTODOR = ["1121"  "1132"  "1143"  "1154"  "1168" "1122"  "1133"  "1144"  "1155"  "1170" "1123"  "1134"  "1145"  "1156"  "1173" "1124"  "1135"  "1146"  "1157"  "1174" "1125"  "1136"  "1147"  "1158"  "1177" "1126"  "1137"  "1148"  "1159"  "1185" "1127"  "1138"  "1149"  "1160"  "1187" "1128"  "1139"  "1150"  "1161" "1129"  "1140"  "1151"  "1162" "1130"  "1141"  "1152"  "1164" "1131"  "1142"  "1153"  "1166"];
CROCUS = ["0322"  "0332"  "0343"  "0354"  "0368" "0323"  "0333"  "0344"  "0355"  "0372" "0324"  "0335"  "0345"  "0357"  "0374" "0325"  "0336"  "0347"  "0358"  "0375" "0326"  "0337"  "0348"  "0359"  "0377" "0327"  "0338"  "0349"  "0360"  "0381" "0328"  "0339"  "0350"  "0363"  "0382" "0329"  "0340"  "0351"  "0364" "0330"  "0341"  "0352"  "0365" "0331"  "0342"  "0353"  "0366"];
BUIXOL = ["1201"  "1213"  "1225"  "1237"  "1249" "1202"  "1214"  "1226"  "1238"  "1250" "1203"  "1215"  "1227"  "1239"  "1251" "1204"  "1216"  "1228"  "1240"  "1252" "1205"  "1217"  "1229"  "1241"  "1254" "1206"  "1218"  "1230"  "1242"  "1255" "1207"  "1219"  "1231"  "1243"  "1267" "1208"  "1220"  "1232"  "1244"  "1268" "1209"  "1221"  "1233"  "1245" "1210"  "1222"  "1234"  "1246" "1211"  "1223"  "1235"  "1247"  "1272" "1212"  "1224"  "1236"  "1248"  "1274"];

%TODO: PROVAR AMB AQUESTES
DENTDELLEO = ["0961"  "0972"  "0983"  "0994"  "1007" "0962"  "0973"  "0984"  "0995"  "1008" "0963"  "0974"  "0985"  "0996"  "1009" "0964"  "0975"  "0986"  "0997"  "1012" "0965"  "0976"  "0987"  "0999"  "1013" "0966"  "0977"  "0988"  "1000"  "1016" "0967"  "0978"  "0989"  "1001"  "1018" "0968"  "0979"  "0990"  "1002"  "1019" "0969"  "0980"  "0991"  "1003" "0970"  "0981"  "0992"  "1004" "0971"  "0982"  "0993"  "1006" ];
FADRINS = ["0081"  "0094"  "0108"  "0124"  "0143" "0083"  "0095"  "0109"  "0127"  "0144" "0084"  "0096"  "0110"  "0129"  "0145" "0086"  "0097"  "0111"  "0130"  "0146" "0088"  "0098"  "0112"  "0134"  "0149" "0089"  "0100"  "0113"  "0135"  "0150" "0090"  "0102"  "0115"  "0136"  "0153" "0091"  "0104"  "0116"  "0138" "0092"  "0105"  "0118"  "0140" "0093"  "0106"  "0119"  "0141"];
FRITILLARIA = ["0641"  "0654"  "0668"  "0681"  "0695" "0642"  "0655"  "0669"  "0682"  "0696" "0643"  "0656"  "0670"  "0684"  "0697" "0644"  "0657"  "0671"  "0685"  "0698" "0645"  "0658"  "0672"  "0686"  "0699" "0646"  "0659"  "0673"  "0687"  "0700" "0647"  "0660"  "0674"  "0688"  "0703" "0648"  "0662"  "0675"  "0689"  "0704" "0649"  "0663"  "0676"  "0690"  "0705" "0650"  "0664"  "0677"  "0691"  "0709" "0651"  "0665"  "0678"  "0692" "0652"  "0666"  "0679"  "0693" "0653"  "0667"  "0680"  "0694"];
GERBERA = ["0801"  "0813"  "0824"  "0835"  "0848" "0802"  "0814"  "0825"  "0836"  "0849" "0803"  "0815"  "0826"  "0837"  "0850" "0804"  "0816"  "0827"  "0838"  "0851" "0805"  "0817"  "0828"  "0839"  "0852" "0806"  "0818"  "0829"  "0840"  "0853" "0807"  "0819"  "0830"  "0841"  "0854" "0808"  "0820"  "0831"  "0842"  "0855" "0810"  "0821"  "0832"  "0843"  "0862" "0811"  "0822"  "0833"  "0844"  "0873" "0812"  "0823"  "0834"  "0845" ];
GIRASOL = ["0721"  "0735"  "0750"  "0764"  "0779" "0722"  "0736"  "0751"  "0766"  "0780" "0723"  "0737"  "0752"  "0767"  "0781" "0724"  "0738"  "0753"  "0768"  "0782" "0725"  "0739"  "0754"  "0769"  "0783" "0726"  "0740"  "0755"  "0770"  "0784" "0727"  "0741"  "0756"  "0771"  "0785" "0728"  "0743"  "0757"  "0772"  "0787" "0729"  "0744"  "0758"  "0773"  "0789" "0730"  "0745"  "0759"  "0774"  "0790" "0731"  "0746"  "0760"  "0775"  "0795" "0732"  "0747"  "0761"  "0776"  "0796" "0733"  "0748"  "0762"  "0777" "0734"  "0749"  "0763"  "0778" ];
HEMEROCALLIS = [ "0481"  "0491"  "0502"  "0513"  "0527" "0482"  "0492"  "0503"  "0514"  "0528" "0483"  "0493"  "0504"  "0515"  "0529" "0484"  "0494"  "0506"  "0517"  "0530" "0485"  "0495"  "0507"  "0518"  "0546" "0486"  "0496"  "0508"  "0521"  "0549" "0487"  "0497"  "0509"  "0522" "0488"  "0498"  "0510"  "0524" "0489"  "0500"  "0511"  "0525" "0490"  "0501"  "0512"  "0526" ];
LLIRI = ["0401"  "0416"  "0431"  "0446"  "0461" "0402"  "0417"  "0432"  "0447"  "0462" "0403"  "0418"  "0433"  "0448"  "0463" "0404"  "0419"  "0434"  "0449"  "0464" "0405"  "0420"  "0435"  "0450"  "0465" "0406"  "0421"  "0436"  "0451"  "0466" "0407"  "0422"  "0437"  "0452"  "0467" "0408"  "0423"  "0438"  "0453"  "0468" "0409"  "0424"  "0439"  "0454"  "0469" "0410"  "0425"  "0440"  "0455"  "0470" "0411"  "0426"  "0441"  "0456"  "0471" "0412"  "0427"  "0442"  "0457"  "0472" "0413"  "0428"  "0443"  "0458"  "0473" "0414"  "0429"  "0444"  "0459"  "0474" "0415"  "0430"  "0445"  "0460"  "0475" ];
NARCIS = ["0001"  "0015"  "0029"  "0045"  "0060" "0002"  "0016"  "0030"  "0046"  "0061" "0003"  "0017"  "0031"  "0047"  "0062" "0004"  "0018"  "0032"  "0048"  "0063" "0005"  "0019"  "0033"  "0049"  "0064" "0006"  "0020"  "0034"  "0050"  "0065" "0007"  "0021"  "0036"  "0051"  "0066" "0008"  "0022"  "0037"  "0052"  "0067" "0009"  "0023"  "0038"  "0053"  "0068" "0010"  "0024"  "0039"  "0055"  "0069" "0011"  "0025"  "0040"  "0056"  "0070" "0012"  "0026"  "0041"  "0057"  "0072" "0013"  "0027"  "0043"  "0058" "0014"  "0028"  "0044"  "0059" ];
VIOLA = ["1281"  "1292"  "1304"  "1316"  "1332" "1282"  "1293"  "1305"  "1317"  "1333" "1283"  "1294"  "1306"  "1318"  "1334" "1284"  "1295"  "1307"  "1319"  "1339" "1285"  "1296"  "1308"  "1320"  "1340" "1286"  "1297"  "1309"  "1321"  "1341" "1287"  "1298"  "1311"  "1322"  "1342" "1288"  "1300"  "1312"  "1324"  "1346" "1289"  "1301"  "1313"  "1325"  "1347" "1290"  "1302"  "1314"  "1329" "1291"  "1303"  "1315"  "1331" ];

% TODO FER DATA AUGMENTATION 


% Rand. perm.
BOTODOR = BOTODOR(randperm(length(BOTODOR)))
CROCUS = CROCUS(randperm(length(CROCUS)))
BUIXOL = BUIXOL(randperm(length(BUIXOL)))
DENTDELLEO = DENTDELLEO(randperm(length(DENTDELLEO)))
FADRINS = FADRINS(randperm(length(FADRINS)))
FRITILLARIA = FRITILLARIA(randperm(length(FRITILLARIA)))
GERBERA = GERBERA(randperm(length(GERBERA)))
GIRASOL = GIRASOL(randperm(length(GIRASOL)))
HEMEROCALLIS = HEMEROCALLIS(randperm(length(HEMEROCALLIS)))
LLIRI = LLIRI(randperm(length(LLIRI)))
NARCIS = NARCIS(randperm(length(NARCIS)))
VIOLA = VIOLA(randperm(length(VIOLA)))



% TAMANYS DE TOTES LES FLORS
[rows numBOTO]= size(BOTODOR)
[rows2 numCROCUS]= size(CROCUS)
[rows3 numBUIXOL] = size(BUIXOL)
[rows4 numDENT] = size(DENTDELLEO)
[rows5 numFADRINS] = size(FADRINS)
[rows6 numFRITLLARIA]= size(FRITILLARIA)
[rows7 numGERBERA] = size(GERBERA)
[rows8 numGIRASOL] = size(GIRASOL)
[rows9 numHEMEROCALLIS] = size(HEMEROCALLIS)
[rows10 numLLIRI] = size(LLIRI)
[rows11 numNARCIS] = size(NARCIS)
[rows12 numVIOLA] = size(VIOLA)

split = 0.8;


featureFlowers = [];
label = []
for i=  1:numBOTO*split
    [color, segmented] = getImage(BOTODOR(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label = [label;"Boto"];
    i
    BOTODOR(i)
    
end 
size(featureFlowers)
for i = 1:numCROCUS*split
    [color, segmented] = getImage(CROCUS(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label = [label;"Crocus"];
    i+numBOTO*split
    CROCUS(i)
end
size(featureFlowers)
for i = 1:numBUIXOL*split
    [color, segmented] = getImage(BUIXOL(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Buixol"];
    i + numBOTO*split + numCROCUS*split
    BUIXOL(i)
end
for i = 1:numDENT*split
    [color, segmented] = getImage(DENTDELLEO(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"DentdeLleo"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split
    DENTDELLEO(i)
end

for i = 1:numFADRINS*split
    [color, segmented] = getImage(FADRINS(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Fadrins"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split
end


for i = 1:numFRITLLARIA*split
    [color, segmented] = getImage(FRITILLARIA(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Fritillaria"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split
end


for i = 1:numGERBERA*split
    [color, segmented] = getImage(GERBERA(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Gerbera"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split + numFRITLLARIA*split
end

for i = 1:numGIRASOL*split
    [color, segmented] = getImage(GIRASOL(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Girasol"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split + numFRITLLARIA*split + numGERBERA*split
end


for i = 1:numHEMEROCALLIS*split
    [color, segmented] = getImage(HEMEROCALLIS(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Hemerocallis"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split + numFRITLLARIA*split + numGERBERA*split + numGIRASOL*split
end

for i = 1:numLLIRI*split
    [color, segmented] = getImage(LLIRI(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Lliri"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split + numFRITLLARIA*split + numGERBERA*split + numGIRASOL*split + numHEMEROCALLIS*split
end

for i = 1:numNARCIS*split
    [color, segmented] = getImage(NARCIS(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Narcis"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split + numFRITLLARIA*split + numGERBERA*split + numGIRASOL*split + numHEMEROCALLIS*split + numLLIRI*split
end

for i = 1:numVIOLA*split
    [color, segmented] = getImage(VIOLA(i));
    featuresaux = getFeatures(color, segmented);
    featureFlowers = [featureFlowers; featuresaux];
    label= [label;"Viola"];
    i + numBOTO*split + numCROCUS*split + numBUIXOL*split + numDENT*split + numFADRINS*split + numFRITLLARIA*split + numGERBERA*split + numGIRASOL*split + numHEMEROCALLIS*split + numLLIRI*split + numNARCIS*split
end

% LETS SEE THE FEATURES
% NUMBER OF PETALS AND COMPACTNESS

% X = featureFlowers(:,3:4);
% labels = labelVector;
% gscatter(x(:,1),x(:,2), labelVector, "rgb")
% xlabel("Number of petals")
% ylabel("Compactness")


classifier = fitctree(featureFlowers, label,"Prune","on","Surrogate","all","MinLeafSize",4);
% view(classifier,"Mode","graph")

% classifier = TreeBagger(50,featureFlowers,label,'OOBPrediction','On',...
%                                                 'Method','classification')

% classifier = fitcdiscr(featureFlowers,label,'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',...
%     struct('AcquisitionFunctionName','expected-improvement-plus'))

% classifier = fitcensemble(featureFlowers,label) maaaaaaaaaaaaaaaaaaaaaaan
% classifier = fitcensemble(featureFlowers,label, 'Method', 'Bag') IM GONNA
% CUM 85%
% classifier = fitcensemble(featureFlowers,label, 'Method', 'LPBoost') 79%
% classifier = fitcensemble(featureFlowers,label, 'Method', 'RUSBoost')
% Buuuh 64%
% classifier = fitcensemble(featureFlowers,label, 'Method', 'Subspace') 29%
% classifier = fitcensemble(featureFlowers,label, 'Method', 'TotalBoost')
% 75%

% classifier =
% fitcknn(featureFlowers,label,'NumNeighbors',5,'Standardize',1) 59%





% 12 flors
% [color, segmented] = getImage("1121");
% featuresBotodOr1 = getFeatures(color, segmented);
% [color, segmented] = getImage("1122");
% featuresBotodOr2 = getFeatures(color, segmented);
% [color, segmented] = getImage("1123");
% featuresBotodOr3 = getFeatures(color, segmented);
% [color, segmented] = getImage("1124");
% featuresBotodOr4 = getFeatures(color, segmented);
% [color, segmented] = getImage("1125");
% featuresBotodOr5 = getFeatures(color, segmented);
% [color, segmented] = getImage("1126");
% featuresBotodOr6 = getFeatures(color, segmented);
% [color, segmented] = getImage("1127");
% featuresBotodOr7 = getFeatures(color, segmented);
% [color, segmented] = getImage("1128");
% featuresBotodOr8 = getFeatures(color, segmented);
% [color, segmented] = getImage("1129");
% featuresBotodOr9 = getFeatures(color, segmented);
% [color, segmented] = getImage("1130");
% featuresBotodOr10 = getFeatures(color, segmented);
% 
% 
% [color, segmented] = getImage("1201");
% featuresBuixol1 = getFeatures(color, segmented);
% [color, segmented] = getImage("1202");
% featuresBuixol2 = getFeatures(color, segmented);
% [color, segmented] = getImage("1203");
% featuresBuixol3 = getFeatures(color, segmented);
% [color, segmented] = getImage("1204");
% featuresBuixol4 = getFeatures(color, segmented);
% [color, segmented] = getImage("1205");
% featuresBuixol5 = getFeatures(color, segmented);
% [color, segmented] = getImage("1206");
% featuresBuixol6 = getFeatures(color, segmented);
% [color, segmented] = getImage("1207");
% featuresBuixol7 = getFeatures(color, segmented);
% [color, segmented] = getImage("1208");
% featuresBuixol8 = getFeatures(color, segmented);
% [color, segmented] = getImage("1209");
% featuresBuixol9 = getFeatures(color, segmented);
% [color, segmented] = getImage("1210");
% featuresBuixol10 = getFeatures(color, segmented);
% 
% 
% 
% [color, segmented] = getImage("0322");
% featuresCrocus1 = getFeatures(color, segmented);
% [color, segmented] = getImage("0323");
% featuresCrocus2 = getFeatures(color, segmented);
% [color, segmented] = getImage("0324");
% featuresCrocus3 = getFeatures(color, segmented);
% [color, segmented] = getImage("0325");
% featuresCrocus4 = getFeatures(color, segmented);
% [color, segmented] = getImage("0326");
% featuresCrocus5 = getFeatures(color, segmented);
% [color, segmented] = getImage("0327");
% featuresCrocus6 = getFeatures(color, segmented);
% [color, segmented] = getImage("0328");
% featuresCrocus7 = getFeatures(color, segmented);
% [color, segmented] = getImage("0329");
% featuresCrocus8 = getFeatures(color, segmented);
% [color, segmented] = getImage("0377");
% featuresCrocus9 = getFeatures(color, segmented);
% [color, segmented] = getImage("0366");
% featuresCrocus10 = getFeatures(color, segmented);
% 
% 
% featuresFlowers = [featuresBotodOr1;
%                    featuresBotodOr2;
%                    featuresBotodOr3;
%                    featuresBotodOr4;
%                    featuresBotodOr5;
%                    
%                    
%                    featuresBotodOr6;
%                    featuresBotodOr7;
%                    featuresBotodOr8;
%                    featuresBotodOr9;
%                    featuresBotodOr10;
%                    
%                    
%                    featuresBuixol1;
%                    featuresBuixol2;
%                    featuresBuixol3;
%                    featuresBuixol4;
%                    featuresBuixol5;
%                    
%                     
%                    featuresBuixol6;
%                    featuresBuixol7;
%                    featuresBuixol8;
%                    featuresBuixol9;
%                    featuresBuixol10;
%                    
%                    featuresCrocus1;
%                    featuresCrocus2;
%                    featuresCrocus3;
%                    featuresCrocus4;
%                    featuresCrocus5;
%                    
%                    featuresCrocus6;
%                    featuresCrocus7;
%                    featuresCrocus8;
%                    featuresCrocus9;
%                    featuresCrocus10
%                    ];
%                
% labelVector = [{"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                {"a"};
%                
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                {"b"};
%                
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"};
%                {"c"}
%               ];
% 
% 
% 

















% [color, segmented] = getImage("0961");
% featuresDentdeLleo = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0081");
% featuresFadrins = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0641");
% featuresFritillaria = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0801");
% featuresGerbera = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0721");
% featuresGirasol = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0481");
% featuresHemerocallis = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0401");
% featuresLliri = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("0001");
% featuresNarcis = getFeatures(color, segmented);
% 
% [color, segmented] = getImage("1281");
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
% labelVector = {"BotodOr";
%                "Buixol";
%                "Crocus";
%                "DentdeLleo";
%                "Fadrins";
%                "Fritillaria";
%                "Gerbera";
%                "Girasol";
%                "Hemerocallis";
%                "Lliri";
%                "Narcis";
%                "Viola"};
% 
% classifier = fitctree(featuresFlowers, labelVector);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% IMFILL per les imatges amb insectes %%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%