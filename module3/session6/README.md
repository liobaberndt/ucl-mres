# Session 6 - Source Reconstruction in MATLAB (SPM)

## What you will learn in this session
In this session you will:
- prepare the SPM M/EEG dataset for source reconstruction
- build a forward model
- compute source power images
- export a source image for later analysis

## Part 0 — Git workflow
Before starting:
```bash
git pull
```

After completing:
```bash
git add .
git commit -m "Module 3 Session 6: source reconstruction"
git push
```

## Part A - Source Reconstruction
Adjust teh script to wpkr for resting state data 
```bash
% -------------------------------------------------------------------------
% Script: SPM 
% Dataset: NAPLS
% Neuroimaging: EEG/ERP
% Paradigmn: MMN
% Author: Lioba Berndt
% Date: 30/03/2023
% Topic: Source Reconstruction
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Set paths
% -------------------------------------------------------------------------
  data_path = '/Volumes/T7/NAPLS2/MMN/SPMdata/';
  subj_path = '/Volumes/T7/NAPLS2/NAPLS2 ERP Data/';
  subj_folders   = dir(fullfile(data_path,'dspm*.mat'));
  save_path = '/Volumes/T7/NAPLS2/MMN/Source Reconstruction/';
  spm_path  = '/Users/liobaberndt/Desktop/spm_materials/';
  recon_path  = '/Volumes/T7/NAPLS2/MMN/Source Reconstruction/';
  save_folders = {'HC','ChrN'};
  output_path = '/Volumes/T7/NAPLS2/MMN/Source Reconstruction/'; 

  addpath(spm_path, data_path, save_path, recon_path)
  spm('defaults', 'eeg');
% -------------------------------------------------------------------------
% Load subject sheet
% ------------------------------------------------------------------------- 
  cd(subj_path)
  subj_sheet = readtable('MMN Database March 2022 share.csv');
  subj_sheet = subj_sheet(:,[3,4,6]);
  subj =subj_sheet.(1); %(1:end,1)
  subj = string(subj);
% -------------------------------------------------------------------------
% Start SPM
% -------------------------------------------------------------------------
  spm('Defaults','eeg');
  spm_jobman('initcfg');
% -------------------------------------------------------------------------
% Settings Source Reconstruction
% -------------------------------------------------------------------------
  i           = 1;
  val         = 1;                    % Choose source recon number (care not to overwrite previous ones)
  method      = 'IID';                % Choose source recon method
  comment     = 'IID';                % Priors on sources: MSP (i.e. GS + ARD), GS, ARD, LOR or IID
  fwd_model   = 'EEG BEM';            % Choose forward model type
  inv_smooth  = 0.4;                  % Smoothness of source priors (mm)
  Np          = 64;                   % Number of sparse priors (x 1/2)
  hpf         = 48;                   % Low-pass filter (default is 48)
  useheadshape = 0;
  woi         = [50 350];           % Peristimulus time (ms) e.g. [-999  2996], [250 2000] for MMN
 % fboi        = [37 43];            % Frequency window (Hz) for alpha, low/high beta, gamma e.g. [37 43] for MMN
  type        = 'evoked';             % Induced or evoked
  con_smooth  = 8;                    % Contrast FWHM (mm) e.g. default = 8
% -------------------------------------------------------------------------
% Exclusion and inclusion subjects
% -------------------------------------------------------------------------
%  filePattern = fullfile(data_path,'dspmeeg_NAPLS*1mmnfasterERP.mat');
%  matFiles = dir(filePattern);
%  for k = 1:length(matFiles) %subj_num
%      spmdata = subj_folders(k);
%      matFilename = fullfile(data_path, matFiles(k).name);
%      subj_num = extractBetween(matFilename, "dspmeeg_NAPLS-", "mmnfasterERP.mat");
%      subj_num = string(subj_num);
%      if contains(subj_num, subj) == 1
%         index = find(strcmp(subj_sheet.mmn_file, subj_num)==1);
%         Exclude = subj_sheet(index, "Exclude");
%         Exclude = Exclude{:,:};
%         if Exclude == 0  
% -------------------------------------------------------------------------
% Source reconstruction
% -------------------------------------------------------------------------
        D                   = spm_eeg_load('/Volumes/T7/NAPLS2/MMN/SPMdata/grand_mean.mat');
        D.val               = val;
        D.inv{val}.method   = method;
        D.inv{val}.comment  = comment;
        D.inv{val}.date     = strvcat(date,datestr(now,15));
%--------------------------------------------------------------------------
% Specify cortical mesh size (1 to 4; 1 = 3004, 4 = 7204 dipoles)
%--------------------------------------------------------------------------
        Msize = 2;
%--------------------------------------------------------------------------
% Use a template head model and associated meshes
%--------------------------------------------------------------------------
        D = spm_eeg_inv_mesh_ui(D, val, 1, Msize);
%--------------------------------------------------------------------------
% Determine the modality of the data (EEG or MEG)
%--------------------------------------------------------------------------
        modality = D.modality;
        if ~ismember(modality, {'EEG', 'MEG', 'Multimodal'})
            error('Unsupported modality')
        end
%--------------------------------------------------------------------------        
% Compute head model
%--------------------------------------------------------------------------
        % D = spm_eeg_inv_datareg_ui(D, 1, modality);
        D = spm_eeg_inv_datareg_ui(D, val); % via GUI
%--------------------------------------------------------------------------        
% Compute a forward model
%--------------------------------------------------------------------------
       % D = spm_eeg_inv_forward_ui(D); % via GUI
        i = 1; % one type of data
        D.inv{val}.forward = struct([]);
        D.inv{val}.forward(i).voltype = fwd_model;
        D = spm_eeg_inv_forward(D,val);
        if ~spm('CmdLine')
            spm_eeg_inv_checkforward(D, val);
        end
%--------------------------------------------------------------------------        
% Invert forward model
%--------------------------------------------------------------------------
        D.inv{val}.inverse.trials = D.condlist; % Trials
        D.inv{val}.inverse.type   = D.inv{val}.comment;
        D.inv{val}.inverse.smooth = inv_smooth;
        D.inv{val}.inverse.Np     = Np;
        D.inv{val}.inverse.hpf    = hpf;
        D = spm_eeg_invert(D);
%--------------------------------------------------------------------------        
% Compute conditional expectation of mean square (MS) response
%--------------------------------------------------------------------------
        D.inv{val}.contrast.woi  = woi;
       % D.inv{val}.contrast.fboi = fboi;
        D.inv{val}.contrast.type = type;
        D = spm_eeg_inv_results(D);
        D.inv{D.val}.contrast.smooth  = con_smooth; 
        D.inv{D.val}.contrast.display = 0;
        D = spm_eeg_inv_Mesh2Voxels(D,val); 
        cd(D.path)
        save(D)    
        movefile('*.nii', output_path)
%    else
%        return
%         end 
%      end
%  end
```

## Part B - Writing task (short)
Write 6–10 bullets:
- which source method you used and why
- which frequency band you modeled
- which assumptions were made (template  etc.)
- how you will report source results in the preregistration an what would you use it for

## Session 6 checklist
You are finished if:
- you built a forward model in SPM
- you computed a source power image
- you exported a NIfTI file
- you completed the writing task

