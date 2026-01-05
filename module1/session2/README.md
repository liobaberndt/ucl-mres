## Session 2 - Running Code and Visual Feedback

### What you will learn in this session
In this session you will learn how MATLAB runs code and how to check whether
your code is doing what you expect by visualising the output.

By the end of this session you will be able to:
- open and run a MATLAB script
- understand what variables are
- change values in code and predict the effect
- create simple plots and compare outputs
- save and commit your changes to GitHub

---

## Part A - What a MATLAB script is

A MATLAB script is a text file that contains instructions.  
MATLAB runs these instructions **from top to bottom**.

If you change a value and run the script again, the output changes.  
This is how we explore and debug code.

---

## Part B - Example: creating and plotting a signal

### B1. Open the example script
Open the file:

```bash
# this is the name of the file to open in MATLAB
01_example_signal.m
```

Read through the script **without changing anything**.  
Notice that:
- values such as frequency, duration, and amplitude are stored in variables
- a time vector is created
- a signal is computed from these variables
- the signal is plotted

---

### B2. Run the script
Click the green **Run** button.

A figure window should appear showing a sine wave.

---

### B3. Change one value at a time
Change **one variable only** (for example, the frequency or amplitude).  
Run the script again.

Observe how the plot changes.

Changing one thing at a time is an important habit.

---

## Part C - Exercise 1: modifying a single signal

### C1. Open the exercise script
Open:

```bash
# exercise script to complete
02_exercise_signal.m
```

This script is similar to the example but contains TODO comments.

---

### C2. Complete the exercise
Follow the instructions in the file to:
- choose a frequency
- choose an amplitude
- choose a duration
- generate a signal
- plot it with axis labels

---

### C3. Run your script
When the script runs without errors and produces a sensible plot, the exercise is complete.

---

## Part D - Example: comparing two signals

### D1. Open the comparison example
Open:

```bash
# example showing how to compare two signals
03_example_two_signals.m
```

This script generates two signals with different frequencies and displays them
in the same figure using subplots.

---

### D2. Run and inspect
Run the script and observe:
- both signals use the same time vector
- each signal is shown in its own subplot
- labels help interpret what you see

Subplots allow you to compare results visually.

---

## Part E - Exercise 2: comparing two signals

### E1. Open the exercise script
Open:

```bash
# second exercise script
04_exercise_two_signals.m
```

---

### E2. Complete the exercise
Follow the TODO comments to:
- create two signals with different frequencies
- plot them in two subplots
- label each subplot clearly

---

## Part F — Check your solutions

Open the solution files:

```bash
# solution scripts (for checking only)
02_solution_signal.m
04_solution_two_signals.m
```

Your code does **not** need to look identical.  
What matters is that:
- it runs
- the plots make sense
- you understand what each line does

---

## Part G - Save your work to GitHub

### G1. Check what changed
In the terminal, inside the repository folder, run:

```bash
# show which files have changed
git status
```

---

### G2. Commit your work
Run:

```bash
# stage the session folder
git add session02_running_code

# save a snapshot with a message
git commit -m "Complete Session 2: running code and plotting"
```

---

### G3. Push to GitHub
Run:

```bash
# send your commits to GitHub
git push
```

---

## Session 2 checklist
You are finished with Session 2 if:
- you ran `01_example_signal.m`
- you modified and completed `02_exercise_signal.m`
- you ran and understood the two-signal example
- you completed `04_exercise_two_signals.m`
- you committed and pushed your changes

---

