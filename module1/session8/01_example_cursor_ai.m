% 01_example_cursor_ai.m
% Session 8 — Example script for using Cursor AI with MATLAB
clear; close all; clc;

% Signal parameters
samplingRateHz = 250;          % sampling rate (Hz)
signalDurationSec = 5;         % signal duration (seconds)
timeVectorSec = 0:1/samplingRateHz:signalDurationSec;

% Create signal components
alphaComponent = sin(2*pi*10*timeVectorSec);   % 10 Hz alpha rhythm
thetaComponent = sin(2*pi*6*timeVectorSec);    % 6 Hz theta rhythm
noiseComponent = randn(size(timeVectorSec)) * 0.5;

% Combine components into simulated EEG signal
simulatedEegSignal = alphaComponent + 0.5 * thetaComponent + noiseComponent;

% Plot simulated EEG signal
figure;
plot(timeVectorSec, simulatedEegSignal);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title('Simulated EEG-like signal');