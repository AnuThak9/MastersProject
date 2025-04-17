%% FMCW 1
% I used the matlab help function and outside resources extensively for this
Fs = 1000;
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWUP1';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWUP1';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWUP1';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=4;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Up',...
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

save(fullfile(patha, sprintf('FMCWUP1Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWUP1IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWUP1Final%d.mat', t)), 'combined_array', '-v4');

end

%% FMCW 2

patha = '/Users/anuraagthakur/Desktop/Imag/FMCWUP2 ';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWUP2';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWUP2';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)


for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=8;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Up',...
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

save(fullfile(patha, sprintf('FMCWUP2Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWUP2IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWUP2Final%d.mat', t)), 'combined_array', '-v4');

end



%% FMCW 3

patha = '/Users/anuraagthakur/Desktop/Imag/FMCWUP3';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWUP3';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWUP3';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)


for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=10;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Up',...
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

save(fullfile(patha, sprintf('FMCWUP3Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWUP3IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWUP3Final%d.mat', t)), 'combined_array', '-v4');

end

%% FMCW 4

patha = '/Users/anuraagthakur/Desktop/Imag/FMCWUP4';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWUP4';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWUP4';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=2;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Up',...
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

save(fullfile(patha, sprintf('FMCWUP4Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWUP4IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWUP4Final%d.mat', t)), 'combined_array', '-v4');

end