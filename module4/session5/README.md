# Session 5: Pre-Registration — Set Up Overleaf and Learn Structure

## What you will learn in this session

In this session you will:

- **set up a new Overleaf project** for the **pre-registration** (separate from your thesis Overleaf)
- **read** how to write and submit a pre-registration (e.g. OSF, AsPredicted, or journal templates)
- learn the **main structure** of a pre-registration document so you can fill it out in Session 6

You will *not* fill in the scientific content in detail yet; that is Session 6. This session is setup + structure + reading.

---

## Part 0 – Git workflow

Before starting:

```bash
git pull
```

After completing:

```bash
git add .
git commit -m "Module 4 Session 5: pre-reg Overleaf setup + structure"
git push
```

---

## Part A – Set up a new Overleaf project for pre-registration

### A1. Why a separate project?

- Your **thesis** Overleaf is for the full thesis (including Methods you wrote in Sessions 1–4).
- The **pre-registration** is a standalone document that states hypotheses, design, and analysis plan *before* running the full study. It is often submitted to a registry (e.g. OSF) or uploaded as a timestamped PDF.
- Keeping them separate avoids mixing the pre-reg text with ongoing thesis edits and makes it easy to export a clean PDF for the registry.

### A2. Create the project

1. In Overleaf, click **New Project**.
2. Choose **Blank Project** (or a template if your supervisor/registry recommends one).
3. Name it clearly, e.g. `BSNIP_DCM_EI_prereg` or `[Study name] pre-registration`.
4. Optionally add your supervisor as a collaborator so they can comment.

### A3. Basic layout

- Create a short **title** and **author/affiliation** block at the top.
- Add **section headings** only (no need to write full content yet). Suggested structure is in Part C below. You will fill sections in Session 6.

---

## Part B – Read how to pre-register

### B1. General guidance

- **OSF (Open Science Framework)**: [OSF Preregistration](https://www.cos.io/initiatives/preregistration) — create a preregistration, choose a template (e.g. “Preregistration for Quantitative Research”), and either write there or paste from Overleaf.
- **AsPredicted**: [AsPredicted.org](https://aspredicted.org/) — simple form-based pre-registration; you can draft full text in Overleaf then transfer key answers.
- **Journal / funder**: Some journals or funders require or recommend a specific template; check with your supervisor.

### B2. What to read

- Skim the **OSF Preregistration** template (or equivalent) to see typical sections: hypotheses, design, sample, analysis plan, etc.
- Note: **Analysis plan** will include (1) DCM for PSD with E/I model (dcm_ei), (2) one-subject pipeline as in Module 4 Session 3, (3) group-level analysis via **PEB** with specified **covariates** (as planned in Session 4), (4) model comparison / inference plan.
- Read one short “how to write a good pre-registration” guide (e.g. from Center for Open Science or your university) so you know the purpose: reduce flexibility in reporting and clarify what was planned vs exploratory.

---

## Part C – Main structure of the pre-registration document

In your **new Overleaf pre-reg project**, create these sections (headings only or with one-line placeholders). You will fill them in Session 6.

1. **Title and authors**
2. **Background / rationale**  
   Brief: why DCM for E/I, why BSNIP biotypes, and the scientific question.
3. **Hypotheses**  
   Primary (and optionally secondary) hypotheses regarding biotypes and E/I (or DCM parameters).
4. **Design**  
   Study design (e.g. cross-sectional, groups/biotypes), task/paradigm, and data type (EEG/MEG, preprocessing).
5. **Sample**  
   Inclusion/exclusion, sample size (target or minimum), data source (e.g. B-SNIP).
6. **Analysis plan**  
   - **First level**: DCM for PSD, E/I canonical microcircuit (Hauke et al., dcm_ei); specification (sources, design, PSD settings); inversion.  
   - **One-subject validation**: Pipeline validated on one subject as in Module 4.  
   - **Group level**: PEB; design matrix (covariates: e.g. biotype, age, sex); which parameters will be tested at group level; model comparison approach if applicable.  
   - **Software**: SPM12, dcm_ei, MATLAB version (or “as specified in code”).
7. **Deviations**  
   How you will document and report any deviations from this plan (e.g. “Deviations will be reported in the Results/Methods and justified.”).
8. **References**  
   Key references (Hauke et al., dcm_ei, SPM, PEB references).

---

## Session 5 checklist

You are finished if:

- you have created a **new Overleaf project** for the pre-registration only
- you have read how to submit a pre-registration (OSF or AsPredicted or other) and what a good pre-reg includes
- you have added the **main section headings** (and optionally placeholders) to the pre-reg Overleaf document
- you have committed and pushed any local notes or links to the repo
