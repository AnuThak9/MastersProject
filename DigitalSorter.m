
clear all;
clc;

%%
function [] = calculateMetrics(predictions, trueLabels)
    cm = confusionmat(trueLabels, predictions);
    precision = diag(cm) ./ sum(cm, 1)' ; % Precision for each class
    recall = diag(cm) ./ sum(cm, 2);    % Recall for each class
    accuracy = sum(diag(cm)) / sum(cm(:)) % Overall accuracy
    f1 = 2 * (precision .* recall) ./ (precision + recall); % F1 Score for each class
end

%% Folders where the data is saved

folder1 = '/Users/anuraagthakur/Desktop/untitled folder 7/4QAM/AWGN'; 
folder2 = '/Users/anuraagthakur/Desktop/untitled folder 7/8QAM/AWGN'; 
folder3 = '/Users/anuraagthakur/Desktop/untitled folder 7/8QAM-Flipped/AWGN'; 
folder4 = '/Users/anuraagthakur/Desktop/untitled folder 7/8QPSK/AWGN'; 
folder5 = '/Users/anuraagthakur/Desktop/untitled folder 7/BPSK/AWGN'; 
folder6 = '/Users/anuraagthakur/Desktop/untitled folder 7/BPSK-Flipped/AWGN'; 
folder7 = '/Users/anuraagthakur/Desktop/untitled folder 7/QPSK/AWGN'; 


folders = {folder1, folder2,folder3, folder4, folder5, folder6, folder7};
numClasses = length(folders);
allData = [];
allLabels = [];

for i = 1:numClasses
    files = dir(fullfile(folders{i}, '*.mat')); 
    for j = 1:2000
        filePath = fullfile(folders{i}, files(j).name);
        data = load(filePath); 
        ynew = data.noisySignal; 
        
        ynewreal = real(ynew(:)); 
        statisticalFeatures = [mean(ynewreal),median(ynewreal), mode(ynewreal), range(ynewreal), std(ynewreal), skewness(ynewreal), kurtosis(ynewreal),iqr(ynewreal),prctile(ynewreal, 25), prctile(ynewreal, 75)];
        [~, freqWavelet] = cwt(ynewreal, 'amor'); 
        [~, freqWavelet2] = cwt(ynewreal, 'morse'); 
        % [~, freqWavelet3] = cwt(ynew, 'bump'); 
        features = [ynewreal; statisticalFeatures(:);freqWavelet;freqWavelet2];%;freqWavelet3]; 



        ynewimag = real(ynew(:)); 
        statisticalFeatures = [mean(ynewimag),median(ynewimag), mode(ynewimag), range(ynewimag), std(ynewimag), skewness(ynewimag), kurtosis(ynewimag),iqr(ynewimag),prctile(ynewimag, 25), prctile(ynewimag, 75)];
        [~, freqWavelet] = cwt(ynewimag, 'amor'); 
        [~, freqWavelet2] = cwt(ynewimag, 'morse'); 
        % [~, freqWavelet3] = cwt(ynew, 'bump'); 
        features2 = [ynewimag; statisticalFeatures(:);freqWavelet;freqWavelet2;features];%;freqWavelet3]; 

        allData = [allData; features2'];
        
        
        allLabels = [allLabels; i]; 
    end
end


%%
% Split data into training and testing sets (70-30 split)
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

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 3 ,'Distance', 'chebychev');
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

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 19, 'Distance', 'cityblock');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 23, 'Distance', 'chebychev');
knnPred = predict(knnModel, testData);
calculateMetrics(knnPred, testLabels);

knnModel = fitcknn(trainData, trainLabels, 'NumNeighbors', 29, 'Distance', 'minkowski');
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



