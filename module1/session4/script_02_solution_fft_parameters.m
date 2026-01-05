% 02_solution_fft_parameters.m
% Solution: explore how frequency and duration affect the spectrum.

fs = 250;
duration = 2;            % try changing this to 1 or 5
t = 0:1/fs:duration;

frequency = 12;          % try changing this to 6 or 20
amplitude = 1;

y = amplitude * sin(2*pi*frequency*t);

N = length(y);
Y = fft(y);
f = (0:N-1) * (fs / N);

P = abs(Y).^2;

halfN = floor(N/2) + 1;

figure;
plot(f(1:halfN), P(1:halfN))
xlabel('Frequency (Hz)')
ylabel('Power (a.u.)')
title('Spectrum of a sine wave (change frequency/duration)')