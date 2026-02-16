function cfg = teaching_setup()
% Shared setup for teaching scripts (paths, parameters, subjects).

    % Parameters (keep in sync with main script)
<<<<<<< HEAD
    cfg.computer = 6;
=======
    cfg.computer = 5;
>>>>>>> d1903f377bfa0b8abd5ae2cc0133089dc0e77b41
    cfg.fname_ltrs = 4;
    cfg.load_runs = 1;
    cfg.plot_PSDs = 1;
    cfg.pause_on_plots = 1;
    cfg.teach_plots = 1;
    cfg.epoch_par = 1;
    cfg.epoch_length = 2;
    cfg.reject_min_std_epoch = -8;
    cfg.reject_max_std_epoch = 8;
    cfg.maxslope = 6;
    cfg.minR = 0.8;
    cfg.std_locthresholdA_epoch = 5;
    cfg.std_globthresholdA_epoch = 4;
    cfg.std_diff_chanrejA_spec = [-4 6];
    cfg.std_diff_chanrejA_kurt = [-7 15];
    cfg.std_diff_chanrejA_prob = [-9 7];
    cfg.auto_rej_MARA = 0;
    cfg.MARA_options = [0 1];
    cfg.discard_m1_m2 = 1;
    cfg.eyes = {'EC','EO'};

    % Paths
    if cfg.computer == 1
        cfg.script_path = '/Data/Tsirlis/Final_Code/';
        cfg.data_path   = '/Data/BSNIP/EEG/BSNIPeeg/data_528_RestEyesOpen/';
        cfg.analys_path = '/Data/Tsirlis/test_scripts/';
        cfg.spm_path    = '/Code/SPM/spm12/';
        cfg.eeglab_path = '/Code/eeglab14_1_0b/';
    elseif cfg.computer == 4
        cfg.script_path = '/Users/rickadams/Dropbox/Rick/Academic/Anticevic/EEG_Code/';
        cfg.data_path   = '/Volumes/RickAdams5TB/Data/BSNIP/rsEEG_data/';
        cfg.analys_path = '/Data/BSNIP/rsEEG_preprocessed_v2/';
        cfg.spm_path    = '/Code/SPM/spm12/';
        cfg.eeglab_path = '/Code/eeglab14_1_0b/';
    elseif cfg.computer == 2
        cfg.script_path = 'C:\Users\Konstantinos Tsirlis\Dropbox\My Desktop\Rick Adams\EEG_Analysis (Tsirlis)\Final_Code\';
        cfg.data_path   = 'C:\Users\Konstantinos Tsirlis\Dropbox\My Desktop\Rick Adams\EEG_Analysis (Tsirlis)\Data\';
        cfg.analys_path = 'C:\Users\Konstantinos Tsirlis\Dropbox\My Desktop\Rick Adams\EEG_Analysis (Tsirlis)\test_scripts\';
        cfg.spm_path    = 'C:\Users\Konstantinos Tsirlis\Dropbox\My Desktop\Rick Adams\EEG_Analysis (Tsirlis)\spm12\';
        cfg.eeglab_path = 'C:\Users\Konstantinos Tsirlis\Dropbox\My Desktop\Rick Adams\EEG_Analysis (Tsirlis)\eeglab14_1_0b\';
    elseif cfg.computer == 3
        cfg.script_path = '/home/ktsirlis/matlab/Final_Code/';
        cfg.data_path   = '/data/ktsirlis/Data/';
        cfg.analys_path = '/data/ktsirlis/test_scripts/';
        cfg.spm_path    = '/home/ktsirlis/matlab/spm12/';
        cfg.eeglab_path = '/home/ktsirlis/matlab/eeglab14_1_0b/';
    elseif cfg.computer == 5
        cfg.script_path = '/Users/liobaberndt/Library/CloudStorage/Dropbox/UCL/0001/0001_032508_RestEyesOpen_RS_1/';
        cfg.data_path   = '/Users/liobaberndt/Library/CloudStorage/Dropbox/UCL/0001/0001_032508_RestEyesOpen_RS_1/';
        cfg.analys_path = '/Users/liobaberndt/Library/CloudStorage/Dropbox/UCL/0001/0001_032508_RestEyesOpen_RS_1/processed/';
        cfg.spm_path    = '/Users/liobaberndt/Desktop/spm_materials/';
        cfg.eeglab_path = '/Users/liobaberndt/Desktop/eeglab2023.0/';
<<<<<<< HEAD
    elseif cfg.computer == 6
        cfg.script_path = '/Users/sachapopa/Documents/ucl-mres/module2/';
        cfg.data_path   = '/Users/sachapopa/Documents/ucl-mres/module2/';
        cfg.analys_path = '/Users/sachapopa/Documents/ucl-mres/module2/processed/';
        cfg.spm_path    = '/Users/sachapopa/Documents/5 archive/Software/spm/';
        cfg.eeglab_path = '/Users/sachapopa/Documents/5 archive/Software/eeglab2025.1.0/EEG_Code';
=======
>>>>>>> d1903f377bfa0b8abd5ae2cc0133089dc0e77b41
    else
        cfg.script_path = '';
        cfg.data_path   = '';
        cfg.analys_path = '';
        cfg.spm_path    = '';
        cfg.eeglab_path = '';
    end

    if ~exist(cfg.analys_path, 'dir')
        mkdir(cfg.analys_path);
    end

    addpath(cfg.spm_path, cfg.analys_path, cfg.eeglab_path, cfg.script_path);
    addpath(genpath(cfg.script_path));
    addpath(genpath(cfg.data_path));
    eeglab('nogui');
    spm('defaults', 'eeg');

    % Load channel labels if present
    if exist(fullfile(cfg.script_path, 'chanlocs.mat'), 'file') == 2
        tmp = load(fullfile(cfg.script_path, 'chanlocs.mat'));
        if isfield(tmp, 'chanlocs')
            cfg.chanlocs = tmp.chanlocs;
        end
    end

    % Subject discovery: use folder names only
    subj_struct = dir(cfg.data_path);
    valid_subj = {};
    for s = 1:length(subj_struct)
        fname = subj_struct(s).name;
        if fname(1) ~= '.' && subj_struct(s).isdir && ...
           ~strcmpi(fname, 'processed') && ~strcmpi(fname, 'functions') && ...
           ~strcmpi(fname, 'Analysis') && ~strcmpi(fname, 'Raw')
            if length(fname) >= cfg.fname_ltrs && all(isstrprop(fname(1:cfg.fname_ltrs), 'digit'))
                valid_subj{end+1} = fname; %#ok<AGROW>
            end
        end
    end
    if isempty(valid_subj)
        error('No subject folders found in data directory.');
    end
    cfg.subj = valid_subj;

    % Auto-detect available conditions for the first subject (teaching convenience)
    if ~isempty(cfg.subj)
        subj_id = cfg.subj{1}(1:cfg.fname_ltrs);
        ec_set = fullfile(cfg.data_path, subj_id, [subj_id '_EC_f.set']);
        eo_set = fullfile(cfg.data_path, subj_id, [subj_id '_EO_f.set']);
        has_ec = exist(ec_set, 'file') == 2;
        has_eo = exist(eo_set, 'file') == 2;
        if has_ec && ~has_eo
            cfg.eyes = {'EC'};
        elseif has_eo && ~has_ec
            cfg.eyes = {'EO'};
        end
    end
end
