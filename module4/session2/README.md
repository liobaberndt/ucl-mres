# Session 2: In-Depth DCM - Key Equations and the dcm_ei Code

## What you will learn in this session

In this session you will:

- understand the **key equations** for DCM (state equation, observer equation) and how the E/I parameters appear in the canonical microcircuit
- **download the dcm_ei GitHub repository** and locate where these equations are implemented in the code
- write up the key equations and their meaning in **Overleaf** (thesis)

No running of the full pipeline yet; focus is equations + code navigation.

---

## Part 0 – Git workflow

Before starting:

```bash
git pull
```

After completing:

```bash
git add .
git commit -m "Module 4 Session 2: DCM equations + dcm_ei code download and navigation"
git push
```

---

## Part A - Key equations (to understand and write up)

You will be given the key equations below. Your task is to (1) understand what each term means and (2) find where they appear (or are implemented) in the dcm_ei code.

### A1. State equation (evolution of hidden states)

The state equation describes how hidden states **x** (e.g. voltages and currents of neuronal populations) evolve over time:

**dx/dt = f(x, u, θ)**

- **x**: hidden states (e.g. membrane potentials, currents in SP, SS, II, DP populations)
- **u**: exogenous input (e.g. thalamic / stimulus input)
- **θ**: model parameters (e.g. connectivity strengths, time constants, g_ee, g_ii)

### A2. Observer equation (mapping to data)

The observer equation maps hidden states to the observed signal:

**y = g(x, θ) + ε**

- **y**: observed data (e.g. EEG/MEG spectra or time series)
- **g**: observation function (lead field, which populations contribute to the signal)
- **ε**: observation noise

### A3. E/I parameters in the canonical microcircuit

In the Hauke et al. model:

- **g_ee**: self-connection on superficial pyramidal (E) cells
- **g_ii**: self-connection on inhibitory interneurons (I)

These are parameterised as (inhibitory) self-connections; increasing g_ee corresponds to *reduced* pyramidal excitability. See the preprint Methods for the full system of equations (SP, SS, II, DP).

---

## Part B - Download dcm_ei and find the equations in the code

### B1. Clone the repository

From a terminal (or Git Bash), in a folder where you keep code:

```bash
git clone https://github.com/daniel-hauke/dcm_ei.git
```

Confirm the folder `dcm_ei` exists and browse its structure (README, main scripts, model files).

### B2. Find the key equations in the code

Using the equation descriptions above and the Hauke et al. Methods:

1. **State equation / dynamics**: Search the repo for where the differential equations for the neuronal populations (SP, SS, II, DP) are defined or integrated. Look for function names or files related to “dynamics”, “dx”, “integration”, or the canonical microcircuit.
2. **Observer / observation function**: Find where the hidden states are mapped to the observed signal (e.g. lead field, which populations contribute to M/EEG).
3. **E/I parameters (g_ee, g_ii)**: Find where g_ee and g_ii are set as parameters or priors (e.g. in a config, prior struct, or model definition).

Make short notes listing **file names and section/function names** where you found each of these. You will use this when adjusting the code for your one subject in Session 3.

---

## Part C - Writing in Overleaf (thesis)

In your **Overleaf thesis project**:

1. Add a subsection that writes out the **state equation** and **observer equation** (as above) and defines each variable (x, u, θ, y, g, ε).
2. Add 2–3 sentences on how **g_ee** and **g_ii** enter the canonical microcircuit and what they represent biologically.

---

## Session 2 checklist

You are finished if:

- you have cloned the dcm_ei repository
- you have found in the code: (1) where the state/dynamics are implemented, (2) where the observation mapping is, (3) where g_ee / g_ii (or E/I parameters) appear
- you have written in Overleaf the key equations and variable definitions, and how g_ee/g_ii fit in
- you have committed and pushed any local notes or paths to the repo

