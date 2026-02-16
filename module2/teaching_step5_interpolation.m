% Teaching Step 5: Channel Interpolation
% Loads MARA data and interpolates removed channels.

cfg = teaching_setup();

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    for e = 1:length(cfg.eyes)
        base_name = [subj_id '_' cfg.eyes{e}];
        input_set = fullfile(cfg.analys_path, subj_id, [base_name '_fe_rej_ica_MARA.set']);
        if exist(input_set, 'file') ~= 2
            fprintf('Skipping (missing): %s\n', input_set);
            continue;
        end
        EEG = pop_loadset(input_set);
        EEG = eeg_checkset(EEG);
        [EEG, ~] = drop_non_eeg_channels(EEG, cfg.discard_m1_m2);

        % Use the original filtered set as interpolation template
        ref_set = fullfile(cfg.data_path, subj_id, [base_name '_f.set']);
        if exist(ref_set, 'file') ~= 2
            fprintf('Skipping (missing ref): %s\n', ref_set);
            continue;
        end
        EEG_ref = pop_loadset(ref_set);
        [EEG_ref, ~] = drop_non_eeg_channels(EEG_ref, cfg.discard_m1_m2);
<<<<<<< HEAD


=======
>>>>>>> d1903f377bfa0b8abd5ae2cc0133089dc0e77b41
        if cfg.teach_plots == 1
            ref_labels = {EEG_ref.chanlocs.labels};
            cur_labels = {EEG.chanlocs.labels};
            missing = setdiff(ref_labels, cur_labels, 'stable');
            if ~isempty(missing)
                missing_idx = find(ismember(ref_labels, missing));
                plot_rejected_channels_topo(EEG_ref, missing_idx, ...
                    'Interpolated channels (missing after rejection)', cfg.pause_on_plots);
            end
        end
        EEG_interp = pop_interp(EEG, EEG_ref.chanlocs, 'spherical');
        EEG_interp = eeg_checkset(EEG_interp);
        EEG_interp.setname = [base_name '_fe_rej_ica_MARA_int'];

        out_dir = fullfile(cfg.analys_path, subj_id);
        if ~exist(out_dir, 'dir'); mkdir(out_dir); end
<<<<<<< HEAD
        pop_saveset(EEG_interp, 'filename', [EEG_interp.setname '.set'], 'filepath', out_dir);
=======
        pop_saveset(EEG_interp, [EEG_interp.setname '.set'], out_dir);
>>>>>>> d1903f377bfa0b8abd5ae2cc0133089dc0e77b41
        fprintf('Saved %s\n', fullfile(out_dir, [EEG_interp.setname '.set']));
    end
end
