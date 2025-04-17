clc;clear all;

%% FM Modulator
patha = '/Users/anuraagthakur/Desktop/Imag/FSK2';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FSK2';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FSK2';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

% I used the matlab help function and outside resources(AI Chat etc) extensively for this
for t=1:1:20000
    M = 2;       % Modulation order
    freqsep = 1+rand()*50; % Frequency separation (Hz)
    nsamp = 35;   % Number of samples per symbol
    Fs = 1000;     % Sample rate (Hz)
    x = randi([0 M-1],100,1);
    y = fskmod(x,M,freqsep,nsamp,Fs);
    
    snr=1+20*rand();

    Nums=zeros(3600,1);
    
    ynew=awgn(Nums,snr);
    
    ynew(1:length(y))=ynew(1:length(y))+y;

    win = hamming(128,"periodic");
    S=stft(ynew,Fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 

    save(fullfile(patha, sprintf('FSK2Image%d.mat', t)), 'Apple', '-v4');
    save(fullfile(pathb, sprintf('FSK2IQ%d.mat', t)), 'ynew', '-v4');
    save(fullfile(pathc, sprintf('FSK2Final%d.mat', t)), 'combined_array', '-v4');
end

%% FSK 4

patha = '/Users/anuraagthakur/Desktop/Imag/FSK4';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FSK4';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FSK4';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
    M = 4;       % Modulation order
    freqsep = 1+rand()*50; % Frequency separation (Hz)
    nsamp = 35;   % Number of samples per symbol
    Fs = 1000;     % Sample rate (Hz)
    x = randi([0 M-1],100,1);
    y = fskmod(x,M,freqsep,nsamp,Fs);
    
    snr=1+20*rand();

    Nums=zeros(3600,1);
    
    ynew=awgn(Nums,snr);
    
    ynew(1:length(y))=ynew(1:length(y))+y;

   
    win = hamming(128,"periodic");
    S=stft(ynew,Fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 

    save(fullfile(patha, sprintf('FSK4Image%d.mat', t)), 'Apple', '-v4');
    save(fullfile(pathb, sprintf('FSK4IQ%d.mat', t)), 'ynew', '-v4');
    save(fullfile(pathc, sprintf('FSK4Final%d.mat', t)), 'combined_array', '-v4');
end
%% FSK 8
patha = '/Users/anuraagthakur/Desktop/Imag/FSK8';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FSK8';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FSK8';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
    M = 8;       % Modulation order
    freqsep = 1+rand()*50; % Frequency separation (Hz)
    nsamp = 35;   % Number of samples per symbol
    Fs = 1000;     % Sample rate (Hz)
    x = randi([0 M-1],100,1);
    y = fskmod(x,M,freqsep,nsamp,Fs);
    
    snr=1+20*rand();

    Nums=zeros(3600,1);
    
    ynew=awgn(Nums,snr);
    
    ynew(1:length(y))=ynew(1:length(y))+y;

    win = hamming(128,"periodic");
    S=stft(ynew,Fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 

    save(fullfile(patha, sprintf('FSK8Image%d.mat', t)), 'Apple', '-v4');
    save(fullfile(pathb, sprintf('FSK8IQ%d.mat', t)), 'ynew', '-v4');
    save(fullfile(pathc, sprintf('FSK8Final%d.mat', t)), 'combined_array', '-v4');
end

%% FSK 16

patha = '/Users/anuraagthakur/Desktop/Imag/FSK16';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FSK16';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FSK16';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
    M = 16;       % Modulation order
    freqsep = 1+rand()*50; % Frequency separation (Hz)
    nsamp = 35;   % Number of samples per symbol
    Fs = 1000;     % Sample rate (Hz)
    x = randi([0 M-1],100,1);
    y = fskmod(x,M,freqsep,nsamp,Fs);
    
    snr=1+20*rand();

    Nums=zeros(3600,1);
    
    ynew=awgn(Nums,snr);
    
    ynew(1:length(y))=ynew(1:length(y))+y;

    win = hamming(128,"periodic");
    S=stft(ynew,Fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 

    save(fullfile(patha, sprintf('FSK16Image%d.mat', t)), 'Apple', '-v4');
    save(fullfile(pathb, sprintf('FSK16IQ%d.mat', t)), 'ynew', '-v4');
    save(fullfile(pathc, sprintf('FSK16Final%d.mat', t)), 'combined_array', '-v4');
end