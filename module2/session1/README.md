# Session 1 - Setting Up the EEG Teaching Pipeline
General note: This may feel like a lot at first. The goal is not to understand every line of code, but to understand the big steps (e.g., filtering, epoching) and why we do them. You’ll need to adjust file paths so the scripts run on your laptop - debugging missing paths/functions is normal and part of the process. If anything feels too much, we can walk through it together. I will send you a folder called EEG_Code/. Copy it into the eeglab folder you have when you downloaded eeglab.

## What you will learn in this session
In this session you will:
- set up paths for EEGLAB, SPM, and the teaching scripts
- ask me for the EEG code with the extra helper functions
- run the first teaching script (teaching_step1_epoch.m)
- understand what “epoching” is and why we do it
- review what filtering means and why it was done before this pipeline
- write the preprocessing steps into the Methods section in Overleaf

This session is about environment setup + first run, not full analysis.

## Part 0 - Git workflow
Before starting this session, make sure your local repository is up to date:
```bash
git pull
```

After completing this session:
```bash
git add .
git commit -m "Session 1: teaching setup + epoching"
git push
```

## Part A - Set up paths and toolboxes
### A1. Check your toolbox paths
You need to know where these are installed:
- EEGLAB folder
- SPM12 folder
- the teaching scripts folder (this repo)

### A2. Confirm teaching_setup.m settings
Open teaching_setup.m and set your paths (you'll see in the script where and currently it's set to use mine number 5; you need to replace 5 with any number >5).
- cfg.eeglab_path points to EEGLAB
- cfg.spm_path points to SPM12
- cfg.script_path points to this repo
- cfg.data_path points to your EEG dataset folder
- cfg.analys_path points to your processed output folder

Run teaching_setup.m once to confirm it loads without errors.

## Part B - Ask me for the eeeg helper functions

## Part C - Run the first teaching script (+ try to understand what we are doing here at a high level - don't get lost in code details!!)

### C1. Start with Step 1
Run:
```bash
teaching_step1_epoch
```

This script:
- loads filtered EEG data (*_f.set)
- removes non‑EEG channels (EOG/ECG/EMG, and M1/M2 if set)
- creates fixed-length epochs
- saves the epoched dataset

### C2. Expected output
You should see:
- a PSD plot of the filtered data before epoching
- the saved dataset: *_fe.set

## Part D - Reading: what is epoching?
Epoching means splitting continuous EEG into smaller time windows (epochs), usually of equal length.
Why we do it:
- makes data more comparable across time
- allows artifact rejection at the trial level
- prepares data for later analyses (ICA, averaging, time‑frequency)

Suggested reading:
https://eeglab.org/tutorials/ (here filtering and epoching)

Write 3–5 bullet notes:
- how long the epochs are (clue: teaching_setup.m has the asnwers)
- why that length was chosen
- how artifact rejection is described

## Part E - Reminder: filtering happened earlier
This pipeline starts from filtered data (*_f.set).
Filtering was done previously to remove:
- slow drifts (high‑pass)
- line noise and high‑frequency noise (low‑pass)

## Part F - Write Methods text in Overleaf
Add a preprocessing subsection in your Overleaf Methods section.
Include, in order:
- data filtering (high‑pass + low‑pass applied previously)
- non‑EEG channel removal (EOG/ECG/EMG, optionally M1/M2)
- epoching (fixed‑length epochs, include epoch length)
- note that later steps include artifact rejection, ICA/MARA, interpolation

## Session 1 checklist
You are finished with Session 1 if:
- toolboxes and paths load correctly
- you sent the EEG code + helper functions to the project owner
- teaching_step1_epoch.m runs successfully
- you saw the PSD plot
- you wrote notes on what epoching is and why it matters
- you wrote the preprocessing steps in Overleaf





