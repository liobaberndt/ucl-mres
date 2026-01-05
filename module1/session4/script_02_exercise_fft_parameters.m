% 02_exercise_fft_parameters.m
% EXERCISE:
% Explore how frequency and duration affect the spectrum.
%
% Goal:
% - create a sine wave
% - compute its spectrum using FFT
% - change frequency and duration and observe what happens

% TODO: set sampling rate (Hz)
fs = ;

% TODO: set duration (seconds) - try values like 1, 2, 5
duration = ;

% TODO: create time vector
t = ;

% TODO: choose frequency (Hz) - try values like 6, 10, 20
frequency = ;

% TODO: choose amplitude
amplitude = ;

% TODO: create time-domain signal
y = ;

% TODO: FFT and frequency axis
N = ;
Y = ;
f = ;

% TODO: compute power
P = ;

% TODO: plot up to Nyquist
halfN = ;

figure;
plot(f(1:halfN), P(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Spectrum (try changing frequency and duration)')