function plot_reref_summary(EEG_before, EEG_after, step_label, pause_on_plots)
% Plot channel-mean distributions before/after average reference.
    if isempty(EEG_before.data) || isempty(EEG_after.data)
        fprintf('Skipping reref summary (%s): empty data.\n', step_label);
        return;
    end
    fprintf('Teaching plot: %s\n', step_label);
    before_means = mean(EEG_before.data, [2 3]);
    after_means = mean(EEG_after.data, [2 3]);

    figure('Position', get(0, 'Screensize'));
    subplot(2, 1, 1);
    histogram(before_means, 30);
    title([step_label ' - Channel means (before)']);
    xlabel('Mean (uV)'); ylabel('Count');
    grid on;

    subplot(2, 1, 2);
    histogram(after_means, 30);
    title([step_label ' - Channel means (after avg ref)']);
    xlabel('Mean (uV)'); ylabel('Count');
    grid on;

    if pause_on_plots == 1
        fprintf('Press any key to continue after examining the plot...\n');
        pause;
    end
end
