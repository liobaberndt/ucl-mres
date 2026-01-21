% Teaching Step 3: Channel Rejection
% Loads epoched data and removes bad channels.

cfg = teaching_setup();

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    for e = 1:length(cfg.eyes)
        base_name = [subj_id '_' cfg.eyes{e}];
        input_set = fullfile(cfg.analys_path, subj_id, [base_name '_fe.set']);
        if exist(input_set, 'file') ~= 2
            fprintf('Skipping (missing): %s\n', input_set);
            continue;
        end
        EEG = pop_loadset(input_set);
        EEGchan_ind_without_ref = 1:EEG.nbchan;

        [~, ind_elecA_sp] = pop_rejchan(EEG, 'elec', EEGchan_ind_without_ref, ...
            'threshold', cfg.std_diff_chanrejA_spec, 'norm', 'on', 'measure', 'spec', 'freqrange', [1 70]);
        [~, ind_elecA_ku] = pop_rejchan(EEG, 'elec', EEGchan_ind_without_ref, ...
            'threshold', cfg.std_diff_chanrejA_kurt, 'norm', 'on', 'measure', 'kurt');
        ind_elecA_ku(ind_elecA_ku<6) = [];
        [~, ind_elecA_pr] = pop_rejchan(EEG, 'elec', EEGchan_ind_without_ref, ...
            'threshold', cfg.std_diff_chanrejA_prob, 'norm', 'on', 'measure', 'prob');

        rejA_chan = unique([ind_elecA_sp ind_elecA_ku ind_elecA_pr]);
        if cfg.teach_plots == 1 && ~isempty(rejA_chan)
            plot_rejected_channels_topo(EEG, rejA_chan, 'Channel rejection', cfg.pause_on_plots);
        end
        EEG = pop_select(EEG, 'nochannel', rejA_chan);
        EEG = eeg_checkset(EEG);

        the_name = [base_name '_fe_rej'];
        EEG.setname = the_name;
        pop_saveset(EEG, [the_name '.set'], fullfile(cfg.analys_path, subj_id));
        fprintf('Saved %s\n', fullfile(cfg.analys_path, subj_id, [the_name '.set']));
    end
end
