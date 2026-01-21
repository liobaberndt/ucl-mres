% 02_exercise_band_dominance.m
% EXERCISE:
% Change the relative amplitudes of multiple frequency components and observe
% how spectral dominance shifts.
%
% Goal:
% - create a multi-frequency signal (theta + alpha + beta)
% - change amplitudes so that different components dominate
% - compute and plot the spectrum
% - answer the interpretation questions (in comments)

% TODO: set sampling rate and duration
fs = 250;
duration = 5;

% TODO: create time vector
t = 0:1/fs:duration;

% Frequencies (Hz) - you can keep these fixed
f_theta = 6;
f_alpha = 10;
f_beta  = 20;

% TODO: choose amplitudes
% Try at least two different settings by changing these and re-running:
% Example setting 1: alpha dominant (a_alpha largest)
% Example setting 2: theta dominant (a_theta largest)
a_theta = 0.9;
a_alpha = 0.1;
a_beta  = 0.9;

% TODO: create clean multi-frequency signal
y_clean = a_theta*sin(2*pi*f_theta*t) + ...
          a_alpha*sin(2*pi*f_alpha*t) + ...
          a_beta*sin(2*pi*f_beta*t);

% TODO: add noise
noise_strength = 0.6;
y = y_clean + noise_strength*randn(size(t));

% TODO: compute FFT-based power spectrum
N = length(y);
Y = fft(y);
f = (0:N-1) * (fs/N);
P = abs(Y).^2;

% TODO: plot spectrum up to Nyquist
halfN = floor(N/2) + 1;

figure;

subplot(2,1,1)
plot(t, y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Multi-frequency signal (time domain)')

subplot(2,1,2)
plot(f(1:halfN), P(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Power spectrum (which peak is largest?)')