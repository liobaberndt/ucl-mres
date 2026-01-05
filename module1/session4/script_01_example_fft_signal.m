% 01_example_fft_signal.m
% Example: compute and plot a simple power spectrum for a clean sine wave.
%
% Goal:
% - create a sine wave in the time domain
% - compute its spectrum using the FFT
% - plot power vs frequency

fs = 250;                 % sampling rate (Hz)
duration = 3;             % seconds
t = 0:1/fs:duration;      % time vector

frequency = 10;           % Hz
amplitude = 1;

% Time-domain signal
y = amplitude * sin(2*pi*frequency*t);

% FFT
N = length(y);
Y = fft(y);

% Frequency axis (Hz)
f = (0:N-1) * (fs / N);

% Power (magnitude squared) - unnormalised, for learning/visualisation
P = abs(Y).^2;

% Plot only up to Nyquist (fs/2)
halfN = floor(N/2) + 1;

figure;
plot(f(1:halfN), P(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Power spectrum of a clean sine wave')