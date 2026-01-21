% 02_exercise_fft_parameters.m
% EXERCISE:
% Explore how frequency and duration affect the spectrum.
%
% Goal:
% - create a sine wave
% - compute its spectrum using FFT
% - change frequency and duration and observe what happens

% TODO: set sampling rate (Hz)
fs = 250;

% TODO: set duration (seconds) - try values like 1, 2, 5
duration = 1;

% TODO: create time vector
t = 0:1/fs:duration;

% TODO: choose frequency (Hz) - try values like 6, 10, 20
frequency = 20;

% TODO: choose amplitude
amplitude = 2;

% TODO: create time-domain signal
y = amplitude*sin(2*pi*frequency*t);

% TODO: FFT and frequency axis
N = length(y);
Y = fft(y);
f = (0:N-1) * (fs/N);

% TODO: compute power
P = abs(Y).^2;

% TODO: plot up to Nyquist
halfN = floor(N/2) + 1;

figure;
plot(f(1:halfN), P(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Spectrum (try changing frequency and duration)')