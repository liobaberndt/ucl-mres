# Session 2 - Epoch Rejection and Channel Rejection

## What you will learn in this session
In this session you will:
- run epoch-level artifact rejection
- understand why epochs are removed and how thresholds work
- identify bad channels and remove them
- visualise rejected epochs and channels
- update the Methods section with these preprocessing steps

This session focuses on cleaning data before ICA/MARA.

## Part 0 - Git workflow
Before starting this session, make sure your local repository is up to date:
```bash
git pull
```

After completing this session:
```bash
git add .
git commit -m "Session 2: epoch + channel rejection"
git push```


## Part A - Run epoch rejection
### A1. Run the epoch rejection script
Run:
```bash
teaching_step2_epoch_reject
```

This script:
- loads the epoched dataset (*_fe.set)
- rejects epochs based on thresholding, trends, spectrum, probability, and kurtosis
- saves the cleaned dataset (*_fe.set)
- shows a rejection summary plot

### A2. Expected output
You should see:
- a plot showing which epochs were rejected
- counts of rejected vs kept epochs

## Part B - Run channel rejection
### B1. Run the channel rejection script
Run:
```bash
teaching_step3_channel_reject
```

This script:
- loads the epoch‑cleaned data
- flags noisy channels using spectral, kurtosis, and probability criteria
- removes those channels
- saves the dataset (*_fe_rej.set)
- shows a topoplot of rejected channels

### B2. Expected output
You should see:
- a topoplot marking rejected channels

## Part C - Reading: artifact rejection and bad channels
Read briefly about:
- why epoch‑level rejection is used in EEG preprocessing
- common criteria for rejecting channels (noise, variance, spectral outliers)

Suggested sources:
- EEGLAB tutorial sections on artifact rejection
- a resting‑state EEG methods paper (focus on “artifact rejection” and “bad channels”)

Write 3–5 bullet notes:
- which rejection methods are used
- what thresholds or criteria are common
- why channel rejection is done before ICA

## Part D - Update Methods in Overleaf
Add preprocessing text under Methods → Preprocessing:
- epoch rejection (mention multiple criteria: threshold, trend, spectrum, probability, kurtosis)
- channel rejection (spectral, kurtosis, probability outliers)
- note that rejected channels will be interpolated later

## Session 2 checklist
You are finished with Session 2 if:
- teaching_step2_epoch_reject.m runs successfully
- teaching_step3_channel_reject.m runs successfully
- you saw the rejection plots
- you added the epoch + channel rejection steps to Overleaf
