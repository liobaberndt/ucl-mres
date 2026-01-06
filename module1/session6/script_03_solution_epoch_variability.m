%% 03_solution_epoch_variability.m
% Session 6 — One possible solution / reference run
%
% Note: This is not the only correct outcome. The exercise is about exploration.
% This script just provides a sensible "reference configuration" you can compare to.

clear; close all; clc;

fs = 250;
epoch_len_s = 4;
N = fs * epoch_len_s;
t = (0:N-1) / fs;

n_epochs = 60;

f1 = 6;    A1 = 1.0;
f2 = 10;   A2 = 1.2;
f3 = 22;   A3 = 0.6;

noise_sd = 1.0;

use_one_over_f = true;
one_over_f_strength = 0.8;

rng(0);

phases = 2*pi*rand(n_epochs,3);
epochs = zeros(n_epochs, N);

for e = 1:n_epochs
    sig = ...
        A1*sin(2*pi*f1*t + phases(e,1)) + ...
        A2*sin(2*pi*f2*t + phases(e,2)) + ...
        A3*sin(2*pi*f3*t + phases(e,3));
    
    noise = noise_sd * randn(1,N);
    
    if use_one_over_f
        wn = randn(1,N);
        WN = fft(wn);
        f = (0:N-1)*(fs/N);
        f(1) = 1e-6;
        shape = 1 ./ sqrt(f);
        shaped = real(ifft(WN .* shape));
        shaped = shaped / std(shaped);
        noise = noise + one_over_f_strength * shaped;
    end
    
    epochs(e,:) = sig + noise;
end

w = hann(N).';
freq = (0:floor(N/2)) * (fs/N);
A_all = zeros(n_epochs, numel(freq));

for e = 1:n_epochs
    x = epochs(e,:) .* w;
    X = fft(x);
    A = abs(X(1:numel(freq))) / (N/2);
    A(1) = A(1)/2;
    A_all(e,:) = A;
end

A_mean = mean(A_all, 1);
A_sem  = std(A_all,0,1) / sqrt(n_epochs);

figure('Name','Solution: epoch spectra + mean');
hold on;
plot(freq, A_all(1:15,:).', 'LineWidth', 0.75);
plot(freq, A_mean, 'k', 'LineWidth', 2);
xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title('Epoch spectra (subset) + average (black)');
grid on;
hold off;

figure('Name','Solution: mean ± SEM');
hold on;
plot(freq, A_mean, 'k', 'LineWidth', 2);
plot(freq, A_mean + A_sem, 'k--', 'LineWidth', 1);
plot(freq, A_mean - A_sem, 'k--', 'LineWidth', 1);
xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title('Average spectrum with SEM');
grid on;
hold off;

% Typical observation (write in your own words in the exercise script):
% - Increasing n_epochs reduces variability and makes peaks clearer.
% - Increasing noise_sd increases between-epoch variability and requires more epochs.
% - Adding 1/f-like background tilts the spectrum so low frequencies dominate;
%   peaks are still visible but sit on top of a sloping background.
