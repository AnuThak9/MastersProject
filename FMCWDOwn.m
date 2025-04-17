%% FMCW 1
% I used the matlab help function and outside resources extensively for this
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWD1';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWD1';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWD1';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=4;

waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Down',...
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

save(fullfile(patha, sprintf('FMCWD1Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWD1IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWD1Final%d.mat', t)), 'combined_array', '-v4');


end

%% FMCW 2
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWD2';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWD2';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWD2';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=8;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Down',...
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

save(fullfile(patha, sprintf('FMCWD2Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWD2IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWD2Final%d.mat', t)), 'combined_array', '-v4');

end



%% FMCW 3
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWD3';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWD3';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWD3';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=10;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Down',...
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

save(fullfile(patha, sprintf('FMCWD3Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWD3IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWD3Final%d.mat', t)), 'combined_array', '-v4');

end

%% FMCW 4
patha = '/Users/anuraagthakur/Desktop/Imag/FMCWD4';  
pathb = '/Users/anuraagthakur/Desktop/RawData/FMCWD4';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/FMCWD4';

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t=1:1:20000
st = [1e-3 2e-3];
bw = [1e5 9e4];
NumSweeps=2;
waveform = phased.FMCWWaveform('SweepTime',st,...
    'SweepBandwidth',bw,'SweepDirection','Down',...
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

save(fullfile(patha, sprintf('FMCWD4Image%d.mat', t)), 'Apple', '-v4');
save(fullfile(pathb, sprintf('FMCWD4IQ%d.mat', t)), 'ynew', '-v4');
save(fullfile(pathc, sprintf('FMCWD4Final%d.mat', t)), 'combined_array', '-v4');

end