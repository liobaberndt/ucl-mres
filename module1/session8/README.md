## Session 8 - Setting Up the EEG Analysis Environment
### What you will learn in this session
In this session you will:
- set up the main software tools used in this project
- understand what EEGLAB and SPM are used for at a high level
- install and configure Cursor AI as your coding environment
- add and run MATLAB within Cursor AI
- practise using the integrated AI assistant on MATLAB code
- expand and organise your literature library in Zotero
This session focuses on infrastructure and orientation, not data analysis.
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
git commit -m "Session 8: environment setup and Cursor AI"
git push
```
### Part A - Why this session matters
Up to this point, you have:
- worked with simulated EEG-like data
- learned how EEG data are structured
- begun engaging with real EEG Methods sections
To move forward, you now need a working analysis environment.
EEG research relies on:
- specialised MATLAB toolboxes
- reproducible software setups
- effective code and literature organisation
This session establishes the technical foundation for all upcoming work.

### Part B - Installing and understanding EEGLAB
#### B1. What is EEGLAB?
EEGLAB is a MATLAB toolbox widely used for:
- loading EEG datasets
- visual inspection of EEG data
- preprocessing (e.g. filtering, epoching, ICA)
At this stage, think of EEGLAB primarily as:
- a tool to load and inspect real EEG data
- not yet as a full analysis pipeline

#### B2. Download and install EEGLAB
Go to:
https://sccn.ucsd.edu/eeglab/
Download the latest stable version of EEGLAB.
Unzip the folder into a location you can easily find (e.g. a toolboxes/ directory).
Open MATLAB and add EEGLAB to your path.
In the MATLAB command window, type:
```bash
eeglab
```
You should see the EEGLAB GUI open.

### Part C - Installing and understanding SPM
#### C1. What is SPM?
SPM (Statistical Parametric Mapping) is a MATLAB-based software package used for:
- EEG, MEG, and fMRI analysis
- model-based approaches, including Dynamic Causal Modelling (DCM)
Later in this project, SPM will be used for:
- spectral analyses
- computational modelling
For now, the goal is simply to:
- install it
- understand its role in the project

#### C2. Download and install SPM
Go to:
https://www.fil.ion.ucl.ac.uk/spm/
Download the latest SPM version.
Unzip it into the same general toolbox directory as EEGLAB.
Add SPM to your MATLAB path.
In MATLAB, type:
```bash
spm eeg
```
Confirm that the SPM window opens.

### Part D - Installing and using Cursor AI with MATLAB
#### D1. Download and install Cursor AI
Cursor AI is the code editor you will use throughout this project.
It is similar to VS Code, but includes AI assistance integrated directly into the editor, which you can use to ask questions about your code.
Go to:
https://www.cursor.sh/
Download and install Cursor for your operating system.
Open Cursor once installation is complete.
#### D2. Ensure MATLAB is installed
Cursor does not include MATLAB.
Before proceeding, make sure that:
- MATLAB is installed on your machine
- MATLAB opens correctly on its own
- you can run .m files directly in MATLAB
#### D3. Opening your project in Cursor
In Cursor:
- open your main project folder (the same folder you use for Git and MATLAB)
- confirm that you can see all session folders and .m files
Cursor will be used for:
- writing and editing MATLAB scripts
- navigating larger projects
- keeping code and notes organised
#### D4. Adding MATLAB to Cursor AI (VS Code–style setup)
Cursor AI runs MATLAB in the same way as VS Code.
MATLAB executes locally on your machine, and Cursor triggers execution from the editor.
To set this up, follow the official MathWorks instructions for using MATLAB with VS Code:
https://www.mathworks.com/help/matlab/matlab_prog/set-up-vs-code-for-matlab-development.html
These instructions apply directly to Cursor.
After completing this setup, you should be able to:
- open a .m file in Cursor
- click Run in the editor
- have the script execute in MATLAB
- see figures and output as usual

#### D5. Using the AI assistant in Cursor
Cursor includes an integrated AI assistant to help you understand and write code.
To open the AI chat:
- open the chat panel from the Cursor sidebar
- or use the keyboard shortcut shown in Cursor
You can also:
- highlight specific lines of code
- ask questions directly about the selected code
Examples of useful questions:
- “What does this MATLAB script do?”
- “Why does this indexing operation work like this?”
- “Can you refactor this code to be clearer?”
Use the AI as a learning aid, not a substitute for understanding.

### Part E - Example: using Cursor AI on MATLAB code
Create a new file in this session folder called:
```bash
01_example_cursor_ai.m
```

Paste the following code into the file.
```bash
% 01_example_cursor_ai.m
% Session 8 — Example script for using Cursor AI with MATLAB
clear; close all; clc;
% Parameters
srate = 250; % sampling rate (Hz)
duration = 5; % seconds
t = 0:1/srate:duration;
% Create signal components
alpha = sin(2pi10t); % 10 Hz alpha rhythm
theta = sin(2pi6t); % 6 Hz theta rhythm
noise = randn(size(t)) * 0.5;
% Combine components
signal = alpha + 0.5*theta + noise;
% Plot
figure;
plot(t, signal);
xlabel('Time (s)');
ylabel('Amplitude (a.u.)');
title('Simulated EEG-like signal');
```
Open this file in Cursor.
#### E1. Ask Cursor AI questions
Using the Cursor AI chat or by highlighting code, ask questions such as:
- “What does this script do overall?”
- “Which part adds noise to the signal?”
- “How would I change this to emphasise the alpha rhythm?”
#### E2. Let Cursor AI suggest edits
Ask Cursor AI to:
- rename variables to be clearer
- add comments explaining each section
- refactor the code for readability
Review any suggested changes carefully before accepting them.

### Part F - Literature management with Zotero
#### F1. Expanding your Zotero library
In this session:
- add three additional papers relevant to your thesis topic
- organise them into a Zotero collection for this project
#### F2. Reading task
Read each paper at a high level.
For each paper, write brief notes:
- what the paper is about
- why it is relevant to your project
- which sections seem most important

### Part G - Looking ahead
From the next session onward, we will begin:
- loading real EEG datasets
- inspecting data in EEGLAB
- connecting what you see in software to what you read in Methods sections

### Session 8 checklist
You are finished with Session 8 if:
- EEGLAB is installed and opens correctly
- SPM is installed and opens correctly
- Cursor AI is installed and your project opens in it
- MATLAB runs correctly from within Cursor
- you ran the example script and interacted with Cursor AI
- you added three new relevant papers to Zotero
