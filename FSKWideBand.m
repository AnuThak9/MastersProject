%% FM Modulator
% I used the matlab help function and outside resources extensively for this
patha = '/Users/anuraagthakur/Desktop/Imag/FMMod';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMMod';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMMod';

for t=1:1:20000
    M = 2;        % Modulation order
    freqsep = 50; % Frequency separation (Hz)
    nsamp = 35;   % Number of samples per symbol
    fs = 1000;    % Sample rate (Hz)
    x = randi([0 M-1],100,1);
    y = fskmod(x,M,freqsep,nsamp,fs);
    
    snr=3;
    Nums=zeros(3600,1);
    y=awgn(y,snr);
    Nums(1:length(y))=Nums(1:length(y))+y;
    win = hamming(128,"periodic");
    S1=stft(Nums,fs,Window=win,OverlapLength=40,FFTLength=128);

    x = randn(3600,1);
    [y1,d1] = bandpass(x,[2 100],fs,ImpulseResponse="iir",Steepness=[0.5 0.8]);

    x = randn(3600,1);
    [y2,d1] = bandpass(x,[2 100],fs,ImpulseResponse="iir",Steepness=[0.5 0.8]);

    x = randn(3600,1);
    [y3,d1] = bandpass(x,[2 100],fs,ImpulseResponse="iir",Steepness=[0.5 0.8]);

    ynew2=awgn(y1+y2+y3,40);
    S2=stft(ynew2,fs,Window=win,OverlapLength=40,FFTLength=128);
    %figure
    %stft(ynew2,fs,Window=win,OverlapLength=40,FFTLength=128);

    %figure
    %stft((ynew2),fs,Window=win,OverlapLength=40,FFTLength=128)
    S3=stft((ynew2),fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S3);
    %imshow(Apple)
    save(sprintf('WideBandPure%d.mat',t),'Apple','-v4');
end