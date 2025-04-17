%% FMCW 1
% I used the matlab help function and outside resources extensively for this
Fs = 1000;
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWT1';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWT1';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWT1';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=4;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Triangle',...
    'SweepInterval','Symmetric','SampleRate',2e5,...
    'NumSweeps',NumSweeps);

x = waveform();

snr=1+20*rand();

Nums=zeros(3600,1);

xnew=awgn(Nums,snr);

xnew(1:length(x))=xnew(1:length(x))+x;
win = hamming(128,"periodic");
S=stft(xnew,Fs,Window=win,OverlapLength=40,FFTLength=128);
Apple=abs(S);

combined_array = [Apple(:); ynew(:)]'; 

save(fullfile(patha, sprintf('FMCWT1Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWT1IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWT1Final%d.mat', t)), 'combined_array', '-v4');

end

%% FMCW 2
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWT2';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWT2';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWT2';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=8;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Triangle',...
    'SweepInterval','Symmetric','SampleRate',2e5,...
    'NumSweeps',NumSweeps);
x = waveform();

snr=1+20*rand();

Nums=zeros(3600,1);

xnew=awgn(Nums,snr);

xnew(1:length(x))=xnew(1:length(x))+x;
win = hamming(128,"periodic");
S=stft(xnew,Fs,Window=win,OverlapLength=40,FFTLength=128);
Apple=abs(S);
combined_array = [Apple(:); ynew(:)]'; 

save(fullfile(patha, sprintf('FMCWT2Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWT2IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWT2Final%d.mat', t)), 'combined_array', '-v4');

end



%% FMCW 3
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWT3';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWT3';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWT3';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=10;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Triangle',...
    'SweepInterval','Symmetric','SampleRate',2e5,...
    'NumSweeps',NumSweeps);

x = waveform();

snr=1+20*rand();

Nums=zeros(3600,1);

xnew=awgn(Nums,snr);

xnew(1:length(x))=xnew(1:length(x))+x;
win = hamming(128,"periodic");
S=stft(xnew,Fs,Window=win,OverlapLength=40,FFTLength=128);
Apple=abs(S);
combined_array = [Apple(:); ynew(:)]'; 

save(fullfile(patha, sprintf('FMCWT3Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWT3IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWT3Final%d.mat', t)), 'combined_array', '-v4');

end

%% FMCW 4
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWT4';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWT4';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWT4';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=2;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Triangle',...
    'SweepInterval','Symmetric','SampleRate',2e5,...
    'NumSweeps',NumSweeps);
x = waveform();

snr=1+20*rand();

Nums=zeros(3600,1);

xnew=awgn(Nums,snr);

xnew(1:length(x))=xnew(1:length(x))+x;
win = hamming(128,"periodic");
S=stft(xnew,Fs,Window=win,OverlapLength=40,FFTLength=128);
Apple=abs(S);
combined_array = [Apple(:); ynew(:)]'; 

save(fullfile(patha, sprintf('FMCWT4Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWT4IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWT4Final%d.mat', t)), 'combined_array', '-v4');

end