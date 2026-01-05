% 04_solution_two_signals.m
% Solution: compare two sine waves using subplots.

fs = 250;
duration = 3;
t = 0:1/fs:duration;

freq1 = 5;
freq2 = 12;
amplitude = 1;

y1 = amplitude * sin(2*pi*freq1*t);
y2 = amplitude * sin(2*pi*freq2*t);

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
