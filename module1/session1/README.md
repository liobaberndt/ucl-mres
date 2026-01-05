# Session 1: Getting Set Up (GitHub → Local Folder → MATLAB)

## What you will achieve in this session
By the end of this session you will be able to:
- download this GitHub repository onto your computer (so you have the folder locally)
- open the folder in MATLAB
- run one test script to confirm MATLAB works
- save your changes back to GitHub (commit + push)

---

## Part A — GitHub and getting this folder onto your computer
---

### A1. Install Git (only once)
Git is a tool that lets your computer download (“clone”) the repository and send changes back (“push”).

**macOS**
- Open the **Terminal** app and run:
  ```bash
  git --version
  ```
If you see a version number, Git is installed. If not, please install. 

**Windows**
Install Git from https://git-scm.com/downloads
After installing, open Git Bash (it comes with Git).

### A2. Download the repository (“clone”)
This creates a folder on your computer containing all the files from GitHub.
Open Terminal (macOS) or Git Bash (Windows).
Choose where you want the folder to live (e.g., Desktop or Documents) and naviagte there by using cd e.g., cd ~/Documents.

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
cd ucl-mres/module1/session1
```

### A3. Check you are in the right place
Run:
``` bash
ls
```
You should see files from the repository (for example README.md).

## Part B - Install MATLAB and run a test script
### B1. Install MATLAB (if you haven't done so already)
Install MATLAB using UCL's license: https://uk.mathworks.com/academia/tah-portal/university-college-london-649021.html

### B2. Open the repository folder in MATLAB (“Current Folder”)
Open MATLAB. MATLAB always works inside one folder at a time. MATLAB calls this the Current Folder.
We want to set the current folder (called working directory). 
You set it like this:

``` bash
cd '/Users/liobaberndt/Library/CloudStorage/Dropbox/UCL/supervision/ucl-mres/module1/session1'
```

but replace with your individual paths (you can find it in the terminal wehre you downloaded the fodler if you type in 

``` bash
pwd
```

### B3. Create and run a MATLAB test script
Now we make a tiny script to verify MATLAB runs code correctly.

In MATLAB, click New Script.

Copy/paste the following:
``` bash
disp('MATLAB is running correctly.');
a = 2 + 2;
disp(['2 + 2 = ' num2str(a)]);
```

Press the green Run button.
When it asks you to save the script before running, please name it:
``` bash
hello_matlab.m
```

Look at the Command Window.
You should see:
``` bash
“MATLAB is running correctly.”
“2 + 2 = 4”
```

## Part C - Save your work back to GitHub (commit + push)
### C1. Check what changed
Go back to Terminal/Git Bash (still inside the ucl-mres/module1/session1 folder) and run:
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
