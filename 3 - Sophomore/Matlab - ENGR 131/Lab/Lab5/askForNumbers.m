% Jacob Alspaw
% jaa134

function [ values ] = askForNumbers()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

a = input('Enter an array: ');
avg = mean(a);
values = a(a > avg);

end

