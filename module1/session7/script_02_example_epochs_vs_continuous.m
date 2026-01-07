% 02_example_epochs_vs_continuous.m
% Session 7 — Example: continuous data vs epochs
%
% Goal:
% - understand "continuous EEG" (one long recording) vs "epoched EEG"
%   (many short segments/trials)
% - see how epoching is basically slicing continuous data into windows

clear; close all; clc;

%% Parameters
srate = 250;          % Hz
duration_sec = 120;   % 2 minutes of "continuous" data
n_samples = duration_sec * srate;

t = (0:n_samples-1) / srate;

%% Create continuous signal (1 channel for simplicity)
% Noise + slow drift + occasional alpha bursts
noise = randn(1, n_samples) * 5;

drift = 15 * sin(2*pi*0.1*t); % slow 0.1 Hz drift
alpha = sin(2*pi*10*t);       % 10 Hz component

% Create random "alpha burst" envelope
env = zeros(1, n_samples);
burst_centers = sort(randi([srate*5, n_samples - srate*5], 1, 12)); % 12 bursts
burst_width = srate * 1.5; % ~1.5 s width

for c = burst_centers
    idx = max(1, c-burst_width):min(n_samples, c+burst_width);
    % gaussian-ish bump
    w = linspace(-2, 2, numel(idx));
    env(idx) = env(idx) + exp(-w.^2);
end
env = min(env, 1); % cap at 1

continuous = noise + drift + (env .* 8 .* alpha);

%% Plot a short window of the continuous data
win_sec = 10;
win_samp = win_sec * srate;

figure;
plot(t(1:win_samp), continuous(1:win_samp));
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title('Continuous EEG-like signal (first 10 seconds)');

%% Define events and epoch around them
% In real EEG, events might be stimulus onsets, responses, markers, etc.
% Here we create fake events at random times.
n_events = 40;
event_samples = sort(randi([srate*5, n_samples - srate*5], 1, n_events));

% Epoch window: -0.5 to +1.5 seconds around event
tmin = -0.5; % s
tmax =  1.5; % s

epoch_pnts = round((tmax - tmin) * srate) + 1;
epoch_times = (0:epoch_pnts-1) / srate + tmin;

% Preallocate epoched data: time × trials (single channel)
epochs = zeros(epoch_pnts, n_events);

for i = 1:n_events
    center = event_samples(i);
    start_idx = center + round(tmin*srate);
    end_idx   = center + round(tmax*srate);

    epochs(:, i) = continuous(start_idx:end_idx);
end

fprintf('Continuous data length: %d samples (%.1f s)\n', n_samples, duration_sec);
fprintf('Epoched data size: %s [time × trials]\n', mat2str(size(epochs)));
fprintf('Epoch duration: %.2f s\n\n', tmax - tmin);

%% Plot a few epochs overlaid
figure;
plot(epoch_times, epochs(:, 1:10));
xlabel('Time (s) relative to event');
ylabel('Amplitude (a.u.)');
title('Example epochs (10 trials overlaid)');
xline(0, '--', 'Event');

%% Plot the average epoch (ERP-like)
avg_epoch = mean(epochs, 2);

figure;
plot(epoch_times, avg_epoch, 'LineWidth', 2);
xlabel('Time (s) relative to event');
ylabel('Amplitude (a.u.)');
title('Average across epochs (ERP-like summary)');
xline(0, '--', 'Event');

%% Key takeaways (read, don’t code)
% - Continuous EEG is one long recording.
% - Epoching slices it into repeated windows aligned to events.
% - Many analyses (ERP, time-frequency) operate on epoched data.
