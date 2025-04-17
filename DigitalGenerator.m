close all; clear all; clc;
% I used online Documentation and scirpts form chat gpt and my textbook
% heavily for this

%%
parentDir = '/Users/anuraagthakur/Desktop/untitled folder 80';

% Modulation Type
modulationSchemes = {'BPSK', 'BPSK-Flipped', 'QPSK', '8QPSK', '4QAM', '8QAM', '8QAM-Flipped'};

% Noise Type
noiseTypes = {'AWGN', 'PinkNoise', 'RayleighNoise', 'ImpulseNoise', 'RicianNoise'};

numFiles = 1;  % Set the number of files you want to generate per modulation-noise combo

%Random Data to be classified
data = randi([0 1],  300,1);
data2 = randi([0 1], 600,1);
data3 = randi([0 1], 900,1);

% Loop over each modulation scheme
for m = 1:length(modulationSchemes)
    modScheme = modulationSchemes{m};
    
    modFolder = fullfile(parentDir, modScheme);

    if ~exist(modFolder, 'dir')
        mkdir(modFolder);
    end
    
    % Loop noise type
    for n = 1:length(noiseTypes)
        noiseType = noiseTypes{n};

        noiseFolder = fullfile(modFolder, noiseType);
        if ~exist(noiseFolder, 'dir')
            mkdir(noiseFolder);
        end
        
        for i = 1:numFiles
            % Generate modulated signal for the scheme
            modulatedSignal = (modulate(modScheme,data,data2,data3));
            
            % Add noise to the modulated signal
            noisySignal = addNoise(modulatedSignal, noiseType);
            
            % Save the noisy signal as a .mat file
            filename = fullfile(noiseFolder, [modScheme, '_', noiseType, '_', num2str(i), '.mat']);
            save(filename, 'noisySignal');
            
            % Plot the noisy signal constellation
            % figure;
            % scatter(real(noisySignal), imag(noisySignal), 'filled');
            % title([modScheme, ' + ', noiseType, num2str(i)]);
            % xlabel('I');
            % ylabel('Q');
            % axis equal;
            % grid on;
        end
    end
end

% Function to perform modulation
function modulated_signal = modulate(ModulationScheme,data,data2,data3)
    switch ModulationScheme
        case 'BPSK'
            symbols = data;
            modulated_signal = 2*symbols - 1;  
        case 'BPSK-Flipped'
            symbols = data;
            modulated_signal = 1j*(2*symbols - 1);  
        case 'QPSK'        
            bits_per_symbol = 2;
            symbols = bi2de(reshape(data2, bits_per_symbol, []).')';
            modulated_signal = conj(exp(1j * pi/4 * (2*symbols + 1)))';  
        case '8QPSK'
            bits_per_symbol = 3;
            symbols = bi2de(reshape(data3, bits_per_symbol, []).')';
            modulated_signal = conj(exp(1j * pi/8 * (2*symbols + 1)))';  
        case '4QAM'
            bits_per_symbol = 2;
            symbols = bi2de(reshape(data2, bits_per_symbol, []).')';
            modulated_signal = conj((2*mod(symbols, 2) - 1) + 1j * (2*floor(symbols/2) - 1))';
        case '8QAM'
            bits_per_symbol = 3;
            symbols = bi2de(reshape(data3, bits_per_symbol, []).')';
            modulated_signal = (2*mod(symbols, 2) - 1) + 1j * (2*floor(symbols/2) - 1);
            modulated_signal = conj(modulated_signal)';
        case '8QAM-Flipped'
            bits_per_symbol = 3;
            symbols = bi2de(reshape(data3, bits_per_symbol, []).')';
            modulated_signal = (2*mod(symbols, 2) - 1)*1j + (2*floor(symbols/2) - 1);
            modulated_signal = conj(modulated_signal)';
    end
end

% Function to add noise to the modulated signal
function noisySignal = addNoise(modSignal, noiseType)
    N = length(modSignal);
    switch noiseType
        case 'AWGN'
            noise = randn(N, 1) * (0.5 - 0.01) + 0.01;
            noiseImaginary = 1j*(randn(N, 1) * (0.5 - 0.01) + 0.01);
            noisySignal = modSignal + noise + noiseImaginary;

        case 'PinkNoise'
            pink_noise = pinknoise(N);
            pink_noiseImaginary = 1j*pinknoise(N);
            noisySignal = modSignal + pink_noise + pink_noiseImaginary;

        case 'RayleighNoise'
            rayleigh_noise = raylrnd(rand * (0.7 - 0.01) + 0.01, N, 1);
            rayleigh_noiseImaginary = 1j*raylrnd(rand * (0.7 - 0.01) + 0.01, N, 1);
            noisySignal = modSignal + rayleigh_noise+rayleigh_noiseImaginary;

        case 'ImpulseNoise'
            impulse_noise = zeros(N, 1); 
            SpikesNum = randi([3, 8]);
            impulse_indices = randi([1, N], SpikesNum, 1);
            spike_amplitudes = 0.1 + 1 * rand(SpikesNum, 1);
            impulse_noise(impulse_indices) = spike_amplitudes .* randn(SpikesNum, 1);
            noisySignal = modSignal + impulse_noise;

            impulse_noise = zeros(N, 1);
            spike_amplitudes = 0.1 + 1 * rand(SpikesNum, 1);
            impulse_noise(impulse_indices) = 1j*spike_amplitudes .* randn(SpikesNum, 1);

            noisySignal = noisySignal + impulse_noise;

        case 'RicianNoise'
            S = 0.1 + (0.8 - 0.1) * rand;  
            sigma = 0.01 + (S - 0.1) * rand; 
            X = sigma * randn(N, 1) + S;  
            Y = sigma * randn(N, 1);  
            rician_noise = sqrt(X.^2 + Y.^2);

            S = 0.1 + (0.8 - 0.1) * rand;  
            sigma = 0.01 + (S - 0.1) * rand;  
            X = sigma * randn(N, 1) + S; 
            Y = sigma * randn(N, 1);  
            rician_noiseIma = 1j*sqrt(X.^2 + Y.^2);
            
            noisySignal = modSignal + rician_noise+rician_noiseIma;
    end
end
