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
        try
            EEG = pop_loadset(input_set);
        catch ME
            % Common teaching-repo issue: .set references an external .fdt that
            % wasn't distributed via git/LFS. Fall back to importing raw .cnt
            % and saving a single-file .set at the expected path.
            fdt_path = strrep(input_set, '.set', '.fdt');
            if contains(ME.message, '.fdt') || exist(fdt_path, 'file') ~= 2
                fprintf('Missing associated .fdt for %s\n', input_set);
                fprintf('Falling back to importing raw .cnt and saving single-file .set...\n');

                cnt_candidates = dir(fullfile(cfg.data_path, subj_id, '*.cnt'));
                if isempty(cnt_candidates)
                    error('Cannot find CNT file to import. Original error: %s', ME.message);
                end
                cnt_file = fullfile(cnt_candidates(1).folder, cnt_candidates(1).name);

                % Try multiple methods to load CNT file
                EEG = [];
                
                % Method 1: Try pop_loadcnt if available (may require plugin)
                try
                    if exist('pop_loadcnt', 'file') == 2
                        fprintf('Attempting to load CNT via pop_loadcnt...\n');
                        EEG = pop_loadcnt(cnt_file);
                        fprintf('Successfully loaded CNT via pop_loadcnt.\n');
                    end
                catch
                    fprintf('pop_loadcnt not available or failed.\n');
                end
                
                % Method 2: Try loading .set metadata and workaround
                if isempty(EEG)
                    try
                        fprintf('Loading .set file metadata (without data)...\n');
                        % Load .set file structure - this will fail on data loading
                        % but we can catch that and work with metadata
                        tmp = load(input_set, '-mat');
                        if isfield(tmp, 'EEG')
                            EEG_meta = tmp.EEG;
                            fprintf('Loaded metadata. Note: This .set file expects external .fdt file.\n');
                            fprintf('The CNT file (%s) needs to be converted to .set format.\n', cnt_file);
                            fprintf('Please use MATLAB EEGLAB GUI: File > Import data > Using EEGLAB functions and file formats\n');
                            fprintf('Or install EEGLAB File-IO plugin for CNT support.\n');
                            error(['Cannot automatically import CNT. Please manually convert %s to .set format ', ...
                                   'using EEGLAB GUI, then rerun this script.'], cnt_file);
                        end
                    catch metaErr
                        if contains(metaErr.message, 'Cannot automatically import')
                            rethrow(metaErr);
                        end
                        fprintf('Metadata loading also failed.\n');
                    end
                end
                
                if isempty(EEG)
                    fprintf('\n=== IMPORTANT: CNT to SET conversion needed ===\n');
                    fprintf('Run this helper script first:\n');
                    fprintf('  >> convert_cnt_to_set\n\n');
                    fprintf('Or manually convert using EEGLAB GUI:\n');
                    fprintf('  File > Import data > Using EEGLAB functions\n');
                    fprintf('  Select: %s\n', cnt_file);
                    fprintf('  Save as single-file .set format\n\n');
                    error(['Cannot import CNT automatically. ', ...
                           'Please run convert_cnt_to_set.m first, or convert manually. ', ...
                           'Original error: %s'], ME.message);
                end
                
                % Save as single-file .set (no .fdt needed)
                fprintf('Saving imported data as single-file .set...\n');
                pop_saveset(EEG, 'filename', [base_name '_f.set'], ...
                    'filepath', fullfile(cfg.data_path, subj_id), ...
                    'savemode', 'onefile');
                fprintf('Saved single-file .set. Reloading...\n');
                EEG = pop_loadset(input_set);
            else
                rethrow(ME);
            end
        end
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
