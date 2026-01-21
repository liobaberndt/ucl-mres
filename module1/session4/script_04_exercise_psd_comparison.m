% 04_exercise_psd_comparison.m
% EXERCISE:
% Compare spectra across multiple noisy versions of the same signal.
%
% Goal:
% - create one clean signal
% - create at least 3 noisy versions (independent noise)
% - compute spectra for each
% - compare spectra visually (subplots or overlaid)

% TODO: define sampling rate and duration
fs = 250;
duration = 1;

% TODO: create time vector
t = 0:1/fs:duration;

% TODO: choose frequency and amplitude
frequency = 10;
amplitude = 1;

% TODO: create clean signal
y_clean = amplitude*sin(2*pi*frequency*t);

% TODO: choose noise strength
noise_strength = 0.5;

% TODO: create noisy versions (at least 3)
y_noisy_1 = y_clean + noise_strength*randn(size(y_clean));
y_noisy_2 = y_clean + noise_strength*randn(size(y_clean));
y_noisy_3 = y_clean + noise_strength*randn(size(y_clean));

% TODO: FFT and frequency axis
N = length(y_clean);
f = (0:N-1) * (fs/N);
halfN = floor(N/2) + 1;

% TODO: compute spectra (power) for each noisy signal
P1 = abs(fft(y_noisy_1)).^2;
P2 = abs(fft(y_noisy_2)).^2;
P3 = abs(fft(y_noisy_3)).^2;

% TODO: plot spectra for comparison (overlaid is fine)
figure;
plot(f(1:halfN), P1(1:halfN))
hold on
plot(f(1:halfN), P2(1:halfN))
plot(f(1:halfN), P3(1:halfN))
hold off
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Spectra of multiple noisy signals')