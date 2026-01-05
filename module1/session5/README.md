## Session 5 - Interpreting Multi-Frequency Spectra + Writing in LaTeX

### What you will learn in this session
In this session you will:
- work with spectra that contain multiple frequency components
- become familiar with writing in LaTeX using Overleaf
- create a properly formatted thesis document

---

## Part A - Why this session matters

So far, you have explored:
- noisy signals
- variability
- spectra in the frequency domain

Real EEG signals contain **multiple frequency components at the same time**.
Understanding EEG therefore requires learning how to:
- interpret multi-band spectra
- describe spectral patterns clearly in text

At the same time, scientific writing is an essential research skill.
In this session, writing is treated as a **core part of the workflow**.

---

## Part B - Coding: interpreting multi-frequency spectra

In this session, simulated signals contain **several frequencies simultaneously**,
producing spectra with multiple peaks, similar to intrinsic EEG activity.

---

### B1. Example: multi-frequency signal and spectrum
Open and run:

```bash
# example: spectrum of a signal containing multiple frequencies
01_example_multifrequency_spectrum.m
```

Observe:
- multiple peaks across the frequency axis
- how different frequency ranges contribute at the same time

---

### B2. Exercise: changing band dominance
Open:

```bash
# exercise: explore how changing amplitudes affects spectral dominance
02_exercise_band_dominance.m
```

Complete the TODOs to:
- change the relative amplitudes of frequency components
- observe how spectral dominance shifts across bands

Answer the interpretation questions directly in the script as comments.

---

## Part C - EEG frequency bands: orientation

EEG frequency bands are commonly used to summarise spectral information.

Typical bands include:
- Delta (≈ 1–4 Hz)
- Theta (≈ 4–8 Hz)
- Alpha (≈ 8–12 Hz)
- Beta (≈ 13–30 Hz)
- Gamma (> 30 Hz)

Important points:
- frequency bands are descriptive conventions
- interpretations depend on context

---

## Part D - Writing in LaTeX with Overleaf

In this project, all writing will be done in **LaTeX using Overleaf**. You can also use word but I would strongly recommend Overleaf!
Formatting and structure matter and are part of the learning process.

---

### D1. Create an Overleaf project
Create an overleaf account: https://www.overleaf.com
Create a new Overleaf project for your thesis.

Use:
- a university thesis template if available, or
- there are MANY videos on YouTube so would recommend watching one of them

---

### D2. Add authors
Add the following email address as a co-author:
- lioba.berndt@gmail.com

This way I can directly comment on your thesis/make chnages in real-time

---

## Part E — Creating a structured outline

In your LaTeX document, create the following sections using proper LaTeX commands:

- Introduction
- Background / Literature
- Methods
- Results
- Discussion
- Conclusion

Use `\section{}` and `\subsection{}` etc. 
You can find the appropirate LaTex commands online or ask ChatGPT

---

## Part F - Writing: background and interpretation

I think it makes sense start writing ypoutr thesis as early as possible. 
So start adding some bullet-points/sentences to your background section + think how you want to structure your background.
The papers in session 4 should give a good starting point (e.g., what is psychosis, biotypes, EEG, resting-state EEG, DCM etc.)

---

## Session 5 checklist
You are finished with Session 5 if:
- you ran all Session 5 coding scripts
- you practised interpreting multi-band spectra
- you created an Overleaf project
- you created a structured LaTeX outline
- you wrote initial background text using LaTeX formatting

---

