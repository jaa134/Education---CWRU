% Jacob Alspaw
% jaa134

% Convert F to C
% This is a function that will convert a Fahrenheit input to Celsius and
% then display both temperatures.

f = input('Please input a number in Fahrenheit:');
c = convertFtoC(f);
fprintf('%f degrees Fahrenheit is equal to %f degrees Celsius.', f, c);
