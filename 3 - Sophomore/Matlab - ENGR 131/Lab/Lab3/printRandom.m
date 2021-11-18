% Jacob alspaw
% jaa134

function [ void ] = printRandom( size )
% Displays Random Numbers
% The function recieves a quantity of numbers and does not return a value.
i = 0;
vect = rand(1, size);
for i = 1:size
    fprintf('#%i: %.6f\n', i, vect(i));
end
end

