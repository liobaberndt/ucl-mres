# Session 4: PEB - What It Is, Why We Use It, Key Equations, PEB vs GLM

## What you will learn in this session

In this session you will:

- **read** about Parametric Empirical Bayes (PEB) in the context of DCM (SPM)
- understand **what PEB is** and **why we use it** for group-level DCM
- learn the **key equations** for PEB (or the main idea: empirical priors from the group, second-level estimation)
- *Not* run PEB in this module; that happens after pre-registration

---

## Part 0 – Git workflow

Before starting:

```bash
git pull
```

After completing:

```bash
git add .
git commit -m "Module 4 Session 4: PEB reading + Overleaf writing (why PEB, vs GLM)"
git push
```

---

## Part A-– Reading: What is PEB?

### A1. PEB in SPM for DCM

- **Parametric Empirical Bayes (PEB)** in SPM provides a **two-level** (or hierarchical) framework:
  - **First level**: subject-specific DCM parameters (e.g. connectivity, g_ee, g_ii).
  - **Second level**: group parameters (means, effects of covariates) that act as **empirical priors** for the first level.

- Search for “PEB” or “Parametric Empirical Bayes” in:
  - SPM documentation (DCM for M/EEG, group analysis).
  - Papers: e.g. Friston et al. on hierarchical models and PEB; SPM manual chapters on group DCM / PEB.
- Focus on: what the “second level” is, what “empirical priors” mean, and how covariates (e.g. group, age) enter the design matrix.

### A2. Key equations / idea

You do not need to derive PEB from scratch. Understand and (if useful) write down:

- **First level**: Subject *s* has parameters θ_s with likelihood from the DCM; prior on θ_s.
- **Second level**: The prior mean (and variance) for θ_s is **estimated from the group** (and covariates). That is the “empirical” part: the group data inform the prior for each subject.
- **Covariates**: A design matrix **X** (e.g. intercept, group, age) multiplies second-level parameters so that subject-specific means depend on group and other variables. PEB then estimates these second-level effects and their uncertainty.

---

## Part B - Why PEB rather than GLM for group DCM?

### B1. Simple GLM approach

- A naive approach: invert DCM per subject, take one parameter per subject (e.g. g_ee), then run a **GLM** (e.g. t-test or regression) on those numbers across subjects.
- Problems: (1) **Uncertainty**: subject-level estimates have different precision; GLM usually treats each subject’s estimate as a single number with equal weight. (2) **Shrinkage**: no borrowing of strength across subjects. (3) **Model comparison**: harder to compare model structures at the group level in a coherent Bayesian way.

### B2. Why PEB is better here

- PEB **uses the full posterior** from each subject (not just a point estimate), so **precision** is taken into account.
- **Hierarchical prior**: group-level parameters provide empirical priors, so subjects are **shrunken** toward the group, improving estimates especially when data are noisy.
- **Covariates** are part of the same generative model (design matrix at second level), so inference on group effects and covariates is **consistent** with the DCM.
- **Model comparison** at the group level (e.g. which connections or parameters are modulated by group) can be done within the same framework (e.g. Bayesian model comparison on the second level).

Read one or two short sections or papers that compare “PEB for DCM” vs “extract parameter then GLM” and note the main arguments.

---

## Part C - Writing in Overleaf (thesis)

In your **Overleaf thesis project**:

1. **What is PEB (for DCM)?**  
   One short subsection: PEB as a two-level (subject → group) framework; empirical priors from the group; how covariates enter (design matrix at second level). Optionally include the key equation or a sentence like “the prior for subject parameters is estimated from the group and covariates.”

2. **Why PEB rather than GLM?**  
   One short subsection: (a) GLM on subject-level point estimates ignores estimation uncertainty; (b) PEB uses full posteriors and hierarchical shrinkage; (c) covariates and model comparison are integrated in PEB. 2–4 sentences per point is enough.

This will support the “Analysis plan” section of your pre-registration (Session 5–6), where you will state that group-level inference will use PEB with specified covariates.

---

## Session 4 checklist

You are finished if:

- you have read about PEB in SPM/DCM and understand what it is and why it is used for group DCM
- you understand the main idea of the key equations (first level, second level, empirical prior, design matrix)
- you have written in Overleaf: what PEB is, and why we use PEB rather than a simple GLM for group DCM
- you have committed and pushed any notes to the repo

