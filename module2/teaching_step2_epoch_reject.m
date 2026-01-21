% Teaching Step 2: Epoch Rejection
% Loads epoched data and removes bad epochs.

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

        EEG_dummy = EEG;
        EEG_dummy.data = bsxfun(@rdivide,(bsxfun(@minus, EEG_dummy.data, mean(EEG_dummy.data,2))), std(EEG_dummy.data,0,2));
        EEG_dummy = pop_eegthresh(EEG_dummy, 1, EEGchan_ind_without_ref, ...
            cfg.reject_min_std_epoch, cfg.reject_max_std_epoch, EEG.xmin, EEG.xmax, 2, 0);
        EEG.reject = EEG_dummy.reject;
        clear EEG_dummy

        EEG = pop_rejtrend(EEG, 1, EEGchan_ind_without_ref, 1000, cfg.maxslope, cfg.minR, 1, 0, 0);
        EEG = pop_rejspec_kt_edit(EEG, 1, EEGchan_ind_without_ref, -50, 50, 0, 2, 1, 0);
        EEG = pop_rejspec_kt_edit(EEG, 1, EEGchan_ind_without_ref, -100, 25, 20, 40, 1, 0);

        EEG = pop_jointprob(EEG, 1, EEGchan_ind_without_ref, cfg.std_locthresholdA_epoch, ...
            cfg.std_globthresholdA_epoch, 1,0,1,[],0);
        EEG = pop_rejkurt(EEG, 1, EEGchan_ind_without_ref, cfg.std_locthresholdA_epoch, ...
            cfg.std_globthresholdA_epoch, 1,0,1,[],0);

        EEG = eeg_rejsuperpose(EEG, 1, 0, 1, 1, 1, 1, 1, 1);
        EEG = pop_rejepoch(EEG, EEG.reject.rejglobal, 0);
        EEG = eeg_checkset(EEG);
        if cfg.teach_plots == 1
            plot_epoch_rejection_summary(EEG, 'Epoch rejection', cfg.pause_on_plots);
        end

        the_name = [base_name '_fe'];
        EEG.setname = the_name;
        pop_saveset(EEG, [the_name '.set'], fullfile(cfg.analys_path, subj_id));
        fprintf('Saved %s\n', fullfile(cfg.analys_path, subj_id, [the_name '.set']));
    end
end
