function [EEG, dropped_labels] = drop_non_eeg_channels(EEG, discard_m1_m2)
% Drop non-EEG channels by label (EOG/ECG/EMG/CB/mastoids).
    dropped_labels = {};
    if ~isfield(EEG, 'chanlocs') || isempty(EEG.chanlocs)
        return;
    end
    labels = {EEG.chanlocs.labels};
    if all(cellfun('isempty', labels))
        return;
    end
    upper_labels = upper(labels);
    non_eeg = ismember(upper_labels, {'CB1','CB2','VEOG','HEOG','ECG','EMG'});
    if discard_m1_m2 == 1
        non_eeg = non_eeg | ismember(upper_labels, {'M1','M2'});
    end
    idx = find(non_eeg);
    if isempty(idx)
        return;
    end
    dropped_labels = labels(idx);
    EEG = pop_select(EEG, 'nochannel', idx);
end
