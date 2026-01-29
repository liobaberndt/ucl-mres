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
