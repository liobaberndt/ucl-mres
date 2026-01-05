% 01_example_signal.m
% Example: create and plot a sine wave signal.

% Sampling rate (how many samples per second)
fs = 250;                 % Hz

% Duration of the signal
duration = 2;             % seconds

% Time vector from 0 to duration in steps of 1/fs
t = 0:1/fs:duration;      % seconds

% Signal parameters
frequency = 10;           % Hz
amplitude = 1;            % arbitrary units

% Create a sine wave
y = amplitude * sin(2*pi*frequency*t);

% Plot the signal
figure;
plot(t, y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sine wave signal')
