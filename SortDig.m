%% Clear all data
clear all;
clc;

%%
function [] = calculateMetrics(predictions, trueLabels)
    cm = confusionmat(trueLabels, predictions);
    precision = diag(cm) ./ sum(cm, 1)'  
    recall = diag(cm) ./ sum(cm, 2)    
    accuracy = sum(diag(cm)) / sum(cm(:)) 
    f1 = 2 * (precision .* recall) ./ (precision + recall) 
end

%% Folders where the data is saved
folder1 = '/Users/anuraagthakur/Desktop/Imag/2CW';   
folder2 = '/Users/anuraagthakur/Desktop/Imag/4CW';   
folder3 = '/Users/anuraagthakur/Desktop/Imag/6CW';   
folder4 = '/Users/anuraagthakur/Desktop/Imag/8CW';   
folder5 = '/Users/anuraagthakur/Desktop/Imag/AWGN';   
folder6 = '/Users/anuraagthakur/Desktop/Imag/FMCWD1';  
folder7 = '/Users/anuraagthakur/Desktop/Imag/FMCWD2';   
folder8 = '/Users/anuraagthakur/Desktop/Imag/FMCWD3';   
folder9 = '/Users/anuraagthakur/Desktop/Imag/FMCWD4';  
folder10 = '/Users/anuraagthakur/Desktop/Imag/FMCWT1';  
folder11 = '/Users/anuraagthakur/Desktop/Imag/FMCWT2'; 
folder12 = '/Users/anuraagthakur/Desktop/Imag/FMCWT3'; 
folder13 = '/Users/anuraagthakur/Desktop/Imag/FMCWT4'; 
folder14 = '/Users/anuraagthakur/Desktop/Imag/FMCWUP1'; 
folder16 = '/Users/anuraagthakur/Desktop/Imag/FMCWUP3'; 
folder17 = '/Users/anuraagthakur/Desktop/Imag/FMCWUP4'; 
folder18 = '/Users/anuraagthakur/Desktop/Imag/FSK2'; 
folder19 = '/Users/anuraagthakur/Desktop/Imag/FSK4';
folder20 = '/Users/anuraagthakur/Desktop/Imag/FSK8'; 
folder21 = '/Users/anuraagthakur/Desktop/Imag/FSK16';
folder22 = '/Users/anuraagthakur/Desktop/Imag/Wideband';

folders = {folder1, folder2, folder3, folder4, folder5, folder6, folder7, folder8, folder9, folder10, folder11, folder12, folder13, folder14, folder16, folder17, folder18, folder19, folder20, folder21, folder22};
numClasses = length(folders);
allData = [];
allLabels = [];

for i = 1:numClasses
    files = dir(fullfile(folders{i}, '*.mat')); 
    for j = 1:2000
        filePath = fullfile(folders{i}, files(j).name);
        data = load(filePath); 
        ynew = data.Apple; 
        ynew = ynew(:); 
        statisticalFeatures = [mean(ynew),median(ynew), mode(ynew), range(ynew), std(ynew), skewness(ynew), kurtosis(ynew),iqr(ynew),prctile(ynew, 25), prctile(ynew, 75)];
        [~, freqWavelet] = cwt(ynew, 'amor'); 
        [~, freqWavelet2] = cwt(ynew, 'morse'); 
        features = [ynew; statisticalFeatures(:);freqWavelet;freqWavelet2];
        allData = [allData; features'];
        allLabels = [allLabels; i]; 
    end
end

%%
cv = cvpartition(size(allData, 1), 'HoldOut', 0.3);
trainData = allData(training(cv), :);
testData = allData(test(cv), :);
trainLabels = allLabels(training(cv));
testLabels = allLabels(test(cv));

%% KNN Classifier/ Searching oer different number of neighbors
knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 3, 'Distance', 'euclidean');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 3, 'Distance', 'cityblock');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 3 ,'Distance', 'chebynchev');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 3 ,'Distance',  'minkowski');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 5, 'Distance', 'euclidean');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 5, 'Distance', 'cityblock');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 5 ,'Distance', 'chebychev');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 5 ,'Distance',  'minkowski');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 7, 'Distance', 'euclidean');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 7, 'Distance', 'cityblock');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 7 ,'Distance', 'chebychev');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 7 ,'Distance',  'minkowski');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 9, 'Distance', 'euclidean');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 9, 'Distance', 'cityblock');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 9 ,'Distance', 'chebychev');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 9 ,'Distance',  'minkowski');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 11, 'Distance', 'euclidean');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 11, 'Distance', 'cityblock');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 11,'Distance', 'chebychev');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 11,'Distance',  'minkowski');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

%% SVM Classifier (using fitcecoc for multiclass classification)

% RBF Kernel
svmTemplate = templateSVM('KernelFunction', 'rbf', 'CacheSize', 200);
svmModel = fitcecoc(trainData, trainLabels, ...
                    'Coding', 'onevsall', ...
                    'Learners', svmTemplate);
svmPred = predict(svmModel, testData);
calculateMetrics(svmPred, testLabels);

% Polynomial Kernel (of order 3)
svmTemplate = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder', 7, 'BoxConstraint', 1);
svmModel = fitcecoc(trainData, trainLabels, ...
                    'Coding', 'onevsall', ...
                    'Learners', svmTemplate);
svmPred = predict(svmModel, testData);
calculateMetrics(svmPred, testLabels);

% Linear Kernel
svmTemplate = templateSVM('KernelFunction', 'linear', 'CacheSize', 200);
svmModel = fitcecoc(trainData, trainLabels, ...
                    'Coding', 'onevsall', ...
                    'Learners', svmTemplate);
svmPred = predict(svmModel, testData);
calculateMetrics(svmPred, testLabels);
%% 3. Random Forest Classifier
rfModel = fitcensemble(trainData, trainLabels, 'Method', 'Bag');
rfPred = predict(rfModel, testData);
calculateMetrics(rfPred, testLabels);

rfModel = fitcensemble(trainData, trainLabels, ...
    'Method', 'Bag', ...               
    'NumLearningCycles', 50, ...      
    'Learners', templateTree('MaxNumSplits', 10, 'MinLeafSize', 5));
rfPred = predict(rfModel, testData);
calculateMetrics(rfPred, testLabels);

rfModel = fitcensemble(trainData, trainLabels, ...
    'Method', 'Bag', ...               
    'NumLearningCycles', 250, ...     
    'Learners', templateTree('MaxNumSplits', 10, 'MinLeafSize', 5)); 
rfPred = predict(rfModel, testData);
calculateMetrics(rfPred, testLabels);

rfModel = fitcensemble(trainData, trainLabels, ...
    'Method', 'Bag', ...               
    'NumLearningCycles', 500, ...     
    'Learners', templateTree('MaxNumSplits', 2, 'MinLeafSize', 5)); 
rfPred = predict(rfModel, testData);
calculateMetrics(rfPred, testLabels);

%% 4. Decision Tree Classifier
dtModel = fitctree(trainData, trainLabels);
dtPred = predict(dtModel, testData);
calculateMetrics(dtPred, testLabels);