% 01_example_eeg_dimensions.m
% Session 7 — Example: dimensions of EEG data
%
% Goal:
% - understand how EEG is typically represented as a 3D array:
%   channels × time × trials
% - learn how metadata (sampling rate, time vector, channel labels) connects
%   to the data
%
% This is NOT real EEG. It's a small simulated EEG-like dataset.

clear; close all; clc;

%% Create a mock EEG structure
EEG = struct();

EEG.nbchan = 32;          % number of channels
EEG.srate  = 250;         % Hz
EEG.pnts   = 1000;        % time points per trial (e.g., 4 seconds at 250 Hz)
EEG.trials = 60;          % number of trials/epochs

EEG.times = (0:EEG.pnts-1) / EEG.srate; % seconds, starts at 0 for simplicity

% Channel labels
EEG.chanlocs = struct('labels', cell(1, EEG.nbchan));
for ch = 1:EEG.nbchan
    EEG.chanlocs(ch).labels = sprintf('Ch%02d', ch);
end

% Create EEG-like data: random noise + a weak 10 Hz rhythm in some channels
EEG.data = randn(EEG.nbchan, EEG.pnts, EEG.trials) * 5; % baseline noise amplitude

t = EEG.times;
alpha = sin(2*pi*10*t); % 10 Hz

alpha_channels = [5 12 20]; % a few channels have a weak alpha component
for tr = 1:EEG.trials
    for ch = alpha_channels
        EEG.data(ch, :, tr) = EEG.data(ch, :, tr) + 2 * alpha; % add weak oscillation
    end
end

%% Inspect dimensions
fprintf('EEG.data size: %s\n', mat2str(size(EEG.data)));
fprintf('Interpretation: [channels × time points × trials]\n\n');

fprintf('nbchan: %d\n', EEG.nbchan);
fprintf('pnts:   %d\n', EEG.pnts);
fprintf('trials: %d\n', EEG.trials);
fprintf('srate:  %d Hz\n', EEG.srate);
fprintf('duration per trial: %.2f s\n\n', EEG.pnts / EEG.srate);

%% Access examples (indexing basics)
ch = 12;
tr = 7;

one_epoch_one_channel = squeeze(EEG.data(ch, :, tr));  % time series for channel ch, trial tr
one_epoch_all_channels = squeeze(EEG.data(:, :, tr));  % channels × time, for one trial
one_channel_all_trials = squeeze(EEG.data(ch, :, :));  % time × trials, for one channel

fprintf('Example access:\n');
fprintf('- Channel %d, Trial %d -> time series length: %d\n', ch, tr, numel(one_epoch_one_channel));
fprintf('- Trial %d -> matrix size (channels × time): %s\n', tr, mat2str(size(one_epoch_all_channels)));
fprintf('- Channel %d -> matrix size (time × trials): %s\n\n', ch, mat2str(size(one_channel_all_trials)));

%% Plot one channel in one trial
figure;
plot(EEG.times, one_epoch_one_channel);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title(sprintf('Example time series: %s (Trial %d)', EEG.chanlocs(ch).labels, tr));

%% Plot a quick "stack" of a few channels (same trial)
channels_to_plot = [1 5 12 20];
trial_to_plot = 1;

X = squeeze(EEG.data(channels_to_plot, :, trial_to_plot));
% offset for visibility
offset = (0:numel(channels_to_plot)-1)' * 40;
X_offset = X + offset;

figure;
plot(EEG.times, X_offset');
xlabel('Time (s)');
ylabel('Amplitude + offset (a.u.)');
title(sprintf('Multiple channels (Trial %d) — stacked', trial_to_plot));
yticks([]); % cleaner look
legend({EEG.chanlocs(channels_to_plot).labels}, 'Location', 'bestoutside');

%% Key takeaways (read, don’t code)
% - EEG.data is typically channels × time × trials.
% - You must always know what each axis represents.
% - Metadata like srate and times are needed to interpret the numbers.
