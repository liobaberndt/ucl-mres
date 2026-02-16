# Session 5 - FOOOF Outputs: Export, Summarize, Report

## What you will learn in this session
In this session you will:
- export FOOOF results from Brainstorm
- extract aperiodic and peak parameters in MATLAB
- compare parameters across channels using statistics
- create basic summaries and plots
- document how you will report FOOOF outcomes

## Part 0 - Git workflow
Before starting:
```bash
git pull
```

After completing:
```bash
git add .
git commit -m "Module 3 Session 5: FOOOF export and summary"
git push
```

## Part A - Export FOOOF from Brainstorm
In Brainstorm:
1. Select the **FOOOF results file** under your PSD file.
2. Right‑click → **File > Export to Matlab**.
3. Save the exported file as a `.mat` file in your project folder.

## Part B - Run the MATLAB summary code
Paste this code directly into MATLAB:
```matlab
% module3_session5_setup.m
% Module 3 - Session 5: Extract and summarize FOOOF outputs (Brainstorm)

clear; close all; clc;

% 1) Path to Brainstorm-exported FOOOF .mat file (edit this)
fooof_mat_path = '/path/to/brainstorm_fooof_export.mat';

% 2) Load exported structure
S = load(fooof_mat_path);

% 3) Expect a single exported variable named "fooof_file"
% If you used a different name in Brainstorm, change it here.
fooof_file = S.fooof_file;

% 4) Get the FOOOF structure (Brainstorm uses "FOOOF")
fooof_struct = fooof_file.FOOOF;

% 5) Extract key outputs (fields can vary slightly by Brainstorm version)
aperiodics = getfield_safe(fooof_struct, 'aperiodics');
peaks      = getfield_safe(fooof_struct, 'peaks');
stats      = getfield_safe(fooof_struct, 'stats');
options    = getfield_safe(fooof_struct, 'options');

% 6) Build a summary table for aperiodic parameters
aperiodic_table = [];
if ~isempty(aperiodics)
    aperiodic_table = struct2table(aperiodics);
end

% 7) Build a summary for peaks: keep the strongest peak per channel
peak_summary = [];
if ~isempty(peaks)
    T = struct2table(peaks);
    if all(ismember({'chan','amp'}, T.Properties.VariableNames))
        chans = unique(T.chan);
        peak_summary = table();
        for i = 1:numel(chans)
            rows = T(T.chan == chans(i), :);
            [~, idx] = max(rows.amp);
            peak_summary = [peak_summary; rows(idx, :)]; %#ok<AGROW>
        end
    end
end

% 8) Quick plots
if ~isempty(aperiodic_table) && all(ismember({'chan','exp'}, aperiodic_table.Properties.VariableNames))
    figure;
    bar(aperiodic_table.exp);
    xlabel('Channel');
    ylabel('Aperiodic exponent');
    title('FOOOF aperiodic exponent (per channel)');
end

% 9) Channel comparison (if repeated measures exist)
% If the table contains multiple observations per channel (e.g., per epoch),
% run a simple repeated-measures test across channels.
if ~isempty(aperiodic_table) && any(ismember({'exp','metric'}, aperiodic_table.Properties.VariableNames))
    has_trial = ismember('trial', aperiodic_table.Properties.VariableNames);
    has_epoch = ismember('epoch', aperiodic_table.Properties.VariableNames);
    has_metric = ismember('metric', aperiodic_table.Properties.VariableNames);
    if has_trial || has_epoch
        id_field = 'trial';
        if has_epoch
            id_field = 'epoch';
        end
        measure = 'exp';
        if has_metric
            measure = 'metric';
        end
        chan_ids = unique(aperiodic_table.chan);
        trial_ids = unique(aperiodic_table.(id_field));
        data = nan(numel(trial_ids), numel(chan_ids));
        for i = 1:numel(trial_ids)
            for j = 1:numel(chan_ids)
                rows = aperiodic_table.(id_field) == trial_ids(i) & aperiodic_table.chan == chan_ids(j);
                if any(rows)
                    data(i, j) = mean(aperiodic_table.(measure)(rows));
                end
            end
        end

        fprintf('Running Friedman test on %s across channels.\n', measure);
        [p, tbl, stats] = friedman(data, 1, 'off');
        out.stats.friedman.p = p;
        out.stats.friedman.table = tbl;
        out.stats.friedman.stats = stats;

        chan_means = nanmean(data, 1);
        disp(table(chan_ids, chan_means', 'VariableNames', {'Channel', 'MeanValue'}));
    else
        fprintf('No per-epoch/trial field found. Skipping channel statistics.\n');
    end
end

% 10) Save cleaned outputs
out.aperiodics = aperiodics;
out.peaks = peaks;
out.stats = stats;
out.options = options;
out.aperiodic_table = aperiodic_table;
out.peak_summary = peak_summary;
save('module3_session5_fooof_summary.mat', 'out');

disp('Session 5: FOOOF export processed and saved.');

% --- Helper
function val = getfield_safe(s, fieldname)
    if isstruct(s) && isfield(s, fieldname)
        val = s.(fieldname);
    else
        val = [];
    end
end
```

## Part C - Channel comparison (statistics)
Run the code above to compute a simple within‑subject channel comparison.
Then write a short note on which **group‑level** tests you would use later
when multiple subjects are available.

## Part D - Reading (biotypes)
Read the B‑SNIP paper section that explains how biotypes are defined.
Write down:
- which measures are included in the biotype model
- how those measures are combined (e.g., data reduction, clustering)
- what distinguishes Biotype‑1, Biotype‑2, Biotype‑3

## Part E - Writing (biotypes + visualization)
Write 10–14 bullets:
- which biotype features you will approximate in your data
- which statistical tests you will use (and why) e.g., PCA?
- which outcomes are primary vs exploratory

## Session 5 checklist
You are finished if:
- you exported the FOOOF results from Brainstorm
- the MATLAB script runs without errors
- you saved `module3_session5_fooof_summary.mat`
- you compared channels using a statistical test
- you completed the reading and writing tasks
