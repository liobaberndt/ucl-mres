% 03_solution_indexing_eeg.m
% Session 7 — Solution: indexing EEG data
%
% This is a worked solution for 03_exercise_indexing_eeg.m.
% It shows correct indexing for channels × time × trials.

clear; close all; clc;

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
theta = sin(2*pi*6*t);   % 6 Hz
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

%% Choose channels/trial to inspect
ch_alpha = 11;
ch_theta = 4;
trial_id = 8;

%% 1) Extract ONE channel × ONE trial time series
x = squeeze(EEG.data(ch_alpha, :, trial_id)); % [pnts × 1]

figure;
plot(EEG.times, x);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('Time series: %s (Trial %d)', EEG.chanlocs(ch_alpha).labels, trial_id));

% Interpretation (example):
% - This channel should show a weak 10 Hz rhythm (alpha) plus noise.
% - Even if noisy, the oscillatory pattern repeats more regularly than pure noise.

%% 2) Extract ALL channels for ONE trial (channels × time)
X_trial = squeeze(EEG.data(:, :, trial_id)); % [nbchan × pnts]

fprintf('X_trial size: %s\n', mat2str(size(X_trial)));

figure;
imagesc(EEG.times, 1:EEG.nbchan, X_trial);
axis xy;
xlabel('Time (s)');
ylabel('Channel');
title(sprintf('All channels (Trial %d)', trial_id));
colorbar;

% Interpretation (example):
% - This view shows spatial structure across channels and time simultaneously.
% - You can often spot channels with stronger rhythmic activity.

%% 3) Extract a TIME WINDOW for ALL channels in ONE trial
t_start = 1.0;
t_end   = 2.0;

idx = find(EEG.times >= t_start & EEG.times <= t_end);

X_win = squeeze(EEG.data(:, idx, trial_id)); % [nbchan × length(idx)]

fprintf('X_win size: %s\n', mat2str(size(X_win)));

figure;
imagesc(EEG.times(idx), 1:EEG.nbchan, X_win);
axis xy;
xlabel('Time (s)');
ylabel('Channel');
title(sprintf('Window %.1f–%.1f s (Trial %d)', t_start, t_end, trial_id));
colorbar;

% Interpretation (example):
% - Time windows are used for selecting baseline, stimulus response periods,
%   or specific segments (e.g., resting-state chunks).

%% 4) Extract ONE channel across ALL trials (time × trials)
X_ch_trials = squeeze(EEG.data(ch_theta, :, :)); % [pnts × trials]

fprintf('X_ch_trials size: %s\n', mat2str(size(X_ch_trials)));

figure;
plot(EEG.times, X_ch_trials(:, 1:10));
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('%s across 10 trials', EEG.chanlocs(ch_theta).labels));

% Interpretation (example):
% - The theta rhythm is present across trials, but noise changes each time.
% - This is why EEG analyses rely on summarising across repetitions.

%% 5) Compute across-trial average for one channel
avg = mean(X_ch_trials, 2); % average over trials -> [pnts × 1]

figure;
plot(EEG.times, avg, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('Across-trial average: %s', EEG.chanlocs(ch_theta).labels));

% Interpretation (example):
% - Random noise cancels out (partially) with averaging.
% - Consistent structure (theta rhythm) becomes clearer.

%% 6) Optional: compare theta vs alpha channels in frequency domain (one trial)
x_theta = squeeze(EEG.data(ch_theta, :, trial_id));
x_alpha = squeeze(EEG.data(ch_alpha, :, trial_id));

% Simple FFT-based power (not a "best practice" PSD—just a teaching demo)
N = EEG.pnts;
freqs = (0:N-1) * (EEG.srate / N);

X1 = fft(x_theta);
X2 = fft(x_alpha);

P1 = (abs(X1).^2) / N;
P2 = (abs(X2).^2) / N;

% Plot only up to 40 Hz for clarity
fmax = 40;
keep = freqs <= fmax;

figure;
plot(freqs(keep), P1(keep), 'LineWidth', 1.5); hold on;
plot(freqs(keep), P2(keep), 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Power (a.u.)');
title(sprintf('Power comparison (Trial %d): %s vs %s', trial_id, EEG.chanlocs(ch_theta).labels, EEG.chanlocs(ch_alpha).labels));
legend({sprintf('%s (theta)', EEG.chanlocs(ch_theta).labels), sprintf('%s (alpha)', EEG.chanlocs(ch_alpha).labels)}, 'Location', 'best');

% Interpretation (example):
% - The theta channel shows a stronger peak around ~6 Hz.
% - The alpha channel shows a stronger peak around ~10 Hz.
