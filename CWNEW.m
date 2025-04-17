
%%

patha = '/Users/anuraagthakur/Desktop/Imag';  
pathb = '/Users/anuraagthakur/Desktop/RawData';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid';  
%% 2 CW Wave
% I used the matlab help function and outside resources extensively for this

for t=1:1:10000
    t1=0:0.01:3599*0.01;
    Nums=sin((2+rand()*100)*t1);
    snr=1+20*rand();

    ynew=awgn(Nums,snr);
    win = hamming(128,"periodic");
    S=stft(ynew,Fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 

    save(sprintf('CW%d.mat',t),'Apple','-v4');
end

%% 4 CW Wave
clc;clear all;
for t=1:1:
    t1=0:0.01:3599*0.01;

    A=2+rand()*100;
    B=2+rand()*100;
    if(A~=B)
        Nums=sin((A)*t1)+sin((B)*t1);
        snr=1+20*rand();
    end

    ynew=awgn(Nums,snr);
    win = hamming(128,"periodic");
    S=stft(ynew,Fs,Window=win,OverlapLength=40,FFTLength=128);
    Apple=abs(S);
    combined_array = [Apple(:); ynew(:)]'; 
    
    save(sprintf('CW%d.mat',t),'Apple','-v4');
end

