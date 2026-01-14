% 04_exercise_two_signals.m
% EXERCISE:
% Create two sine waves and plot them in separate subplots.
%
% Goal:
% - Use the same time vector for both signals
% - Choose two different frequencies
% - Plot them in a figure with 2 subplots
% - Label axes and add titles

% TODO: Set sampling rate and duration
fs = 150;
duration = 2;

% TODO: Create time vector
t = 0: 1/fs : duration;

% TODO: Choose frequencies and amplitude
freq1 = 3;
freq2 = 6;
amplitude = 2;

% TODO: Compute the two signals
y1 = amplitude * sin(2*pi*freq1*t);
y2 = amplitude * sin(2*pi*freq2*t);

% TODO: Make the figure with subplots
figure;

subplot(2,1,1)
plot(t, y1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal 1: 3 Hz')

subplot(2,1,2)
plot(t, y2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal 2: 6 Hz')
