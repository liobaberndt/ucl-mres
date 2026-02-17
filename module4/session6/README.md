# Session 6: Fill Out the Pre-Registration Sections

## What you will learn in this session

In this session you will:

- **slowly fill out** each section of the pre-registration in your **Overleaf pre-reg project**
- Use what you wrote in Sessions 1–4 (thesis Overleaf) and decided in Session 3 (settings) to draft clear, precise pre-reg text
- Produce a **draft pre-registration** ready for supervisor feedback and eventual submission (e.g. OSF, AsPredicted)

You may spread this over more than one sitting; “slowly” means section by section, with care.

---

## Part 0 – Git workflow

Before starting:

```bash
git pull
```

After completing (or after each subsection you finish):

```bash
git add .
git commit -m "Module 4 Session 6: pre-reg section [name]"
git push
```

---

## Part A – Where the content comes from

- **Background / rationale, hypotheses**: From Session 1 (what DCM is, why E/I, hypothesis re BSNIP biotypes) and your thesis Overleaf.
- **Design, sample**: From your study (B-SNIP, task, EEG/MEG, preprocessing as in Modules 2–3).
- **Analysis plan**: From Session 3 (one-subject settings, DCM specification, inversion, model fit) and Session 4 (PEB, covariates, why PEB not GLM). Be specific: sources, design, PSD settings, software, PEB design matrix and covariates.

---

## Part B – Fill out sections slowly

Work through the structure you created in Session 5. For each section:

1. **Title and authors**  
   Final title; list authors and affiliations.

2. **Background / rationale**  
   Short paragraph: DCM for PSD, E/I model (Hauke et al., dcm_ei), relevance to BSNIP biotypes and your research question.

3. **Hypotheses**  
   Numbered primary (and if needed secondary) hypotheses. E.g. “Biotype X will show lower/higher g_ee (or E/I ratio) than Biotype Y”; or “PEB will show a significant effect of biotype on [parameter].”

4. **Design**  
   Study design (e.g. cross-sectional), paradigm (e.g. task name, duration), data (EEG/MEG, preprocessing pipeline, SPM format).

5. **Sample**  
   Inclusion/exclusion criteria, target N, data source (e.g. B-SNIP), and how biotypes are defined.

6. **Analysis plan**  
   - **First-level DCM**: Model (DCM for PSD, E/I canonical microcircuit, dcm_ei); sources/nodes; design (conditions, input); frequency range; inversion (SPM/dcm_ei).  
   - **One-subject validation**: State that the pipeline was validated on one subject (as in Module 4 Session 3) and will be applied to the full sample.  
   - **Group level**: PEB; design matrix (e.g. intercept, biotype, age, sex); which DCM parameters will be tested at group level; model comparison (e.g. BMA, threshold) if applicable.  
   - **Software**: SPM12, dcm_ei (cite GitHub), MATLAB version or “as in code”.

7. **Deviations**  
   Short statement: any deviation from this plan will be reported and justified in the final report/thesis.

8. **References**  
   Add key refs (Hauke et al., dcm_ei, SPM, PEB, B-SNIP, paradigm papers).

---

## Part C – Tips

- **Be specific**: “We will use PEB with covariates X, Y, Z” is better than “We will do group statistics.”
- **Match your one-subject run**: The analysis plan should describe exactly what you did in Session 3 (and will do for all subjects), so no surprise analyses later.
- **Ask for feedback**: Share the Overleaf pre-reg link with your supervisor before submitting to a registry.
- You can do Session 6 in **multiple sessions** (e.g. one section per day); just keep the document updated and push any local notes.

---

## Session 6 checklist

You are finished if:

- all main sections of the pre-registration are **filled out** in the Overleaf pre-reg project
- the **analysis plan** clearly states: DCM for PSD + E/I (dcm_ei), one-subject validation, PEB with specified covariates and group-level inference
- you have requested or received **supervisor feedback** on the draft
- you are ready to **submit** (or have submitted) the pre-registration to your chosen registry (OSF, AsPredicted, etc.)
- you have committed and pushed any final notes to the repo
