% Jacob Alspaw
% jaa134

power = load(input('Enter a filename? ', 's'));
sum = 0;
i = 0;
for i = 1:length(power)
    if power(i) > 0
        sum = sum + power(i);
    end
end
kWh = sum / 6;
fprintf('Total power: %.1f kWh\n', kWh);

