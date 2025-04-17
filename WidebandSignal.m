%% Wideband Signal
% I used the matlab help function and outside resources extensively for this
t=1;
patha = '/Users/anuraagthakur/Desktop/Imag/Wideband';  
pathb = '/Users/anuraagthakur/Desktop/RawData/Wideband';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/Wideband';
mkdir(patha)
mkdir(pathb)
mkdir(pathc)

while(t<=20000)
fs = 1000;
x = randn(3600,1);

A=10+rand()*200;
B=A+rand()*200;

if((B-A)>=90)
    snr=1+20*rand();
    
    [y1,d1] = bandpass(x,[A B],fs,ImpulseResponse="iir",Steepness=[0.5 0.8]);
    ynew=awgn(y1,snr);
    
    win = hamming(128,"periodic");
    S=stft(ynew,fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 
    
    save(fullfile(patha, sprintf('WidebandImage%d.mat', t)), 'Apple', '-v4');
    save(fullfile(pathb, sprintf('WidebandIQ%d.mat', t)), 'ynew', '-v4');
    save(fullfile(pathc, sprintf('WidebandFinal%d.mat', t)), 'combined_array', '-v4');

    t=t+1;
end

end