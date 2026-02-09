# Session 3 - ROI vs Global PSD Contrasts

## What you will learn in this session
In this session you will:
- compute PSDs for frontal, central, posterior ROIs
- compute a global PSD across all channels
- compare ROI vs global spectral shapes

This session includes coding and a short writing reflection.

## Part A - Compute ROI and global PSD
Create a new file:
```
module3_session3_setup.m
```
Paste this code:
```matlab
% module3_session3_setup.m
% Module 3 — Session 3: ROI vs global PSD contrasts

clear; close all; clc;

% 1) Point to the SPM file (edit this)
spm_file = '/path/to/spmeeg_SUBJECT_teaching.mat';

% 2) Load dataset
D = spm_eeg_load(spm_file);

% 3) Define ROIs (edit if needed)
roi.frontal   = {'Fz','F1','F2','F3','F4','FCz'};
roi.central   = {'Cz','C1','C2','C3','C4'};
roi.posterior = {'Pz','P1','P2','P3','P4','Oz'};

% 4) PSD settings
fs = D.fsample;
window_sec = 2;
noverlap = 0.5;
window = round(window_sec * fs);
noverlap = round(noverlap * window);
nfft = max(256, 2^nextpow2(window));

% 5) Helper: compute mean PSD for a list of channels
compute_roi_psd = @(labels) compute_roi_psd_epochs(D, labels, window, noverlap, nfft, fs);

% 6) Compute ROI PSDs
[f, psd_frontal] = compute_roi_psd(roi.frontal);
[~, psd_central] = compute_roi_psd(roi.central);
[~, psd_post]    = compute_roi_psd(roi.posterior);

% 7) Global PSD (all EEG channels)
all_labels = D.chanlabels;
[~, psd_global] = compute_roi_psd(all_labels);

% 8) Plot
figure;
plot(f, 10*log10(psd_frontal), 'LineWidth', 1.2); hold on;
plot(f, 10*log10(psd_central), 'LineWidth', 1.2);
plot(f, 10*log10(psd_post), 'LineWidth', 1.2);
plot(f, 10*log10(psd_global), 'k--', 'LineWidth', 1.2);
hold off;
xlabel('Frequency (Hz)');
ylabel('Power (dB)');
title('ROI vs Global PSD (epoch-averaged)');
legend({'Frontal','Central','Posterior','Global'}, 'Location', 'northeast');
xlim([1 45]);

% 9) Save outputs
out.psd.f = f;
out.psd.frontal = psd_frontal;
out.psd.central = psd_central;
out.psd.posterior = psd_post;
out.psd.global = psd_global;
out.roi = roi;
save('module3_session3_psd_roi.mat', 'out');

% --- Local function (kept in the same file for teaching)
function [f, psd_mean] = compute_roi_psd_epochs(D, labels, window, noverlap, nfft, fs)
    idx = D.indchannel(labels);
    idx = idx(idx > 0);
    if isempty(idx)
        error('None of the requested channels were found. Edit ROI labels.');
    end

    psd_ch = [];
    for c = 1:numel(idx)
        pxx_trials = [];
        for tr = 1:D.ntrials
            x = double(D(idx(c), :, tr));
            x = x - mean(x);
            [pxx, f] = pwelch(x, window, noverlap, nfft, fs);
            pxx_trials(:, tr) = pxx;
        end
        pxx_mean = mean(pxx_trials, 2);
        psd_ch(:, c) = pxx_mean;
    end
    psd_mean = mean(psd_ch, 2);
end
```

## Part B - Reading task (for an informed choice)
Read the B‑SNIP paper section on intrinsic EEG activity (IEA) and note:
- how IEA is defined
- which sensors or sensor groups are used
- any rationale given for their choices

## Part C - Writing task (pre‑registration decision note)
Write a short note (12–18 bullets) that can go into a preregistration:
- how the B‑SNIP paper defines intrinsic EEG activity (IEA)
- which sensors or sensor groups they use for IEA (as described in the paper)
- why we can or cannot match that exactly with our dataset
- whether to use single channels, ROI averages, or global average
- if single channels: which exact channels and why
- if ROI averages: which ROIs and how you will average (mean across channels)
- if global average: which channels are included/excluded
- whether to consider source reconstruction (yes/no) and why
- if using source reconstruction: which ROIs and how they are defined
- in this dataset, whether to analyze all channels or only those matching B‑SNIP group‑difference topographies
- one advantage and one disadvantage of each approach considered
- your final choice(s) for preregistration and the rationale

## Part 0 — Git workflow
Before starting:
```bash
git pull
```

After completing:
```bash
git add .
git commit -m "Module 3 Session 3: ROI vs global PSD"
git push
```

## Session 3 checklist
You are finished if:
- the script runs without errors
- you created the ROI vs global PSD plot
- you saved `module3_session3_psd_roi.mat`
- you completed the writing task
