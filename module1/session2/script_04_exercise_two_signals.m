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
fs = ;
duration = ;

% TODO: Create time vector
t = ;

% TODO: Choose frequencies and amplitude
freq1 = ;
freq2 = ;
amplitude = ;

% TODO: Compute the two signals
y1 = ;
y2 = ;

% TODO: Make the figure with subplots
figure;

subplot(2,1,1)
plot(t, y1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal 1')

subplot(2,1,2)
plot(t, y2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal 2')
