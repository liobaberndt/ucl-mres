% 03_example_two_signals.m
% Example: compare two sine waves using subplots.

fs = 250;               % Hz
duration = 2;           % seconds
t = 0:1/fs:duration;    % seconds

freq1 = 6;              % Hz
freq2 = 10;             % Hz
amplitude = 1;

y1 = amplitude * sin(2*pi*freq1*t);
y2 = amplitude * sin(2*pi*freq2*t);

figure;

subplot(2,1,1)
plot(t, y1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal 1: 6 Hz')

subplot(2,1,2)
plot(t, y2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal 2: 10 Hz')
