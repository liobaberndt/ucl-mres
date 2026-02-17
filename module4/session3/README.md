# Session 3: One Subject - Decide Settings, Adjust Code, Run, Check Model Fit

## What you will learn in this session

In this session you will:

- **decide on settings** for the DCM (data, sources, design, PSD options, priors) before running
- **adjust the dcm_ei code** so it runs on **one subject** from your dataset, using **data from Module 3** (the SPM-processed data produced there)
- **run** the full pipeline for that subject (specify → invert)
- **inspect model fit** (e.g. predicted vs observed spectra, residuals)
- write the **Methods** for this one-subject analysis in **Overleaf** (thesis)

We do not run multiple subjects or group-level analysis here; that is for after pre-registration.

---

## Part 0 – Git workflow

Before starting:

```bash
git pull
```

After completing:

```bash
git add .
git commit -m "Module 4 Session 3: one-subject DCM run + model fit + Methods in Overleaf"
git push
```

---

## Part A - Decide settings before running

Before you run anything, document (in a short checklist or script header) your choices for:

### A1. Data

- **Input data**: Use the **data from Module 3** (the SPM files and associated data you produced there). Which **one subject** (ID/code) and which **SPM file** (path, e.g. `spmeeg_*_*.mat`) from the Module 3 output.
- **Sensors / channels**: Which sensor-level data to use e.g. **all sensors**, **specific channels** (list or mask), or **averaged** over a subset (e.g. frontal, or ROI-based). This should match your preprocessing and what you plan to pre-register (e.g. “we use the average over channels X, Y, Z” or “we use all EEG channels”).
- Epoch/trial structure or continuous segment used for PSD (e.g. time window, conditions).

### A2. Model specification

- **Sources / nodes**: The E/I model does **not** fix the number of sources. **we choose sources based on our source reconstruction** (or theoretical/paradigm-based choice). You might use **1 source**, or 4, or 6, etc., depending on what your source reconstruction supports and what you want to test. Decide: which regions (coordinates or labels), and **how many** (e.g. single source vs multi-region network). Document this clearly for the pre-registration.
- **Design**: Which conditions or trial types

### A3. Inversion / PSD

- Frequency range for PSD (e.g. 1–48 Hz or as in dcm_ei examples).
- Any prior or integration settings you are using (default dcm_ei/SPM or as in the preprint).

Keep this list; you will reuse it in the pre-registration (Session 5–6).

---

## Part B - Adjust code and run for one subject

### B1. Set paths and subject

- In the dcm_ei repo (or a small wrapper script in this module folder), set:
  - Path to the **one subject’s SPM file**.
  - Path to save the estimated DCM (e.g. `DCM_*.mat`).
- Use the dcm_ei README and example scripts to see how to call the specification and inversion for your data format.

### B2. Run specification and inversion

- Run the steps that (1) build the DCM structure for this subject and (2) invert it (fit the model to the PSD).
- Note any errors or warnings; fix paths or options as needed. Do not change the *design* of the analysis (sources, design, E/I model) without noting it for the pre-registration.

### B3. Save outputs

- Ensure the inverted DCM is saved (posterior estimates, fit, etc.) so you can inspect fit in the next part.

---

## Part C - Inspect model fit for this one subject

- **Predicted vs observed**: Plot or inspect predicted spectra (and/or time series if relevant) vs observed data (e.g. at channel or source level as in dcm_ei/SPM).
- **Qualitative check**: Does the model capture the main features of the data (e.g. peaks, frequency range)? Note any limitations in your Overleaf Methods.

Use SPM/dcm_ei plotting utilities or write a short script that loads the estimated DCM and produces one or two summary figures. You can keep the script in this repo; document in Overleaf what was done.

---

## Part D - Writing in Overleaf (thesis)

In your **Overleaf thesis project**, add to the **Methods**:

1. **DCM for PSD**: Brief sentence that analysis was done with DCM for PSD using the E/I canonical microcircuit (Hauke et al., 2025; dcm_ei).
2. **Data**: One subject; which dataset, preprocessing, and SPM file; **which sensors/channels** (all, specific, or averaged); epoch/segment used for PSD.
3. **Specification**: Sources/nodes (number and choice, based on our source reconstruction), design (conditions, input), frequency range; that g_ee and g_ii were estimated.
4. **Inversion**: That the model was inverted (variational Laplace in SPM); no group-level analysis yet.
5. **Model fit**: How you assessed fit (e.g. predicted vs observed spectra, residuals) and that the pipeline was validated on this one subject for pre-registration purposes.

---

## Session 3 checklist

You are finished if:

- you have decided and written down the settings (data, sources, design, PSD, priors) before running
- you have run the full pipeline for one subject and saved the DCM output
- you have inspected model fit (predicted vs observed, and optionally residuals) and noted the outcome
- you have added the one-subject DCM Methods to Overleaf (thesis)
- you have committed and pushed any scripts or notes to the repo

