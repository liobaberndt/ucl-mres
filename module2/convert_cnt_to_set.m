% convert_cnt_to_set.m
% Helper script to convert CNT files to EEGLAB .set format
% Run this ONCE before running teaching_step1_epoch.m
%
% This script handles the case where .set files exist but reference
% missing .fdt files. It imports the raw .cnt and saves as single-file .set.

cfg = teaching_setup();

fprintf('=== CNT to SET Conversion Helper ===\n\n');

for s = 1:length(cfg.subj)
    subj_id = cfg.subj{s}(1:cfg.fname_ltrs);
    fprintf('Processing subject: %s\n', subj_id);
    
    % Find CNT files
    cnt_files = dir(fullfile(cfg.data_path, subj_id, '*.cnt'));
    if isempty(cnt_files)
        fprintf('  No CNT files found for subject %s\n', subj_id);
        continue;
    end
    
    for c = 1:length(cnt_files)
        cnt_file = fullfile(cnt_files(c).folder, cnt_files(c).name);
        fprintf('  Found CNT: %s\n', cnt_files(c).name);
        
        % Determine expected output name based on CNT filename
        [~, cnt_base, ~] = fileparts(cnt_files(c).name);
        % Try to match pattern: 0001_032508_RestEyesOpen_RS_1 -> 0001_EO_f
        if contains(cnt_base, 'EyesOpen') || contains(cnt_base, 'EO')
            eye_cond = 'EO';
        elseif contains(cnt_base, 'EyesClosed') || contains(cnt_base, 'EC')
            eye_cond = 'EC';
        else
            eye_cond = 'EO'; % default
            fprintf('    Warning: Could not determine eye condition, defaulting to EO\n');
        end
        
        output_name = [subj_id '_' eye_cond '_f.set'];
        output_path = fullfile(cfg.data_path, subj_id, output_name);
        
        % Check if .set already exists and is valid
        if exist(output_path, 'file') == 2
            try
                test_EEG = pop_loadset(output_path);
                fprintf('    %s already exists and loads successfully. Skipping.\n', output_name);
                continue;
            catch
                fprintf('    %s exists but is invalid (missing .fdt?). Will recreate.\n', output_name);
            end
        end
        
        % Try to import CNT
        fprintf('    Attempting to import CNT file...\n');
        EEG = [];
        
        % Method 1: pop_loadcnt (if available)
        if exist('pop_loadcnt', 'file') == 2
            try
                fprintf('      Trying pop_loadcnt...\n');
                EEG = pop_loadcnt(cnt_file);
                fprintf('      Success!\n');
            catch
                fprintf('      pop_loadcnt failed.\n');
            end
        else
            fprintf('      pop_loadcnt not available.\n');
        end
        
        % Method 2: Try FieldTrip (via SPM) to read CNT, then convert to EEGLAB
        if isempty(EEG)
            try
                fprintf('      Trying FieldTrip (via SPM)...\n');
                % Check if FieldTrip functions are available
                if exist('ft_read_data', 'file') == 2 || exist('ft_read_header', 'file') == 2
                    % Read header and data using FieldTrip
                    hdr = ft_read_header(cnt_file);
                    dat = ft_read_data(cnt_file);
                    
                    % Convert FieldTrip structure to EEGLAB
                    EEG = eeg_emptyset();
                    EEG.data = dat;
                    EEG.setname = cnt_base;
                    EEG.filename = output_name;
                    EEG.filepath = fullfile(cfg.data_path, subj_id);
                    EEG.pnts = size(dat, 2);
                    EEG.nbchan = size(dat, 1);
                    EEG.srate = hdr.Fs;
                    EEG.times = (0:EEG.pnts-1) / EEG.srate;
                    EEG.xmin = EEG.times(1) / 1000; % convert to seconds
                    EEG.xmax = EEG.times(end) / 1000;
                    
                    % Set channel labels if available
                    if isfield(hdr, 'label') && length(hdr.label) == EEG.nbchan
                        for ch = 1:EEG.nbchan
                            EEG.chanlocs(ch).labels = hdr.label{ch};
                        end
                    else
                        % Create default channel labels
                        for ch = 1:EEG.nbchan
                            EEG.chanlocs(ch).labels = sprintf('E%d', ch);
                        end
                    end
                    
                    EEG = eeg_checkset(EEG);
                    fprintf('      Successfully imported via FieldTrip!\n');
                else
                    fprintf('      FieldTrip functions not available.\n');
                end
            catch ftErr
                fprintf('      FieldTrip import failed: %s\n', ftErr.message);
            end
        end
        
        % Method 3: Manual instructions if automatic import fails
        if isempty(EEG)
            fprintf('\n    *** AUTOMATIC IMPORT FAILED ***\n');
            fprintf('    Please convert manually using EEGLAB GUI:\n');
            fprintf('    1. Open EEGLAB\n');
            fprintf('    2. File > Import data > Using EEGLAB functions and file formats\n');
            fprintf('    3. Select: %s\n', cnt_file);
            fprintf('    4. Save as: %s\n', output_path);
            fprintf('    5. Choose "One file" format (not two-file with .fdt)\n\n');
            continue;
        end
        
        % Save as single-file .set
        fprintf('    Saving as single-file .set: %s\n', output_name);
        try
            pop_saveset(EEG, 'filename', output_name, ...
                       'filepath', fullfile(cfg.data_path, subj_id), ...
                       'savemode', 'onefile');
            fprintf('    ✓ Successfully saved %s\n\n', output_name);
        catch saveErr
            fprintf('    ✗ Failed to save: %s\n', saveErr.message);
        end
    end
end

fprintf('=== Conversion complete ===\n');
fprintf('You can now run teaching_step1_epoch.m\n');
