%% 01_example_multiple_epochs.m
% Session 6 — Example 1: Multiple epochs of the same underlying signal
%
% Goal:
% - Simulate many repetitions ("epochs") of the same underlying process
% - Show how time series and spectra vary across epochs because of noise
%
% What to look for:
% - Time-domain traces differ from epoch to epoch
% - Spectra differ slightly, even though the generating frequencies are the same

clear; close all; clc;

%% Parameters
fs = 250;                 % sampling rate (Hz)
epoch_len_s = 4;          % epoch length (seconds)
N = fs * epoch_len_s;     % samples per epoch
t = (0:N-1) / fs;

n_epochs = 20;

% Underlying oscillatory components (fixed across epochs)
f1 = 6;    A1 = 1.0;      % theta-ish
f2 = 10;   A2 = 1.2;      % alpha-ish
f3 = 22;   A3 = 0.6;      % beta-ish

noise_sd = 1.0;           % noise strength per epoch

% Random phase per epoch (realistic: phase isn't locked across epochs)
% (Amplitudes & frequencies are constant; phases differ.)
phases = 2*pi*rand(n_epochs,3);

%% Simulate epochs
epochs = zeros(n_epochs, N);

for e = 1:n_epochs
    sig = ...
        A1*sin(2*pi*f1*t + phases(e,1)) + ...
        A2*sin(2*pi*f2*t + phases(e,2)) + ...
        A3*sin(2*pi*f3*t + phases(e,3));
    
    noise = noise_sd * randn(1, N);
    epochs(e,:) = sig + noise;
end

%% Plot a few time-domain epochs
n_show = 5;

figure('Name','Session 6: multiple epochs (time domain)');
plot(t, epochs(1:n_show,:).');
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('Time series: %d example epochs (same underlying components, different noise/phases)', n_show));
grid on;

%% Compute and plot spectra (single-sided amplitude spectrum)
% Use a Hann window to reduce spectral leakage
w = hann(N).';
W = sum(w.^2);  % for power normalization

freq = (0:floor(N/2)) * (fs/N);
amp_specs = zeros(n_epochs, numel(freq));

for e = 1:n_epochs
    x = epochs(e,:) .* w;
    X = fft(x);
    % Single-sided amplitude spectrum
    A = abs(X(1:numel(freq))) / (N/2);
    A(1) = A(1) / 2;  % DC correction for single-sided scaling
    amp_specs(e,:) = A;
end

figure('Name','Session 6: multiple epochs (spectra)');
plot(freq, amp_specs(1:n_show,:).', 'LineWidth', 1);
xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title(sprintf('Spectra: %d example epochs (peaks similar, details vary)', n_show));
grid on;

%% Quick prompts (optional to read, not required to answer here)
% - Do the peak locations stay the same across epochs?
% - Do peak heights vary? Why?
% - What changes more: low frequencies or high frequencies?
