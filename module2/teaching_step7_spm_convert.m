% Teaching Step 7: Convert to SPM
% Loads re-referenced data and converts to SPM format.

cfg = teaching_setup();

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    for e = 1:length(cfg.eyes)
        base_name = [subj_id '_' cfg.eyes{e}];
        input_set = fullfile(cfg.analys_path, subj_id, [base_name '_fe_rej_ica_MARA_int_reref.set']);
        if exist(input_set, 'file') ~= 2
            fprintf('Skipping (missing): %s\n', input_set);
            continue;
        end
        EEG = pop_loadset(input_set);
        EEG = eeg_checkset(EEG);

        clean_data = input_set;
        spm_filename = ['spmeeg_' base_name '_teaching'];
        S = [];
        S.dataset = clean_data;
        S.outfile = spm_filename;
        S.timewin = [];
        S.checkboundary = 1;
        S.eventpadding = 0;
        S.saveorigheader = 0;
        S.conditionlabels = {'Undefined'};
        S.inputformat = [];
        S.mode = 'epoched';
        D = spm_eeg_convert(S);

        % Fix units
        clear D;
        load([spm_filename, '.mat']);
        for c = 1:length(D.channels)
            D.channels(c).units = 'uV';
        end
        save([spm_filename, '.mat'],'D');

        fprintf('SPM file saved: %s.mat\n', spm_filename);
    end
end
