% Jacob Alspaw
% jaa134

function rate = getRate1(filename)
% Calculates heart rate
%      Finds the average ECG for a ECG file using a loop.
data = load(filename);
threshold = 0.35;
numBeats = 0;
for i = 1:(length(data) - 1)
    if data(i) <= threshold && data(i + 1) > threshold
        if numBeats == 0
            begin = i;
        end
        last = i;
        numBeats = numBeats + 1;
    end
end
rate = (numBeats - 1) / ((last - begin) * 0.001) * 60;