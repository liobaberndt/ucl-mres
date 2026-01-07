## Session 7 - What EEG Data Actually Are (and Preparing for Methods)
### What you will learn in this session
In this session you will:
learn how EEG data are structured (channels × time × trials)
understand the difference between continuous data and epochs
practise indexing and inspecting EEG-like data structures
connect EEG data structure to real analysis pipelines
return to the main paper with a focus on Methods
This session marks the transition from conceptual understanding to methodological orientation.
### Part 0 - Git workflow
Before starting this session, make sure your local repository is up to date.
```bash
git pull
```
After completing this session:
commit your changes regularly
push them to GitHub
```bash
git add .
git commit -m "Session 7: EEG data structure and methods orientation"
git push
```
### Part A - Why this session matters
So far, you have worked with:
- simulated signals
- noise and variability
- spectra and averaging
- conceptual properties of Intrinsic EEG Activity (IEA)

However, to understand real EEG analyses, it is essential to know how EEG data are organised and accessed.
EEG data consist of:
- multiple channels
- many time points
- repeated trials or epochs
- often multiple subjects and conditions

### Part B - Coding: EEG data structure
#### B1. Example: dimensions of EEG data
Open and run:
```bash
01_example_eeg_dimensions.m
```
This script demonstrates:
- how EEG data are represented as multi-dimensional arrays
- the meaning of each dimension (channels, time, trials)

Focus on:
- how array dimensions map onto experimental concepts
- how EEG data are indexed in practice
#### B2. Example: continuous data vs epochs
Open and run:
```bash
02_example_epochs_vs_continuous.m
```
This script illustrates:
- the difference between continuous EEG recordings and epoched data
- why epoching is commonly used in EEG analysis
#### B3. Exercise: indexing EEG data
Open:
```bash
03_exercise_indexing_eeg.m
```
Complete the TODOs to:
- extract specific channels
- select time windows
- access individual trials
- Answer interpretation questions directly in the script as comments.

### Part C - Returning to the main paper: Methods focus
You were introduced to the main paper in Session 3, where the focus was on:
- the concept of Intrinsic EEG Activity (IEA)
- the main findings and figures

In this session, you will return to the same paper, but with a different goal.

Your focus now is the Methods section.

As you read, aim to understand:
- how EEG data are structured and segmented
- how spectral and IEA-related features are extracted
- how these features enter the biotypes analysis

### Part D - Writing: beginning the Methods section
From this session onward, you should begin drafting a Methods section for your thesis.

At this stage:
- write at a high, descriptive level
- focus on data types and overall analysis logic
- base your structure on the Methods section of the paper

### Part E - Looking ahead
The long-term goal of this project is to:
- replicate psychosis biotypes using the IEA framework
- later provide mechanistic interpretation using computational models

Dynamic Causal Modelling (DCM) will be introduced in later sessions.

You do not need to write DCM-related methods yet.

### Session 7 checklist
You are finished with Session 7 if:
- you ran all Session 7 coding scripts
- you understand how EEG data are structured
- you can explain the difference between continuous and epoched data
- you re-read the Methods section of the main paper with an EEG focus
- you started a high-level draft of your Methods section


