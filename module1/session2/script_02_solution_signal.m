% 02_solution_signal.m
% Solution: create and plot a sine wave signal.

fs = 250;                % Hz
duration = 3;            % seconds
t = 0:1/fs:duration;     % seconds

frequency = 6;           % Hz
amplitude = 1;           % arbitrary units

y = amplitude * sin(2*pi*frequency*t);

figure;
plot(t, y)
xlabel('Time (s)')
ylabel('Amplitude')
title('6 Hz sine wave')
