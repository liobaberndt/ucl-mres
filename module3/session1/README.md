# Session 1 - Resting-State Analysis Orientation

## What you will learn in this session
In this session you will:
- load a resting-state dataset in SPM
- extract basic information (channels, sampling rate, duration)
- plot a short EEG segment
- understand what kinds of analyses we will do later

This session is introductory and hands-on, with very short code.

## Part 0 — Git workflow
Before starting:
```bash
git pull
```

After completing:
```bash
git add .
git commit -m "Module 3 Session 1: dataset inspection"
git push
```

## Part A - Load and inspect the dataset
You will write a short script that:
- loads the SPM file
- prints basic dataset info
- plots a short segment

### A1. Create the script
Create a new file:
```
module3_session1_setup.m
```

Paste this code:
```matlab
% module3_session1_setup.m
% Minimal setup + dataset inspection

clear; close all; clc;

% 1) Point to the SPM file (edit this)
spm_file = '/path/to/spmeeg_SUBJECT_teaching.mat';

% 2) Load dataset
D = spm_eeg_load(spm_file);

% 3) Basic info
fprintf('Channels: %d\n', D.nchannels);
fprintf('Sampling rate: %.2f Hz\n', D.fsample);
fprintf('Duration (s): %.2f\n', D.nsamples / D.fsample);

% 4) Plot a short segment from one channel
chan = 1;              % first channel
samples = 1:1000;      % first 1000 samples
figure;
plot(samples / D.fsample, D(chan, samples));
xlabel('Time (s)');
ylabel('Amplitude');
title('Example EEG segment');
```

## Part B - What comes next
In later sessions, you will:
- compute power spectra
- fit FOOOF models
- compare ROIs and spatial patterns
- explore connectivity and microstates

We do not do any of that in Session 1.

## Session 1 checklist
You are finished if:
- the script runs without errors
- you printed channel count, sampling rate, and duration
- you plotted a short EEG segment
