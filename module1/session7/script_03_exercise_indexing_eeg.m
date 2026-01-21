% 03_exercise_indexing_eeg.m
% Session 7 — Exercise: indexing EEG data
%
% Goal:
% - practise selecting channels, time windows, and trials in EEG-style arrays
% - understand what each dimension means (channels × time × trials)
%
% Instructions:
% - Complete the TODOs (they are REQUIRED — the script will error until you do).
% - Answer the interpretation questions directly in the script as comments.

clear; 
%close all;
clc;

%% Create a mock EEG structure (EEGLAB-like, but simplified)
EEG = struct();

EEG.nbchan = 16;
EEG.srate  = 200;       % Hz
EEG.pnts   = 800;       % 4 seconds
EEG.trials = 50;

EEG.times = (0:EEG.pnts-1) / EEG.srate; % seconds

EEG.chanlocs = struct('labels', cell(1, EEG.nbchan));
for ch = 1:EEG.nbchan
    EEG.chanlocs(ch).labels = sprintf('Ch%02d', ch);
end

% Simulated data: noise + theta in some channels, alpha in others
EEG.data = randn(EEG.nbchan, EEG.pnts, EEG.trials) * 4;

t = EEG.times;
theta = sin(2*pi*4*t);   % 6 Hz
alpha = sin(2*pi*10*t);  % 10 Hz

theta_channels = [3 4 5];
alpha_channels = [10 11 12];

for tr = 1:EEG.trials
    for ch = theta_channels
        EEG.data(ch, :, tr) = EEG.data(ch, :, tr) + 2.5 * theta;
    end
    for ch = alpha_channels
        EEG.data(ch, :, tr) = EEG.data(ch, :, tr) + 2.0 * alpha;
    end
end

%% TODO 0: pick which channels/trial you want to inspect
% Choose one alpha-ish channel and one theta-ish channel
ch_alpha = 11;  % e.g., 10/11/12 are alpha channels
ch_theta = 4;   % e.g., 3/4/5 are theta channels
trial_id = 7;

%% TODO 1: extract ONE channel × ONE trial time series
% You need a vector x of length EEG.pnts.
% TODO: replace the line below with correct indexing.
x = squeeze(EEG.data(ch_alpha, :, 1)) % <-- REPLACE THIS

% Plot
figure;
plot(EEG.times, x);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('Time series: %s (Trial %d)', EEG.chanlocs(ch_alpha).labels, trial_id));

% Interpretation (answer in comments):
% - Does this look more like a rhythmic signal (alpha/theta) or mostly noise?
    % mostly noise, I think. 
% - What features made you decide?
    % no regularity in amplitude at constant intervals
%% TODO 2: extract ALL channels for ONE trial (channels × time)
% You need a matrix X_trial of size [EEG.nbchan × EEG.pnts].
% TODO: replace the line below with correct indexing.
X_trial = squeeze(EEG.data(:, :, 1)) % <-- REPLACE THIS

fprintf('X_trial size should be [%d × %d]. Yours is: %s\n', EEG.nbchan, EEG.pnts, mat2str(size(X_trial)));

% Visualise as an image (channels vs time)
figure;
imagesc(EEG.times, 1:EEG.nbchan, X_trial);
axis xy;
xlabel('Time (s)');
ylabel('Channel');
title(sprintf('All channels (Trial %d)', trial_id));
colorbar;

% Interpretation (answer in comments):
% - What does this plot show that a single-channel plot does not?
    % it shows amplitude patterns across the whole scalp
%% TODO 3: extract a TIME WINDOW for ALL channels in ONE trial
% Define time window in seconds
t_start = 1.0;
t_end   = 2.0;

% Find indices for that window
idx = find(EEG.times >= t_start & EEG.times <= t_end);

% You need a matrix X_win of size [EEG.nbchan × length(idx)].
% TODO: replace the line below with correct indexing.
X_win = squeeze(EEG.data(:, idx, 2)) % <-- REPLACE THIS

fprintf('X_win size should be [%d × %d]. Yours is: %s\n', EEG.nbchan, numel(idx), mat2str(size(X_win)));

figure;
imagesc(EEG.times(idx), 1:EEG.nbchan, X_win);
axis xy;
xlabel('Time (s)');
ylabel('Channel');
title(sprintf('Window %.1f–%.1f s (Trial %d)', t_start, t_end, trial_id));
colorbar;

% Interpretation (answer in comments):
% - Why might selecting time windows be useful in real EEG?
% we might be interested in an event in a specific time-window

%% TODO 4: extract ONE channel across ALL trials (time × trials)
% You need a matrix X_ch_trials of size [EEG.pnts × EEG.trials].
% TODO: replace the line below with correct indexing.
X_ch_trials = squeeze(EEG.data(ch_theta, :, :)) % <-- REPLACE THIS

fprintf('X_ch_trials size should be [%d × %d]. Yours is: %s\n', EEG.pnts, EEG.trials, mat2str(size(X_ch_trials)));

% Plot first 10 trials
figure;
plot(EEG.times, X_ch_trials(:, 1:5));
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('%s across 10 trials', EEG.chanlocs(ch_alpha).labels));

% Interpretation (answer in comments):
% - What stays similar across trials, and what changes?
        % The channel produces regular 10Hz amplitudes, but the rythmic
        % consistency is influenced by noise influencing the exact
        % waveform.
% - How does this relate to “variability across repetitions”?
        % Noise creates variablity in the waveform across repetitions
        % making it important to average trials. 

%% TODO 5: compute an across-trial average for ONE channel
% You need avg (time × 1).
% TODO: replace the line below with correct computation.
avg = mean(X_ch_trials, 2) % <-- REPLACE THIS

figure;
plot(EEG.times, avg, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('Across-trial average: %s', EEG.chanlocs(ch_alpha).labels));

% Interpretation (answer in comments):
% - What happens to noise when you average across trials?
% dissapears
% - What happens to consistent structure (e.g., theta)?
% the consistent theta/alpha frequencies become clear

%% TODO 6 (optional): compare theta vs alpha channels in the frequency domain
% Compute and plot power spectra for:
% - ch_theta (theta channel)
% - ch_alpha (alpha channel)
% Use ONE trial (trial_id).
%
% Hint: start from time series vectors x_theta and x_alpha, then use FFT
% or pwelch. Keep it simple.
%
% Write 2 sentences (as comments) interpreting the difference.

x_alpha = squeeze(EEG.data(ch_alpha, :, trial_id))
x_theta = squeeze(EEG.data(ch_theta, :, trial_id))
A = fft(x_alpha)
B = fft(x_theta)
N = EEG.pnts
f = (0:N-1) * (EEG.srate / N);   % frequency axis (Hz)

P1 = abs(A).^2;            
P2 = abs(B).^2;
fmax = 40;
keep = f <= fmax;
figure;
plot(f(keep), P1(keep), 'LineWidth', 1.5); hold on;
plot(f(keep), P2(keep), 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Power (a.u.)');
title(sprintf('Power comparison (Trial %d): %s vs %s', trial_id, EEG.chanlocs(ch_theta).labels, EEG.chanlocs(ch_alpha).labels));
legend({sprintf('%s (theta)', EEG.chanlocs(ch_theta).labels), sprintf('%s (alpha)', EEG.chanlocs(ch_alpha).labels)}, 'Location', 'best');
