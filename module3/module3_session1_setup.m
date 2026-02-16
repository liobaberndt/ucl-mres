    % module3_session1_setup.m
% Minimal setup + dataset inspection

clear; close all; clc;

% 1) Point to the SPM file (edit this)
spm_file = 'spmeeg_0001_EO_teaching.mat';

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