# Session 1: Getting Set Up (GitHub → Local Folder → MATLAB)

## What you will achieve in this session
By the end of this session you will be able to:
- download this GitHub repository onto your computer (so you have the folder locally)
- open the folder in MATLAB
- run one test script to confirm MATLAB works
- save your changes back to GitHub (commit + push)

You are **not** expected to understand programming yet. This is just setup.

---

## Part A — GitHub and getting this folder onto your computer

### A1. Create a GitHub account (if you don’t have one)
1. Go to GitHub and create an account.
2. Tell me your GitHub username so you can be added as a collaborator.

---

### A2. Install Git (only once)
Git is a tool that lets your computer download (“clone”) the repository and send changes back (“push”).

**macOS**
- Open the **Terminal** app and run:
  ```bash
  git --version
  ```
If you see a version number, Git is installed.

**Windows**
Install Git from https://git-scm.com/downloads
After installing, open Git Bash (it comes with Git).

### A3. Download the repository (“clone”)
This creates a folder on your computer containing all the files from GitHub.
Open Terminal (macOS) or Git Bash (Windows).
Choose where you want the folder to live (e.g., Desktop or Documents) and naviagte there by using cd e.g., cd ~/Documents
Now run:
```bash
git clone https://github.com/liobaberndt/ucl-mres.git
```

If this worked, you now have a folder called:
```bash
ucl-mres
```
Go into the folder:
``` bash
cd ucl-mres
```

### A4. Check you are in the right place
Run:
``` bash
ls
```
You should see files and folders from the repository (for example README.md and session folders).

## Part B - Install MATLAB and run a test script
### B1. Install MATLAB
Install MATLAB using UCL's license.

### B2. Open the repository folder in MATLAB (“Current Folder”)
Open MATLAB. MATLAB always works inside one folder at a time. MATLAB calls this the Current Folder.
In MATLAB, find the panel called Current Folder (usually on the left).
Click Browse for Folder (or the “…” button).
Select the ucl-mres folder you just cloned.
Click Open.
If this worked, you should see the repository files listed inside MATLAB.


### B3. Create and run a MATLAB test script
Now we make a tiny script to verify MATLAB runs code correctly.
Set your working directory (where your git is for example for me):
``` bash
cd '/Users/liobaberndt/Library/CloudStorage/Dropbox/UCL/supervision/ucl-mres/module1/session1'
```
In MATLAB, click New Script.
Save it inside this repository folder as:
``` bash
hello_matlab.m
```

Copy/paste the following:
``` bash
disp('MATLAB is running correctly.');
a = 2 + 2;
disp(['2 + 2 = ' num2str(a)]);
```

Press the green Run button.
Look at the Command Window.
You should see:
``` bash
“MATLAB is running correctly.”
“2 + 2 = 4”
```

## Part C - Save your work back to GitHub (commit + push)
### C1. Check what changed
Go back to Terminal/Git Bash (still inside the ucl-mres folder) and run:
``` bash
git status
``` 
You should see hello_matlab.m listed as a new file.
### C2. Commit the change
A commit is a saved snapshot with a message.
Run:
``` bash
git add hello_matlab.m
git commit -m "Add MATLAB test script"
```
### C3. Push to GitHub
This uploads your commits to GitHub.
Run:
``` bash
git push
```
If you refresh the GitHub webpage for the repository, you can see hello_matlab.m online.

## Session 1 checklist
You are done if:
- You cloned the repository (ucl-mres folder exists locally)
- MATLAB opens and can see the ucl-mres folder in the Current Folder panel
- hello_matlab.m runs and prints the expected output
- You committed and pushed hello_matlab.m to GitHub
