%% 02_example_average_spectrum.m
% Session 6 — Example 2: Averaging spectra to get a stable summary
%
% Goal:
% - Compute the spectrum for many epochs
% - Compare single-epoch spectra vs the averaged spectrum
%
% What to look for:
% - Individual spectra are noisy / variable
% - The average spectrum is smoother and highlights stable peaks

clear; close all; clc;

%% Parameters
fs = 250;
epoch_len_s = 4;
N = fs * epoch_len_s;
t = (0:N-1) / fs;

n_epochs = 60;

% Fixed underlying components
f1 = 6;    A1 = 1.0;
f2 = 10;   A2 = 1.2;
f3 = 22;   A3 = 0.6;

noise_sd = 1.0;

% Random phase per epoch
phases = 2*pi*rand(n_epochs,3);

%% Simulate epochs
epochs = zeros(n_epochs, N);
for e = 1:n_epochs
    sig = ...
        A1*sin(2*pi*f1*t + phases(e,1)) + ...
        A2*sin(2*pi*f2*t + phases(e,2)) + ...
        A3*sin(2*pi*f3*t + phases(e,3));
    epochs(e,:) = sig + noise_sd*randn(1,N);
end

%% Compute amplitude spectra (single-sided) with Hann window
w = hann(N).';
freq = (0:floor(N/2)) * (fs/N);
A_all = zeros(n_epochs, numel(freq));

for e = 1:n_epochs
    x = epochs(e,:) .* w;
    X = fft(x);
    A = abs(X(1:numel(freq))) / (N/2);
    A(1) = A(1) / 2;
    A_all(e,:) = A;
end

A_mean = mean(A_all, 1);
A_sem  = std(A_all, 0, 1) / sqrt(n_epochs);  % standard error (optional)

%% Plot: many single-epoch spectra lightly + average spectrum bold
figure('Name','Session 6: averaging spectra');
hold on;

% Plot a subset to keep the figure readable
n_show = min(20, n_epochs);
plot(freq, A_all(1:n_show,:).', 'LineWidth', 0.75);

% Average on top
plot(freq, A_mean, 'k', 'LineWidth', 2);

xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title(sprintf('Single-epoch spectra (first %d) and average spectrum (black)', n_show));
grid on;
hold off;

%% Optional: plot mean ± SEM to show stability (comment/uncomment)
figure('Name','Session 6: mean ± SEM');
hold on;
plot(freq, A_mean, 'k', 'LineWidth', 2);
plot(freq, A_mean + A_sem, 'k--', 'LineWidth', 1);
plot(freq, A_mean - A_sem, 'k--', 'LineWidth', 1);
xlim([0 40]);
xlabel('Frequency (Hz)');
ylabel('Amplitude (a.u.)');
title('Average spectrum with variability (SEM)');
grid on;
hold off;

%% Interpretation (keep as a reminder)
% - Why does the average spectrum look smoother than single-epoch spectra?
% - Which features remain stable across epochs?
% - Which parts vary the most, and why?
