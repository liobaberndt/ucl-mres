## Session 6 - From Single Spectra to Stable Summaries
### What you will learn in this session
In this session you will:
- work with multiple repetitions (epochs) of the same signal
- explore variability across spectra
- learn how averaging stabilises spectral estimates
- recognise oscillatory peaks on top of a broadband spectral background
- practise interpreting spectral summaries
This session bridges the gap between single simulated signals and the way EEG data are analysed.
---
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
git commit -m "Session 6: averaging spectra and spectral summaries"
git push
```
---
### Part A - Why this session matters
So far, you have worked with:
- noisy signals
- variability
- spectra in the frequency domain
- signals containing multiple frequency components
However, EEG data are never interpreted based on a single realisation.
EEG signals consist of:
- many repetitions
- many noisy observations of the same underlying neural processes
This session addresses a core question in EEG analysis:
If every spectrum looks slightly different, how do we extract something stable and interpretable?
---
### Part B - Coding: variability across epochs
#### B1. Example: multiple epochs of the same signal
Open and run:
```bash
01_example_multiple_epochs.m
```
This script simulates:
- many repetitions of the same underlying signal
- with added noise in each epoch
Observe:
- how time series differ across epochs
- how spectra vary even when the generating process is identical
---
#### B2. Example: averaging spectra
Open and run:
```bash
02_example_average_spectrum.m
```
This script:
- computes spectra for many epochs
- averages them into a single summary spectrum
Observe:
- how individual spectral peaks fluctuate
- how the average spectrum is smoother and more stable
- how dominant frequency components emerge clearly after averaging
---
#### B3. Exercise: epoch variability and stability
Open:
```bash
03_exercise_epoch_variability.m
```
Complete the TODOs to:
- vary the number of epochs
- compare single-epoch spectra to averaged spectra
- explore how stability improves with more repetitions
Answer the interpretation questions directly in the script as comments.
---
### Part C - Oscillatory peaks and broadband background
So far, simulated spectra often showed clear oscillatory peaks on relatively flat backgrounds.
Real EEG spectra are different.
They typically show:
- distinct oscillatory peaks
- sitting on top of a broadband background that decreases with frequency
Key points:
- the broadband component is always present
- oscillatory activity appears as peaks on top of this background
- averaging helps reveal both components more clearly
---
### Part D - Ongoing thesis writing
Continue developing the Introduction/Background section of your thesis in Overleaf.

---
### Session 6 checklist
You are finished with Session 6 if:
- you ran all Session 6 coding scripts
- you explored variability across epochs
- you computed and interpreted averaged spectra
- you can explain why averaging is essential in EEG analysis
- you continued developing your Introduction/Background
---
