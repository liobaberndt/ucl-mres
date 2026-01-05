% 02_solution_band_dominance.m
% Solution: demonstrate changing dominance by choosing different amplitudes.

fs = 250;
duration = 5;
t = 0:1/fs:duration;

f_theta = 6;
f_alpha = 10;
f_beta  = 20;

% Example: alpha dominant
a_theta = 0.4;
a_alpha = 1.2;
a_beta  = 0.3;

y_clean = a_theta * sin(2*pi*f_theta*t) + ...
          a_alpha * sin(2*pi*f_alpha*t) + ...
          a_beta  * sin(2*pi*f_beta*t);

noise_strength = 0.6;
y = y_clean + noise_strength * randn(size(t));

N = length(y);
Y = fft(y);
f = (0:N-1) * (fs / N);
P = abs(Y).^2;

halfN = floor(N/2) + 1;

figure;

subplot(2,1,1)
plot(t, y)
xlabel('Time (s)')
ylabel('Amplitude')
title('Multi-frequency signal (time domain)')

subplot(2,1,2)
plot(f(1:halfN), P(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Power spectrum (alpha dominant example)')