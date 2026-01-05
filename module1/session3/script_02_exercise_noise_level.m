% 02_exercise_noise_level.m
% EXERCISE:
% Create a clean signal, then compare low-noise and high-noise versions.
%
% Goal:
% - Create a clean sine wave
% - Add noise with two different strengths
% - Plot clean, low-noise, and high-noise signals for comparison

% TODO: set sampling rate (Hz) and duration (s)
fs = ;
duration = ;

% TODO: create a time vector
t = ;

% TODO: choose frequency (Hz) and amplitude
frequency = ;
amplitude = ;

% TODO: create the clean signal
y_clean = ;

% TODO: choose two different noise strengths
noise_strength_low = ;
noise_strength_high = ;

% TODO: create two independent noise vectors (use randn)
noise_low = ;
noise_high = ;

% TODO: create the noisy signals
y_low_noise = ;
y_high_noise = ;

% TODO: plot all three signals using subplots
figure;

subplot(3,1,1)
plot(t, y_clean)
xlabel('Time (s)')
ylabel('Amplitude')
title('Clean signal')

subplot(3,1,2)
plot(t, y_low_noise)
xlabel('Time (s)')
ylabel('Amplitude')
title('Low noise')

subplot(3,1,3)
plot(t, y_high_noise)
xlabel('Time (s)')
ylabel('Amplitude')
title('High noise')