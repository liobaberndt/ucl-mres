% module3_session2_setup.m
% Module 3 — Session 2: PSD basics

clear; close all; clc;

% 1) Point to the SPM file (edit this)
spm_file = 'spmeeg_0001_EO_teaching.mat';

% 2) Load dataset
D = spm_eeg_load(spm_file);

% 3) Select channels to inspect (edit if needed)
chan_labels = {'FZ', 'CZ', 'PZ'};
chan_idx = D.indchannel(chan_labels);
chan_idx = chan_idx(chan_idx > 0);

if isempty(chan_idx)
    error('None of the requested channels were found. Edit chan_labels.');
end

% 4) Compute PSD using Welch's method (per epoch)
fs = D.fsample;
window_sec = 2;
noverlap = 0.5;
window = round(window_sec * fs);
noverlap = round(noverlap * window);
nfft = max(256, 2^nextpow2(window));

figure;
hold on;
pxx_all = [];
for i = 1:numel(chan_idx)
    pxx_trials = [];
    for tr = 1:D.ntrials
        x = double(D(chan_idx(i), :, tr));
        x = x - mean(x);
        [pxx, f] = pwelch(x, window, noverlap, nfft, fs);
        pxx_trials(:, tr) = pxx;
    end
    pxx_mean = mean(pxx_trials, 2);
    plot(f, 10*log10(pxx_mean), 'DisplayName', D.chanlabels{chan_idx(i)});
    pxx_all(:, i) = pxx_mean;
end
hold off;
xlabel('Frequency (Hz)');
ylabel('Power (dB)');
title('PSD (Welch) — example channels');
legend('Location', 'northeast');
xlim([1 45]);

% 5) Save outputs for later sessions
out.psd.f = f;
out.psd.pxx = pxx_all;
out.psd.labels = {D.chanlabels{chan_idx}};
save('module3_session2_psd.mat', 'out');