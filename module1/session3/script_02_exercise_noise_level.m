% 02_exercise_noise_level.m
% EXERCISE:
% Create a clean signal, then compare low-noise and high-noise versions.
%
% Goal:
% - Create a clean sine wave
% - Add noise with two different strengths
% - Plot clean, low-noise, and high-noise signals for comparison

% TODO: set sampling rate (Hz) and duration (s)
fs = 250;
duration = 2;

% TODO: create a time vector
t = 0: 1/fs : duration;

% TODO: choose frequency (Hz) and amplitude
frequency = 10;
amplitude = 3;

% TODO: create the clean signal
y_clean = amplitude * sin(2*pi*frequency*t);

% TODO: choose two different noise strengths
noise_strength_low = 0.25;
noise_strength_high = 100;

% TODO: create two independent noise vectors (use randn)
noise_low = noise_strength_low * randn(size(t));
noise_high = noise_strength_high * randn(size(t));

% TODO: create the noisy signals
y_low_noise = y_clean + noise_low;
y_high_noise = y_clean + noise_high;

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