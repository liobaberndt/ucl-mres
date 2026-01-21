# Session 4 - Interpolation and Re‑referencing

## What you will learn in this session
In this session you will:
- interpolate previously rejected channels
- understand why interpolation is done after ICA/MARA
- apply average re‑referencing
- visualise what changes after rereferencing
- update the Methods section with these steps

This session prepares the cleaned data for final analysis and conversion.

## Part 0 - Git workflow
Before starting this session, make sure your local repository is up to date:
```bash
git pull
```

After completing this session:
```bash
git add .
git commit -m "Session 4: interpolation + reref"
git push
```

## Part A - Interpolate bad channels
### A1. Run interpolation
Run:
```bash
teaching_step5_interpolation
```

This script:
- loads the MARA‑cleaned dataset (*_fe_rej_ica_MARA.set)
- uses the original filtered dataset as a location template
- interpolates channels that were previously removed
- saves the interpolated dataset (*_fe_rej_ica_MARA_int.set)
- shows a topoplot highlighting interpolated channels

### A2. Expected output
You should see:
- a plot showing which channels were interpolated

## Part B - Re‑reference
### B1. Run average reference
Run:
```bash
teaching_step6_reref
```

This script:
- loads the interpolated dataset
- applies average reference
- saves the rereferenced dataset (*_fe_rej_ica_MARA_int_reref.set)
- shows a plot of channel‑mean distributions before vs after reref

## Part C - Reading: interpolation and referencing
Read briefly about:
- why bad channels are interpolated
- why average reference is used in EEG

Suggested sources:
- EEGLAB tutorial on channel interpolation
- an EEG preprocessing methods section (focus on referencing)

Write 3–5 bullet notes:
- when interpolation is appropriate
- why interpolation is done after ICA
- what average reference changes in the data

## Part D - Update Methods in Overleaf
Add preprocessing text under Methods → Preprocessing:
- interpolation of rejected channels (spherical, using template positions)
- average reference applied after interpolation

## Session 4 checklist
You are finished with Session 4 if:
- teaching_step5_interpolation.m runs successfully
- teaching_step6_reref.m runs successfully
- you saw the interpolation and reref plots
- you added interpolation + rereferencing to Overleaf
