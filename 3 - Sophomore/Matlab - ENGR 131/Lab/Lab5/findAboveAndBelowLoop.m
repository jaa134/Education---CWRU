% Jacob Alspaw
% jaa134

function findAboveAndBelowLoop()
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

a = input('Enter an array (ENTER to quit): ');
while length(a) ~= 0
    displayAboveAndBelow(a)
    a = input('Enter an array (ENTER to quit): ');
end

function displayAboveAndBelow(a)
avg = mean(a);
above = a(a > avg);
below = a(a < avg);
fprintf('%d is above the mean.\n', above);
fprintf('%d is below the mean.\n', below);

