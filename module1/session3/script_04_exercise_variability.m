% 04_exercise_variability.m
% EXERCISE:
% Create several noisy versions of the same clean signal and compare them.
%
% Goal:
% - Define a clean sine wave
% - Create at least 3 noisy versions (each with independent noise)
% - Plot them for comparison (subplots or overlaid plots)

% TODO: set sampling rate (Hz) and duration (s)
fs = 250;
duration = 2;

% TODO: create time vector
t = 0: 1/fs : duration;

% TODO: choose frequency (Hz), amplitude, and noise strength
frequency = 5;
amplitude = 1;
noise_strength = 0.5;

% TODO: create clean signal
y_clean = amplitude * sin(2 * pi * frequency * t);

% TODO: create at least 3 noisy versions (each with randn)
y_noisy_1 = y_clean + (noise_strength * randn(size(t)));
y_noisy_2 = y_clean + (noise_strength * randn(size(t)));
y_noisy_3 = y_clean + (noise_strength * randn(size(t)));
y_noisy_4 = y_clean + (noise_strength * randn(size(t)));

% TODO: plot clean + noisy versions using subplots
figure;

subplot(5,1,1)
plot(t, y_clean)
xlabel('Time (s)')
ylabel('Amplitude')
title('Clean signal')

subplot(5,1,2)
plot(t, y_noisy_1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 1')

subplot(5,1,3)
plot(t, y_noisy_2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 2')

subplot(5,1,4)
plot(t, y_noisy_3)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 3')

subplot (5,1,5)
plot(t, y_noisy_4)
xlabel('Time (s)')
ylabel ('Amplitude')
title('Noisy version 4')