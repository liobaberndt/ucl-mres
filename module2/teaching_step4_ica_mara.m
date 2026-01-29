% Teaching Step 4: ICA + MARA
% Loads channel-rejected data, runs ICA, and applies MARA.

cfg = teaching_setup();

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    for e = 1:length(cfg.eyes)
        base_name = [subj_id '_' cfg.eyes{e}];
        input_set = fullfile(cfg.analys_path, subj_id, [base_name '_fe_rej.set']);
        if exist(input_set, 'file') ~= 2
            fprintf('Skipping (missing): %s\n', input_set);
            continue;
        end
        EEG = pop_loadset(input_set);

        % ICA
        EEG = pop_runica(EEG, 'icatype', 'sobi');
        EEG = eeg_checkset(EEG);
        the_name = [base_name '_fe_rej_ica'];
        EEG.setname = the_name;
        pop_saveset(EEG, [the_name '.set'], fullfile(cfg.analys_path, subj_id));
        fprintf('Saved %s\n', fullfile(cfg.analys_path, subj_id, [the_name '.set']));

        % MARA
        for run_MARA = cfg.MARA_options
            if run_MARA == 0
                fprintf('Skipping MARA for %s\n', base_name);
                continue;
            end
            EEG_dummy = EEG;
            EEG_dummy = eeg_checkset(EEG_dummy);
            [ALLEEG, EEG, CURRENTSET, rej_comp_id] = processMARA_kt_edit(ALLEEG, EEG, CURRENTSET, [0,0,0,0, cfg.auto_rej_MARA]);
            if cfg.teach_plots == 1
                plot_mara_rejection_summary(rej_comp_id, 'MARA component rejection', cfg.pause_on_plots);
            end
            if all(rej_comp_id)
                fprintf('All components rejected by MARA for %s; skipping\n', base_name);
                continue;
            end
            EEG = pop_subcomp(EEG, [], 0);
            EEG.setname = [the_name '_MARA'];
            EEG = eeg_checkset(EEG);
            pop_saveset(EEG, [EEG.setname '.set'], fullfile(cfg.analys_path, subj_id));
            fprintf('Saved %s\n', fullfile(cfg.analys_path, subj_id, [EEG.setname '.set']));
        end
    end
end
