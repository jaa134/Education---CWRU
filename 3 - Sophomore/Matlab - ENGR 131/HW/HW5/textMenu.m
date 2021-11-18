% Jacob Alspaw
% jaa134

function [selection] = textMenu(options)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(options(:, 1))
    fprintf('%d. %s\n', i, options(i,:))
end
selection = input('Enter your choice: ');

end

