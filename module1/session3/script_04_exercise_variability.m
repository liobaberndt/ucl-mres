% 04_exercise_variability.m
% EXERCISE:
% Create several noisy versions of the same clean signal and compare them.
%
% Goal:
% - Define a clean sine wave
% - Create at least 3 noisy versions (each with independent noise)
% - Plot them for comparison (subplots or overlaid plots)

% TODO: set sampling rate (Hz) and duration (s)
fs = ;
duration = ;

% TODO: create time vector
t = ;

% TODO: choose frequency (Hz), amplitude, and noise strength
frequency = ;
amplitude = ;
noise_strength = ;

% TODO: create clean signal
y_clean = ;

% TODO: create at least 3 noisy versions (each with randn)
y_noisy_1 = ;
y_noisy_2 = ;
y_noisy_3 = ;

% TODO: plot clean + noisy versions using subplots
figure;

subplot(4,1,1)
plot(t, y_clean)
xlabel('Time (s)')
ylabel('Amplitude')
title('Clean signal')

subplot(4,1,2)
plot(t, y_noisy_1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 1')

subplot(4,1,3)
plot(t, y_noisy_2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 2')

subplot(4,1,4)
plot(t, y_noisy_3)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 3')