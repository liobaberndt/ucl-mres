% Teaching Step 6: Re-reference
% Loads interpolated data and re-references.

cfg = teaching_setup();

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    for e = 1:length(cfg.eyes)
        base_name = [subj_id '_' cfg.eyes{e}];
        input_set = fullfile(cfg.analys_path, subj_id, [base_name '_fe_rej_ica_MARA_int.set']);
        if exist(input_set, 'file') ~= 2
            fprintf('Skipping (missing): %s\n', input_set);
            continue;
        end
        EEG = pop_loadset(input_set);
        EEG_before = EEG;
        EEG = pop_reref(EEG, [], 'exclude', []); % average reference
        EEG = eeg_checkset(EEG);
        if cfg.teach_plots == 1
            plot_reref_summary(EEG_before, EEG, 'Average reference', cfg.pause_on_plots);
        end
        EEG.setname = [base_name '_fe_rej_ica_MARA_int_reref'];

        out_dir = fullfile(cfg.analys_path, subj_id);
        if ~exist(out_dir, 'dir'); mkdir(out_dir); end
        pop_saveset(EEG, [EEG.setname '.set'], out_dir);
        fprintf('Saved %s\n', fullfile(out_dir, [EEG.setname '.set']));
    end
end
