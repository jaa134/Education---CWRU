% Jacob Alspaw
% jaa134

function estimate = newton(n)
% A function to represent Newton's Algoithm for Pi.
% A function that implements Newton's algorithm. A larger number of
% iterations will produce a more accurate number, with a max number of
% iterations of 91.
sum = 0;
for k = 0:n
    sum = sum + ((2 ^ k * factorial(k) ^ 2) / (factorial(2 * k + 1)));
end
estimate = sum * 2;
    