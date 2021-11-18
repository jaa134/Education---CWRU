% Jacob alspaw
% jaa134

function rate = getRate2(filename)
% Calculates heart rate
%      Finds the average ECG for a ECG file using vectorization.
data = load(filename);
numBeats = 0;
original = data(1:length(data) - 1);
future = data(2:length(data));
beats = find(original <= 0.35 & future > 0.35);
numBeats = length(beats);
rate = (numBeats - 1) / ((beats(numBeats) - beats(1)) * 0.001) * 60;