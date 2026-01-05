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
fs = ;
duration = ;

% TODO: create time vector
t = ;

% TODO: choose frequency and amplitude
frequency = ;
amplitude = ;

% TODO: create clean signal
y_clean = ;

% TODO: choose noise strength
noise_strength = ;

% TODO: create noisy versions (at least 3)
y_noisy_1 = ;
y_noisy_2 = ;
y_noisy_3 = ;

% TODO: FFT and frequency axis
N = ;
f = ;
halfN = ;

% TODO: compute spectra (power) for each noisy signal
P1 = ;
P2 = ;
P3 = ;

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