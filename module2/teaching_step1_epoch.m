% Teaching Step 1: Epoching
% Loads filtered data and creates epochs.

cfg = teaching_setup();

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    for e = 1:length(cfg.eyes)
        base_name = [subj_id '_' cfg.eyes{e}];
        input_set = fullfile(cfg.data_path, subj_id, [base_name '_f.set']);
        if exist(input_set, 'file') ~= 2
            fprintf('Skipping (missing): %s\n', input_set);
            continue;
        end
        EEG = pop_loadset(input_set);
        if cfg.plot_PSDs == 1
            EEG_plot = pop_select(EEG, 'channel', 1:EEG.nbchan);
            figure('Position', get(0, 'Screensize'));
            title([ strrep(base_name, '_' , ' ') ' - FILTERED DATA (BEFORE EPOCHING)'])
            pop_spectopo(EEG_plot, 1, [0 EEG.times(end)], 'EEG', ...
                'freq', [2 6 8 10 18 22 30 45], 'percent', 100, 'freqrange', [0 48]);
            if cfg.pause_on_plots == 1
                fprintf('Press any key to continue after examining the plot...\n');
                pause;
            end
            clear EEG_plot
        end
        % Drop non-EEG channels before epoching to keep labels/chanlocs aligned
        [EEG, dropped_labels] = drop_non_eeg_channels(EEG, cfg.discard_m1_m2);
        if ~isempty(dropped_labels)
            fprintf('Dropped non-EEG channels: %s\n', strjoin(dropped_labels, ', '));
        end

        if cfg.epoch_par == 1
            EEG = eeg_regepochs(EEG, 'recurrence', cfg.epoch_length/2, ...
                'limits', [0 cfg.epoch_length]);
        end
        the_name = [base_name '_fe'];
        EEG.setname = the_name;
        EEG = eeg_checkset(EEG);
        out_dir = fullfile(cfg.analys_path, subj_id);
        if ~exist(out_dir, 'dir'); mkdir(out_dir); end
        pop_saveset(EEG, [the_name '.set'], out_dir);
        fprintf('Saved %s\n', fullfile(out_dir, [the_name '.set']));
    end
end
