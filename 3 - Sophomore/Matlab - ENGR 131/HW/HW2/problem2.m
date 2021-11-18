% Jacob Alspaw
% jaa134

initial = input('Enter an initial concentration (uIU/ml): ');
time = input('Enter a time (minutes): ');
massKg1 = input('Enter the first mass (kg): ');
increase = input('Enter the percentage increase in mass: ');
concentration1 = getConcentration(initial, time, massKg1);
massKg2 = massKg1 + (massKg1 * increase);
concentration2 = getConcentration(initial, time, massKg2);
if (concentration1 ~= -1 && concentration2 ~= -1)
    percentDifference = ((concentration2 - concentration1) / concentration1) * 100;
    fprintf('The difference is %.1f%%.\n', percentDifference)
end
