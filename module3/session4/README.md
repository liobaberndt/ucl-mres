# Session 4 - FOOOF in Brainstorm (Demo First, Then Our Subject)

## What you will learn in this session
In this session you will:
- run the Brainstorm FOOOF demo on example data
- understand the main FOOOF settings and outputs
- translate those settings to our own subject
- decide which channel strategy to use (single, ROI, or global)

This session is tutorial‑first. No coding script yet.

## Part 0 - Git workflow
Before starting:
```bash
git pull
```

After completing:
```bash
git add .
git commit -m "Module 3 Session 4: FOOOF demo and subject settings"
git push
```

## Part A - Run the Brainstorm demo
Complete the Brainstorm FOOOF tutorial (demo data):
https://neuroimage.usc.edu/brainstorm/Tutorials/Fooof?highlight=%28fooof%29

While you do it, note:
- where FOOOF is run in Brainstorm (process menu)
- required inputs (Welch PSD files)
- key settings (frequency range, peak width limits, max peaks, minimum peak height)
- outputs (aperiodic parameters, peak parameters, goodness‑of‑fit)

## Part B - Translate to our subject
Decide how you will apply FOOOF to our subject:
- which channels or averages to use (based on Session 3 choices)
- whether to run single‑channel, ROI averages, or global average
- whether to exclude any channels

## Part C - Run FOOOF on our subject (Brainstorm)
Apply the same Brainstorm FOOOF process (MATLAB implementation) to your subject data:
1. In Brainstorm, load your subject PSD files into Process1.
2. Run **Frequency > FOOOF: Fitting oscillations and 1/f** with the same settings from the demo.
3. Save the FOOOF outputs and export parameters to MATLAB.
4. Record the file names you created.

## Part D - Reading
Read the FOOOF overview page:
https://fooof-tools.github.io/fooof/

Write down:
- what FOOOF separates (aperiodic vs periodic)
- what the aperiodic component represents
- which settings matter most for reproducibility

## Part E - Writing task (pre‑registration decision note)
Write 10–14 bullets:
- which Brainstorm FOOOF settings you will use for our subject
- the frequency range and why
- whether to ignore line‑noise frequencies
- maximum number of peaks and minimum peak height
- whether you will use fixed or knee aperiodic mode
- how you will evaluate goodness‑of‑fit
- how you will report aperiodic exponent and peak parameters
- how your channel strategy (single/ROI/global) links to Session 3
- any deviations from the demo defaults and why

## Session 4 checklist
You are finished if:
- you completed the Brainstorm FOOOF demo
- you decided how to apply FOOOF to our subject
- you ran FOOOF on our subject data in Brainstorm
- you read the FOOOF overview page
- you wrote the pre‑registration decision note
