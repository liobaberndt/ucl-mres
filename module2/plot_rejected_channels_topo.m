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
