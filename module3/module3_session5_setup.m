% module3_session5_setup.m
% Module 3 - Session 5: Extract and summarize FOOOF outputs (Brainstorm)

clear; close all; clc;

% 1) Path to Brainstorm-exported FOOOF .mat file (edit this)
fooof_mat_path = '/Users/sachapopa/Documents/ucl-mres/module3/fooof_file.mat';

% 2) Load exported structure
S = load(fooof_mat_path);

% 3) Expect a single exported variable named "fooof_file"
fooof_file = S.fooof_file;

% 4) Get the FOOOF structure nested under Options
fooof_struct = fooof_file.Options.FOOOF;

% (Optional sanity check)
disp('FOOOF struct fields:');
disp(fieldnames(fooof_struct));

% 5) Extract key outputs
aperiodics = getfield_safe(fooof_struct, 'aperiodics');
peaks      = getfield_safe(fooof_struct, 'peaks');
stats      = getfield_safe(fooof_struct, 'stats');
options    = getfield_safe(fooof_struct, 'options');

% 6) Build a summary table for aperiodic parameters
aperiodic_table = table();
if ~isempty(aperiodics)
    aperiodic_table = struct2table(aperiodics);
end

% 7) Build a summary for peaks: keep the strongest peak per channel
peak_summary = table();

if ~isempty(peaks)
    T = struct2table(peaks);

    % Brainstorm field names (based on your output)
    ch_field  = 'channel';
    amp_field = 'amplitude';

    if all(ismember({ch_field, amp_field}, T.Properties.VariableNames))

        chans = unique(T.(ch_field));
        peak_summary = table();

        for i = 1:numel(chans)
            rows = T(strcmp(T.(ch_field), chans{i}), :);

            % Find strongest peak (largest amplitude)
            [~, idx] = max(rows.(amp_field));

            peak_summary = [peak_summary; rows(idx, :)]; %#ok<AGROW>
        end

    else
        fprintf('Peak table fields are: %s\n', ...
            strjoin(T.Properties.VariableNames, ', '));
    end
end

% 8) Quick plot: aperiodic exponent per channel
if ~isempty(aperiodic_table) && all(ismember({'channel','exponent'}, aperiodic_table.Properties.VariableNames))
    figure;
    bar(aperiodic_table.exponent);
    xlabel('Channel (index in table)');
    ylabel('Aperiodic exponent');
    title('FOOOF aperiodic exponent (per channel)');
else
    if ~isempty(aperiodic_table)
        fprintf('Aperiodic table fields are: %s\n', strjoin(aperiodic_table.Properties.VariableNames, ', '));
    else
        fprintf('Aperiodic table is empty.\n');
    end
end

% 9) Channel comparison (only possible if repeated measures exist)
% This requires per-epoch/trial fits (i.e., multiple rows per channel).
if ~isempty(aperiodic_table) && ismember('exponent', aperiodic_table.Properties.VariableNames)

    has_trial = ismember('trial', aperiodic_table.Properties.VariableNames);
    has_epoch = ismember('epoch', aperiodic_table.Properties.VariableNames);

    if has_trial || has_epoch

        id_field = 'trial';
        if has_epoch
            id_field = 'epoch';
        end

        chan_ids  = unique(aperiodic_table.channel);
        trial_ids = unique(aperiodic_table.(id_field));

        data = nan(numel(trial_ids), numel(chan_ids));
        for i = 1:numel(trial_ids)
            for j = 1:numel(chan_ids)
                rows = aperiodic_table.(id_field) == trial_ids(i) & aperiodic_table.channel == chan_ids(j);
                if any(rows)
                    data(i, j) = mean(aperiodic_table.exponent(rows), 'omitnan');
                end
            end
        end

        fprintf('Running Friedman test on exponent across channels.\n');
        [p, tbl, fried_stats] = friedman(data, 1, 'off');

        out.stats.friedman.p = p;
        out.stats.friedman.table = tbl;
        out.stats.friedman.stats = fried_stats;

        chan_means = mean(data, 1, 'omitnan');
        disp(table(chan_ids, chan_means', 'VariableNames', {'Channel', 'MeanExponent'}));

    else
        fprintf(['No per-epoch/trial field found in aperiodic_table.\n' ...
                 'This export appears to provide one exponent per channel, so within-subject\n' ...
                 'repeated-measures channel statistics are not applicable.\n']);
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