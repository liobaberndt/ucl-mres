## Session 3 - Noise, Variability, and Intrinsic EEG Activity (IEA)
First run in the terminal: git pull

### What you will learn in this session
In this session you will:
- explore how noise affects signals
- see how the same underlying signal can look different across repetitions
- practise visually inspecting data
- start reading a key paper that we will return to multiple times during this project

This session connects toy signals to real EEG data.

---

## Part A - Why noise and variability matter

Real EEG data are not clean sine waves.  
They are noisy, variable, and messy - even when the underlying neural process is similar.

Before analysing or modelling EEG data, it is essential to:
- look at the data
- understand how noise changes appearance
- recognise which features are stable and which vary

The coding exercises in this session use simple signals as a **cartoon version of EEG**.

---

## Part B - Coding: noise and signal inspection

### B1. Example: clean vs noisy signal
Open and run:

```bash
# example script comparing a clean and a noisy signal
01_example_clean_vs_noisy.m
```

This script:
- creates a clean sine wave
- adds random noise
- plots the clean and noisy signals side by side

Observe:
- the underlying signal is still present
- noise makes the signal harder to see
- visual inspection is essential

---

### B2. Exercise: changing noise strength
Open:

```bash
# exercise script: explore different noise levels
02_exercise_noise_level.m
```

Complete the TODOs to:
- generate a clean signal
- add noise with different strengths
- compare low-noise and high-noise cases

Run the script multiple times.  
Notice that the noise changes each time.

---

### B3. Example: variability across repetitions
Open and run:

```bash
# example script: variability across repeated noisy signals
03_example_variability.m
```

This script:
- generates the same underlying signal multiple times
- adds noise independently each time
- shows how repeated observations differ

Key idea:  
Noise is unpredictable, but the signal structure is consistent.

---

### B4. Exercise: comparing multiple noisy signals
Open:

```bash
# exercise script: compare several noisy versions of the same signal
04_exercise_variability.m
```

Complete the TODOs to:
- generate several noisy versions of the same signal
- plot them for comparison

This prepares you for thinking about trials, epochs, and averaging later.

---

## Part C - Paper reading: first pass (Intrinsic EEG Activity)

In this project, we will work towards reproducing EEG findings from a key paper  
and later explaining them mechanistically using DCM. This paper (also available in the folder): https://pmc.ncbi.nlm.nih.gov/articles/PMC8781330/pdf/sbab090.pdf

This session is your **first pass** at reading the paper.  
You are not expected to understand everything.

You will read the paper **multiple times** during this project.

---

### C1. What this first read is for
The goal of this read is to:
- understand what the authors mean by *Intrinsic EEG Activity (IEA)*
- identify where IEA appears in the paper
- get a sense of the main IEA findings
---

### C2. What to read
Read through the paper once, focusing on:
- Abstract
- Introduction (big picture only)
- Methods sections that mention **Intrinsic EEG Activity (IEA)**
- Results and figures that report IEA findings
- Discussion paragraphs interpreting IEA

You can ignore other biomarkers and technical details for now.

---

### C3. What to write
After your first read, write short bullet points answering the following:

1. What do the authors mean by “Intrinsic EEG Activity (IEA)” in this paper?
   - In what context is it measured?
   - Is it resting, task-related, or between-stimulus activity?

2. What EEG features are extracted as IEA?
   - For example: frequency bands, spectral power, sensors, regions

3. Where are the main IEA results shown?
   - List the relevant figure and/or table numbers

4. What are the headline IEA findings?
   - Describe the direction or type of differences in simple terms

5. What parts were unclear or confusing on this first read?
   - List questions or unfamiliar terms

Bullet points are fine.  
You do not need to write full paragraphs.

---

### C4. Saving your notes
Save your notes as a text or Markdown file:

```bash
# file to create with your reading notes
iea_reading_notes.md
```

Place it in this session’s folder and commit it to GitHub.

---

## Session 3 checklist
You are finished with Session 3 if:
- you ran all example scripts
- you completed the noise and variability exercises
- you read the paper once with a focus on IEA
- you wrote and committed your IEA reading notes

---

