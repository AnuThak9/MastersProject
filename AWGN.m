Fs = 1000;

patha = '/Users/anuraagthakur/Desktop/Imag/AWGN';  
pathb = '/Users/anuraagthakur/Desktop/RawData/AWGN';  
pathc = '/Users/anuraagthakur/Desktop/Hybrid/AWGN';  

mkdir(patha)
mkdir(pathb)
mkdir(pathc)

for t = 1:20000
    t1 = 0:0.01:3599*0.01;
    Nums = sin((0) * t1);
    snr = 1 + 20 * rand();

    ynew = awgn(Nums, snr);
    win = hamming(128, "periodic");
    S = stft(ynew, Fs, Window = win, OverlapLength = 40, FFTLength = 128);
    Apple = abs(S);
    combined_array = [Apple(:); ynew(:)]'; 

    save(fullfile(patha, sprintf('AWGNImage%d.mat', t)), 'Apple', '-v4');
    save(fullfile(pathb, sprintf('AWGNIQ%d.mat', t)), 'ynew', '-v4');
    save(fullfile(pathc, sprintf('AWGNFinal%d.mat', t)), 'combined_array', '-v4');
end
