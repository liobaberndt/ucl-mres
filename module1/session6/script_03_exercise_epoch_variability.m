%% 03_exercise_epoch_variability.m
% Session 6 — Exercise: Epoch variability and stability with averaging
%
% Your tasks:
% 1) Change the number of epochs and observe how the average spectrum changes.
% 2) Change the noise strength and observe how many epochs you need for a stable summary.
% 3) OPTIONAL: Introduce a weak 1/f-like background and see how it affects the shape.
%
% Answer the questions at the bottom directly in this script as comments.

clear; close all; clc;

%% Parameters (EDIT THESE)
fs = 250;
epoch_len_s = 4;
N = fs * epoch_len_s;
t = (0:N-1) / fs;

% TODO 1: Try n_epochs = 5, 10, 30, 100
n_epochs = 10;

% Underlying oscillatory components (EDIT THESE if you want)
f1 = 5;    A1 = 1.0;
f2 = 10;   A2 = 1.2;
f3 = 22;   A3 = 0.6;

% TODO 2: Try noise_sd = 0.5, 1.0, 2.0
noise_sd = 0.5;

% TODO 3 (optional): set use_one_over_f = true and experiment with strength
use_one_over_f = true;
one_over_f_strength = 0.05;   % try 0.3 to 1.5

rng(0); % keep results reproducible while you experiment

%% Simulate epochs
phases = 2*pi*rand(n_epochs,3);
epochs = zeros(n_epochs, N);

for e = 1:n_epochs
    sig = ...
        A1*sin(2*pi*f1*t + phases(e,1)) + ...
        A2*sin(2*pi*f2*t + phases(e,2)) + ...
        A3*sin(2*pi*f3*t + phases(e,3));
    
    noise = noise_sd * randn(1,N);
    
    if use_one_over_f
        % Create a simple 1/f-like noise by filtering white noise in the frequency domain.
        % This is intentionally simple: goal is intuition, not perfect realism.
        wn = randn(1,N);
        WN = fft(wn);
        f = (0:N-1)*(fs/N);
        f(1) = 1e-6; % avoid division by zero at DC
        shape = 1 ./ sqrt(f);  % ~1/sqrt(f) amplitude => ~1/f power
        shaped = real(ifft(WN .* shape));
        shaped = shaped / std(shaped); % normalise
        noise = noise + one_over_f_strength * shaped;
    end
    
    epochs(e,:) = sig + noise;
end

%% Compute single-sided amplitude spectra with Hann window
n = 0:N-1;
w = 0.5 * (1 - cos(2*pi*n/(N-1)));
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

%% Visualisation 1: show a few epoch spectra + average
figure('Name','Exercise: epoch spectra and average');
hold on;
n_show = min(15, n_epochs);
plot(freq, A_all(1:n_show,:).', 'LineWidth', 0.75);
plot(freq, A_mean, 'k', 'LineWidth', 2);
xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title(sprintf('Epoch spectra (first %d) + average (black) | n\\_epochs=%d, noise=%.2f', n_show, n_epochs, noise_sd));
grid on;
hold off;

%% Visualisation 2: stability metric (optional but useful)
% Compute how far the average spectrum is from the "true" clean spectrum
% (same oscillations, no noise). This helps quantify convergence.

sig_clean = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);
sig_clean = sig_clean .* w;
Xc = fft(sig_clean);
A_clean = abs(Xc(1:numel(freq))) / (N/2);
A_clean(1) = A_clean(1)/2;

err = mean(abs(A_mean - A_clean)); % simple average absolute difference

figure('Name','Exercise: average vs clean reference');
plot(freq, A_clean, 'k--', 'LineWidth', 1.5);
hold on;
plot(freq, A_mean, 'k', 'LineWidth', 2);
xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title(sprintf('Average spectrum vs clean reference | error=%.4f', err));
grid on;
hold off;

%% QUESTIONS — answer here as comments
% Q1) When you increase n_epochs, what happens to the average spectrum?
%     (e.g., smoothness, peak visibility, stability)
%       Increasing epochs will smooth out lower amplitudes due to
%       cancelling of noise. Peaks become more visible. 
% Q2) When you increase noise_sd, what changes? How many epochs do you need
%     before the average spectrum "looks stable"?
%       Increasing noise increases amplitude in other areas than the peaks.
%       More epochs are needed to smooth them out. 
% Q3) OPTIONAL (if you used 1/f-like background):
%     How does the broadband background change the visual appearance of the spectrum?
%     Do the oscillatory peaks become harder or easier to see?
