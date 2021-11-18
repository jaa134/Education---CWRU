% Jacob Alspaw
% jaa134

function concentration = getConcentration(initial, time, massKg)
% A function to calculate Insulin concentration.
if (initial < 0)
    disp('Error: Initial concentration cannot be negative.')
end
if (time < 0)
    disp('Error: Time cannot be negative.')
end
if (massKg <= 0)
    disp('Error: Mass must be greater than zero.')
end
if (initial >= 0 && time >=0 && massKg > 0)
    concentration = initial * exp(-30 * time / massKg);
else
    concentration = -1;
end