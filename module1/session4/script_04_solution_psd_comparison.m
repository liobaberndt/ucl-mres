% 04_solution_psd_comparison.m
% Solution: compare spectra across multiple noisy versions of the same signal.

fs = 250;
duration = 3;
t = 0:1/fs:duration;

frequency = 10;
amplitude = 1;

y_clean = amplitude * sin(2*pi*frequency*t);

noise_strength = 0.7;

y_noisy_1 = y_clean + noise_strength * randn(size(t));
y_noisy_2 = y_clean + noise_strength * randn(size(t));
y_noisy_3 = y_clean + noise_strength * randn(size(t));

N = length(y_clean);
f = (0:N-1) * (fs / N);
halfN = floor(N/2) + 1;

P1 = abs(fft(y_noisy_1)).^2;
P2 = abs(fft(y_noisy_2)).^2;
P3 = abs(fft(y_noisy_3)).^2;

figure;
plot(f(1:halfN), P1(1:halfN))
hold on
plot(f(1:halfN), P2(1:halfN))
plot(f(1:halfN), P3(1:halfN))
hold off
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Spectra of multiple noisy signals (independent noise)')