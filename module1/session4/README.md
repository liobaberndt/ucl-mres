## Session 4 - From Time Series to Spectra + Managing Papers with Zotero
Pull from github

### What you will learn in this session
In this session you will:
- move from time-domain signals to frequency-domain representations
- explore power spectra of noisy EEG-like signals
- learn how to organise and store papers using Zotero
- expand your reading base in a structured way

This session prepares you for working with intrinsic EEG features later in the project.

---

## Part A - Why we move to the frequency domain

EEG signals are noisy and variable in the time domain.
Many stable features become clearer when signals are represented
in the frequency domain.

Power spectra allow us to:
- summarise long, noisy signals
- identify dominant frequencies
- compare signals in a robust way

---

## Part B - Coding: spectra and power

### B1. Example: frequency content of a clean signal
Open and run:

```bash
# example script: FFT and spectrum of a clean signal
01_example_fft_signal.m
```

Observe:
- the relationship between time-domain and frequency-domain representations
- how a single dominant frequency appears in the spectrum

---

### B2. Exercise: changing signal parameters
Open:

```bash
# exercise: explore how frequency and duration affect spectra
02_exercise_fft_parameters.m
```

Complete the TODOs to:
- change signal frequency
- change signal duration
- observe how the spectrum changes

---

### B3. Example: clean vs noisy signals in the frequency domain
Open and run:

```bash
# example: comparing clean and noisy signals using power spectra
03_example_noise_vs_signal_psd.m
```

Compare:
- time-domain appearance
- frequency-domain stability

---

### B4. Exercise: comparing spectra across noisy signals
Open:

```bash
# exercise: compare power spectra across noisy signals
04_exercise_psd_comparison.m
```

Complete the TODOs to:
- generate multiple noisy signals
- compute their power spectra
- compare them visually

---

## Part C — Managing papers with Zotero

As you begin reading more papers, it is important to store and organise them
consistently.

Zotero is a tool for:
- saving PDFs
- keeping track of papers
- attaching informal notes

---

### C1. Install Zotero
Install:
- the Zotero desktop application
- the Zotero browser connector

---

### C2. Create a project collection
In Zotero, create a collection for this project.
---

### C3. Add papers to Zotero
Add the papers listed below to your Zotero collection using the browser connector.

For each paper:
- make sure the PDF is attached
- add 2–3 informal bullet-point notes in Zotero

---

## Part D — Suggested papers

Add the following papers to your Zotero collection.

### Paper 1
Clementz et al.  
*Psychosis Biotypes: Replication and Validation from the B-SNIP Consortium*

---

### Paper 2
Newson & Thiagarajan
*EEG Frequency Bands in Psychiatric Disorders: A Review of Resting State Studies*

---

### Paper 3
Insel et al. 
*Research Domain Criteria (RDoC): Toward a New Classification Framework for Research on Mental Disorders*

---

### Paper 4
Chen, Kiebel, Friston 
*Dynamic causal modelling of induced responses*

---
## Part E - Reading task

You are not expected to read all papers in detail yet.

For each paper:
- skim the paper
- look at figures
- add short notes in Zotero about the main take away messages

This is an exploratory step.
You will return to these papers later.

Push to github
---

## Session 4 checklist
You are finished with Session 4 if:
- you ran all example scripts
- you completed the spectrum exercises
- you installed Zotero
- you created a project-specific Zotero collection
- you added the listed papers to Zotero
- you added brief notes to each paper

---

"## Important note
Understanding will develop over time.
These papers will be revisited as your coding skills and modelling tools expand.
