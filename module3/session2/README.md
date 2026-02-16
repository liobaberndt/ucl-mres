# Session 2 - Power Spectral Density (PSD) Basics

## What you will learn in this session
In this session you will:
- compute power spectra for a few channels
- understand how PSD summarizes rhythmic activity
- save PSD outputs for later analysis


## Part 0 - Git workflow
Before starting:
```bash
git pull
```

After completing:
```bash
git add .
git commit -m "Module 3 Session 2: PSD basics"
git push
```

## Part A - Compute PSD (epoch-based)
Create a new file:
```
module3_session2_setup.m
```

Paste this code:
```matlab
% module3_session2_setup.m
% Module 3 — Session 2: PSD basics

clear; close all; clc;

% 1) Point to the SPM file (edit this)
spm_file = '/path/to/spmeeg_SUBJECT_teaching.mat';

% 2) Load dataset
D = spm_eeg_load(spm_file);

% 3) Select channels to inspect (edit if needed)
chan_labels = {'Fz', 'Cz', 'Pz'};
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
```

## Part B - No reading or writing in this session
This session is coding‑only.

## Session 2 checklist
You are finished if:
- the script runs without errors
- you created a PSD plot
- you saved `module3_session2_psd.mat`
