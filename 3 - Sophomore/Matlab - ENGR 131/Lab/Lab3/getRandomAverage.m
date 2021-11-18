% Jacob Alspaw
% jaa134

function [ avg ] = getRandomAverage( howMany )
% Finds an average.
%   Finds the average of an input amount of random numbers using the
%   printRandom function.
i = 0;
sum = 0;
vect = rand(1, howMany);
for i = 1:howMany
    sum = sum + vect(i);
end
avg = sum / howMany;
end

