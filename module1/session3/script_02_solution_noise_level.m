% 02_solution_noise_level.m
% Solution: compare clean, low-noise, and high-noise signals.

fs = 250;
duration = 3;
t = 0:1/fs:duration;

frequency = 10;
amplitude = 1;

y_clean = amplitude * sin(2*pi*frequency*t);

noise_strength_low = 0.2;
noise_strength_high = 1.0;

noise_low = noise_strength_low * randn(size(t));
noise_high = noise_strength_high * randn(size(t));

y_low_noise = y_clean + noise_low;
y_high_noise = y_clean + noise_high;

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