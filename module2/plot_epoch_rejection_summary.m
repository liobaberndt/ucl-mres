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
