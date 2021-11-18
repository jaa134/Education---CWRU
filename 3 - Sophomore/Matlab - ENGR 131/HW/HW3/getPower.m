% Jacob Alspaw
% jaa134

function [ kWh ] = getPower( filename )
% Finds output power of a wind turbine.
% Uses the same method as problem1 to fid the power output of a windmill.
power = load(filename);
sum = 0;
i = 0;
for i = 1:length(power)
    if power(i) > 0
        sum = sum + power(i);
    end
end
kWh = sum / 6;
end

