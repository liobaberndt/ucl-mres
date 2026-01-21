# Session 5 - Convert to SPM and Final Checks

## What you will learn in this session
In this session you will:
- convert the cleaned EEGLAB dataset into SPM format
- understand why SPM format is used later in the project
- confirm that channel units are set correctly
- perform a final sanity check on outputs
- update the Methods section with the conversion step

This session finalises the preprocessing pipeline.

## Part 0 - Git workflow
Before starting this session, make sure your local repository is up to date:
```bash
git pull
```

After completing this session:
```bash
git add .
git commit -m "Session 5: SPM conversion"
git push
```

## Part A - Convert to SPM format
### A1. Run SPM conversion
Run:
```bash
teaching_step7_spm_convert
```

This script:
- loads the rereferenced dataset (*_fe_rej_ica_MARA_int_reref.set)
- converts it to SPM format
- saves an SPM file named spmeeg_<subject>_<condition>_teaching.mat
- ensures channel units are set to uV

### A2. Expected output
You should see:
- a saved SPM file (*.mat)
- a console message confirming the saved file

## Part B - Final checks
Check that:
- the SPM file exists in the output directory
- the number of channels matches your final EEG dataset
- no unexpected warnings were produced during conversion

## Part C - Reading: why SPM?
Read briefly about:
- why SPM is used in EEG/MEG analysis pipelines
- what advantages SPM provides for model‑based or spectral analyses
  - we will use SPM for our DCM afterwards

Suggested sources:
https://www.fil.ion.ucl.ac.uk/spm/docs/manual/meeg/eeg_overview/

Write 2–4 bullet notes:
- what SPM is used for in this project
- how it fits into later analyses

## Part D - Update Methods in Overleaf
Add a short note under Methods → Preprocessing:
- data converted from EEGLAB to SPM format for downstream analyses

## Session 5 checklist
You are finished with Session 5 if:
- teaching_step7_spm_convert.m runs successfully
- the SPM file exists in your output directory
- you added the conversion step to Overleaf

