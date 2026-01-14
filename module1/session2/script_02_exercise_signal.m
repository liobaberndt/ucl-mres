% 02_exercise_signal.m
% EXERCISE:
% Create and plot a sine wave signal.
%
% Goal:
% - Choose a sampling rate (fs)
% - Choose a duration
% - Create a time vector t
% - Choose a frequency and amplitude
% - Compute the signal y
% - Plot it with labels and a title

% TODO: Set a sampling rate in Hz
fs = 1000;

% TODO: Set a duration in seconds
duration = 4;

% TODO: Create a time vector from 0 to duration with step size 1/fs
t = 0 : 1/fs : duration;

% TODO: Choose a frequency in Hz
frequency = 15;

% TODO: Choose an amplitude
amplitude = 1;

% TODO: Create the sine wave
y = amplitude * sin(2 * pi * frequency * t);

% TODO: Plot the signal and label axes
figure;
plot(t, y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sine wave - 15 Hz')
