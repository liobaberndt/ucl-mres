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
fs = ;
duration = ;

% TODO: create time vector
t = ;

% Frequencies (Hz) - you can keep these fixed
f_theta = 6;
f_alpha = 10;
f_beta  = 20;

% TODO: choose amplitudes
% Try at least two different settings by changing these and re-running:
% Example setting 1: alpha dominant (a_alpha largest)
% Example setting 2: theta dominant (a_theta largest)
a_theta = ;
a_alpha = ;
a_beta  = ;

% TODO: create clean multi-frequency signal
y_clean = ;

% TODO: add noise
noise_strength = ;
y = ;

% TODO: compute FFT-based power spectrum
N = ;
Y = ;
f = ;
P = ;

% TODO: plot spectrum up to Nyquist
halfN = ;

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