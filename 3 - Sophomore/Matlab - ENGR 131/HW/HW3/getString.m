% Jacob Alspaw
% jaa134

function [ strng ] = getString(size)
%Gets a string.
%   Repeatedly prompts user for a string until a minmum number of
%   characters has been entered.
strng = input('Enter: ', 's');
if length(strng) < size
    fprintf('Too short. It should be at least %i character(s) long!\n', size);
end
while length(strng) < size
    strng = input('Enter: ', 's');
    if length(strng) < size
        fprintf('Too short. It should be at least %i character(s) long!\n', size);
    end
end
end

