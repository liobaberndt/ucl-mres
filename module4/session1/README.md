# Session 1: Reading DCM and E/I DCM — Writing High-Level What DCM Is and Why E/I

## What you will learn in this session

In this session you will:

- read about DCM (general) and DCM for E/I balance (Hauke et al. preprint + key refs)
- write in **Overleaf** (thesis): what DCM is at a high level, why we use the E/I model, and what hypothesis we have regarding **biotypes in BSNIP**

No code this session; focus is reading and writing.

---

## Part 0 – Git workflow

Before starting:

```bash
git pull
```

After completing:

```bash
git add .
git commit -m "Module 4 Session 1: DCM and E/I reading + Overleaf writing"
git push
```

---

## Part A – Reading: DCM and E/I DCM

### A1. Core reading

1. **Hauke et al. (2025)** – A Canonical Microcircuit for Estimating Excitation/Inhibition (E/I) Balance  
   - [bioRxiv](https://www.biorxiv.org/content/10.1101/2025.07.10.664116v1.full)  
   - Focus: Introduction, Methods (canonical microcircuit, E/I parameters g_ee, g_ii), what the model estimates and why it matters for M/EEG.

2. **DCM for M/EEG (general)**  
   - E.g. David et al. (2006) Dynamic causal modeling of evoked responses in EEG and MEG; or SPM manual chapters on DCM for M/EEG.  
   - Focus: What DCM is (generative model, effective connectivity), state and observer equations at a conceptual level.

### A2. BSNIP and biotypes

- Read or recall how **B-SNIP** (Bipolar and Schizophrenia Network for Intermediate Phenotypes) defines **biotypes** and how they relate to EEG/MEG biomarkers.
- Note how E/I balance (or pyramidal/inhibitory dysfunction) might differ between biotypes and why DCM for E/I could speak to that.

---

## Part B – Writing in Overleaf (thesis project)

In your **existing Overleaf thesis project**, add a subsection (or notes section) that includes:

### B1. High-level: what is DCM?

- 1–2 paragraphs in your own words: what DCM is (generative model, effective connectivity, specify → invert → compare).
- What “DCM for PSD” means (fitting a model to spectral / cross-spectral data).

### B2. Why the E/I model?

- Why we want the **E/I canonical microcircuit** (Hauke et al.): what g_ee and g_ii represent, why they are useful for studying psychiatric/neurological conditions.
- Brief link to the preprint (clinical relevance, schizophrenia, etc.).
- **Note:** The E/I model is defined *per source*; the **number of sources** (1, 4, 6, or other) is **not** fixed by the model. We will decide based on **our** source reconstruction and paradigm. Similarly, **which sensors** we use (all, specific channels, or averaged) depends on our sensor-level setup—state both in the pre-registration.

### B3. Hypothesis regarding biotypes in BSNIP

- State the **hypothesis** we have (or you are testing) regarding **biotypes in BSNIP** in relation to E/I balance or DCM parameters (e.g. differences in g_ee, g_ii, or E/I ratio between biotypes).
- 1 short paragraph is enough; this will be refined in the pre-registration later.

---

## Session 1 checklist

You are finished if:

- you have read the Hauke et al. preprint (Introduction, Methods on E/I) and at least one general DCM for M/EEG reference
- you have written in Overleaf (thesis): what DCM is (high-level), why we use the E/I model, and the hypothesis regarding BSNIP biotypes
- you have committed and pushed any local notes/code changes to the repo
