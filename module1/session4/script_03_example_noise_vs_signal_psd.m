% 03_example_noise_vs_signal_psd.m
% Example: compare clean vs noisy signals in time and frequency domains.
%
% Goal:
% - create a clean sine wave
% - add noise
% - compare time-domain plots and spectra

fs = 250;
duration = 3;
t = 0:1/fs:duration;

frequency = 10;
amplitude = 1;

y_clean = amplitude * sin(2*pi*frequency*t);

noise_strength = 0.7;
y_noisy = y_clean + noise_strength * randn(size(t));

% --- Spectra (FFT-based power) ---
N = length(y_clean);

Yc = fft(y_clean);
Yn = fft(y_noisy);

f = (0:N-1) * (fs / N);

Pc = abs(Yc).^2;
Pn = abs(Yn).^2;

halfN = floor(N/2) + 1;

figure;

subplot(2,2,1)
plot(t, y_clean)
xlabel('Time (s)')
ylabel('Amplitude')
title('Clean signal (time)')

subplot(2,2,2)
plot(t, y_noisy)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noisy signal (time)')

subplot(2,2,3)
plot(f(1:halfN), Pc(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Clean signal (spectrum)')

subplot(2,2,4)
plot(f(1:halfN), Pn(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Noisy signal (spectrum)')