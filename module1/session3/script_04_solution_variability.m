% 04_solution_variability.m
% Solution: create and compare multiple noisy versions of the same signal.

fs = 250;
duration = 2;
t = 0:1/fs:duration;

frequency = 8;
amplitude = 1;
noise_strength = 0.6;

y_clean = amplitude * sin(2*pi*frequency*t);

y_noisy_1 = y_clean + noise_strength * randn(size(t));
y_noisy_2 = y_clean + noise_strength * randn(size(t));
y_noisy_3 = y_clean + noise_strength * randn(size(t));

figure;

subplot(4,1,1)
plot(t, y_clean)
xlabel('Time (s)')
ylabel('Amplitude')
title('Clean signal')

subplot(4,1,2)
plot(t, y_noisy_1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 1')

subplot(4,1,3)
plot(t, y_noisy_2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 2')

subplot(4,1,4)
plot(t, y_noisy_3)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy version 3')