% 01_example_multifrequency_spectrum.m
% Example: create a signal with multiple frequency components and view its spectrum.
%
% Goal:
% - build an EEG-like toy signal containing multiple frequencies at once
% - add noise
% - compute and plot the power spectrum (FFT-based)

fs = 250;                 % sampling rate (Hz)
duration = 5;             % seconds
t = 0:1/fs:duration;      % time vector

% --- Multi-frequency components (theta, alpha, beta-like) ---
f_theta = 6;              % Hz
f_alpha = 10;             % Hz
f_beta  = 20;             % Hz

a_theta = 0.8;            % amplitude
a_alpha = 1.0;
a_beta  = 0.4;

y_clean = a_theta * sin(2*pi*f_theta*t) + ...
          a_alpha * sin(2*pi*f_alpha*t) + ...
          a_beta  * sin(2*pi*f_beta*t);

% Add noise
noise_strength = 0.6;
y = y_clean + noise_strength * randn(size(t));

% --- Compute FFT-based power spectrum ---
N = length(y);
Y = fft(y);

f = (0:N-1) * (fs / N);   % frequency axis (Hz)
P = abs(Y).^2;            % power (a.u.)

% Plot only up to Nyquist
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
title('Power spectrum (multiple peaks)')