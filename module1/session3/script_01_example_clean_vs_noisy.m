% 01_example_clean_vs_noisy.m
% Example: create a clean signal, add noise, and compare in subplots.

fs = 250;                % sampling rate (Hz)
duration = 3;            % seconds
t = 0:1/fs:duration;     % time vector (seconds)

frequency = 10;          % Hz
amplitude = 1;

% Clean signal
y_clean = amplitude * sin(2*pi*frequency*t);

% Add Gaussian noise
noise_strength = 0.5;    % try changing this value
noise = noise_strength * randn(size(t));
y_noisy = y_clean + noise;

% Plot clean vs noisy
figure;

subplot(2,1,1)
plot(t, y_clean)
xlabel('Time (s)')
ylabel('Amplitude')
title('Clean signal')

subplot(2,1,2)
plot(t, y_noisy)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy signal (clean + random noise)')