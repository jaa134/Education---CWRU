% Jacob Alspaw
% jaa134

function problem1()
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

numValues = load('dna.txt');
values = char(numValues);
pattern = input('Enter a search pattern: ', 's');
while length(pattern) > 0
    patL = validate(pattern);
    if patL == 0
        i = strfind(values, pattern);
        fprintf('There are %d occurrences.\n', length(i))
    else
        fprintf('ERROR: Found %d invalid characters.\n', patL)
    end
    pattern = input('Enter a search pattern: ', 's');
end


function pLength = validate(strng)
pLength = 0;
for i = 1:length(strng)
    if  strng(i) ~= 't' && strng(i) ~= 'g' && strng(i) ~= 'a' &&strng(i) ~= 'c' 
        pLength = pLength + 1;
    end
end
