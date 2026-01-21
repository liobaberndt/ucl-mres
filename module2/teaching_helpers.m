function plot_epoch_rejection_summary(EEG, step_label, pause_on_plots)
% Plot epoch rejection mask and counts.
    if ~isfield(EEG, 'reject') || ~isfield(EEG.reject, 'rejglobal')
        fprintf('Skipping epoch summary (%s): no rejection info.\n', step_label);
        return;
    end
    rej = EEG.reject.rejglobal;
    if isempty(rej)
        fprintf('Skipping epoch summary (%s): empty rejection vector.\n', step_label);
        return;
    end
    fprintf('Teaching plot: %s\n', step_label);
    figure('Position', get(0, 'Screensize'));
    subplot(2, 1, 1);
    stem(rej, 'Marker', 'none');
    title([step_label ' - Rejected epochs (1 = reject)']);
    xlabel('Epoch'); ylabel('Reject');
    ylim([-0.1 1.1]);
    grid on;
    subplot(2, 1, 2);
    bar([sum(rej), numel(rej) - sum(rej)]);
    set(gca, 'XTickLabel', {'Rejected','Kept'});
    ylabel('Count');
    title([step_label ' - Rejection summary']);
    if pause_on_plots == 1
        fprintf('Press any key to continue after examining the plot...\n');
        pause;
    end
end

function plot_rejected_channels_topo(EEG, rejA_chan, step_label, pause_on_plots)
% Plot topography marking rejected channels.
    if ~exist('topoplot', 'file')
        fprintf('Skipping channel topo (%s): topoplot not available.\n', step_label);
        return;
    end
    if isempty(rejA_chan) || all(rejA_chan == 0)
        fprintf('Skipping channel topo (%s): no rejected channels.\n', step_label);
        return;
    end
    fprintf('Teaching plot: %s\n', step_label);
    figure('Position', get(0, 'Screensize'));
    vals = zeros(1, EEG.nbchan);
    vals(rejA_chan) = 1;
    topoplot(vals, EEG.chanlocs, 'style', 'map', 'electrodes', 'on');
    title([step_label ' - Rejected channels (marked)']);
    if pause_on_plots == 1
        fprintf('Press any key to continue after examining the plot...\n');
        pause;
    end
end

function plot_mara_rejection_summary(rej_comp_id, step_label, pause_on_plots)
% Plot MARA component rejection mask and counts.
    if isempty(rej_comp_id)
        fprintf('Skipping MARA summary (%s): empty rejection vector.\n', step_label);
        return;
    end
    fprintf('Teaching plot: %s\n', step_label);
    figure('Position', get(0, 'Screensize'));
    subplot(2, 1, 1);
    stem(rej_comp_id, 'Marker', 'none');
    title([step_label ' - Components rejected (1 = reject)']);
    xlabel('Component'); ylabel('Reject');
    ylim([-0.1 1.1]);
    grid on;
    subplot(2, 1, 2);
    bar([sum(rej_comp_id), numel(rej_comp_id) - sum(rej_comp_id)]);
    set(gca, 'XTickLabel', {'Rejected','Kept'});
    ylabel('Count');
    title([step_label ' - Summary']);
    if pause_on_plots == 1
        fprintf('Press any key to continue after examining the plot...\n');
        pause;
    end
end
