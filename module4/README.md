# Module 4: DCM for PSD and E/I Balance: From Theory to Pre-Registration

This module covers **Dynamic Causal Modelling (DCM) for power spectral density (PSD)** using the **E/I canonical microcircuit** (Hauke et al., 2025) implemented in [dcm_ei](https://github.com/daniel-hauke/dcm_ei). You will understand the theory, run one subject to verify the pipeline, learn how group-level analysis will be done (PEB), and write a pre-registration. We do **not** run group-level analysis or PEB in this module; that happens after pre-registration.

## Prerequisites
- Completed Module 2 (EEG preprocessing) and Module 3 (e.g. resting-state in SPM).
- Data in SPM format suitable for DCM (source-reconstructed or with forward model). **We use the data produced in Module 3** as input when we run the DCM in Session 3.
- MATLAB with SPM12; you will download the dcm_ei code from GitHub.
- Access to Overleaf (thesis project + a new project for pre-registration).

## Module structure

| Session | Topic |
|--------|--------|
| [Session 1](session1/README.md) | Reading: DCM, E/I DCM. Writing in Overleaf: high-level what DCM is, why E/I, hypothesis for BSNIP biotypes |
| [Session 2](session2/README.md) | In-depth DCM: key equations, find them in dcm_ei code, download GitHub repo; write equations in Overleaf |
| [Session 3](session3/README.md) | Decide settings, adjust code for one subject, run, inspect model fit; Methods in Overleaf |
| [Session 4](session4/README.md) | PEB: read what it is and why we use it, key equations; write in Overleaf why PEB instead of than t-test/GLM etc. |
| [Session 5](session5/README.md) | Pre-registration: new Overleaf project for pre-reg, read how to pre-register, main structure |
| [Session 6](session6/README.md) | Slowly fill out all sections in the pre-registration (Overleaf) |

## Repository structure

- Each session has its own folder with a **README** (instructions and theory).
- Code lives in the dcm_ei repo (cloned in Session 2); Session 3 may use scripts in this repo to call it or document settings.

## Git workflow

Before each session:

```bash
git pull
```

After completing a session:

```bash
git add .
git commit -m "Module 4 Session N: <short description>"
git push
```

## Writing

- **Thesis / methods**: Write in your existing **Overleaf thesis project** (DCM explanation, equations, Methods for one-subject run, PEB plan).
- **Pre-registration**: From Session 5, use a **separate Overleaf project** for the pre-registration document; Session 6 is for filling it out.

