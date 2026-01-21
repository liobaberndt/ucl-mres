# Session 3 - ICA, MARA, and Component Rejection

## What you will learn in this session
In this session you will:
- run ICA on cleaned EEG data
- understand why ICA is used in EEG preprocessing
- use MARA to identify artifact components
- remove artifact components and save the cleaned dataset
- update the Methods section with ICA/MARA details

This session focuses on removing systematic artifacts (eye, muscle, ECG) using ICA.

## Part 0 - Git workflow
Before starting this session, make sure your local repository is up to date:
```bash
git pull
```

After completing this session:
```bash
git add .
git commit -m "Session 3: ICA + MARA"
git push
```

## Part A - Run ICA
### A1. Run the ICA + MARA script
Run:
```bash
teaching_step4_ica_mara
```

This script:
- loads channel‑rejected data (*_fe_rej.set)
- runs ICA (SOBI)
- saves the ICA dataset (*_fe_rej_ica.set)

### A2. Expected output
You should see:
- an ICA dataset saved to disk

## Part B - Run MARA and remove components
### B1. MARA classification
The same script will:
- run MARA on the ICA decomposition
- generate a rejection mask for components
- show a rejection summary plot (kept vs rejected)

### B2. Component removal
It then:
- removes rejected components
- saves the cleaned dataset (*_fe_rej_ica_MARA.set)

## Part C - Reading: ICA and MARA
Read briefly about:
- what ICA does in EEG preprocessing
- how MARA (or similar classifiers) decide what is artifact

Suggested sources:
- EEGLAB ICA tutorial
- MARA paper or documentation

Write 3–5 bullet notes:
- why ICA is used before interpolation/rereferencing
- how components are classified as artifact
- typical artifact types removed

## Part D - Update Methods in Overleaf
Add preprocessing text under Methods → Preprocessing:
- ICA method used (SOBI)
- automated component classification with MARA
- removal of artifact components

## Session 3 checklist
You are finished with Session 3 if:
- teaching_step4_ica_mara.m runs successfully
- you saw the MARA rejection summary plot
- the *fe_rej_ica_MARA.set dataset is saved
- you added ICA + MARA to Overleaf
