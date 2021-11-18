% Jacob Alspaw
% jaa134

filename = input('Enter a filename? ', 's');
power = load(filename);
time = 0:10:(length(power) - 1) * 10;
plot(time, power);
hold on
for i = 1:length(power)
    if power(i) < 0
        plot(time(i), power(i), 'ro');
    end
end
xlabel('Time (minutes)');
ylabel('Power (kW)');
title(filename);


