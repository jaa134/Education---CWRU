% Jacob Alspaw
% jaa134

function n = problem2(fHandle, accuracy)
% A function to tell how many interations are needed to be close to pi.
% A function to recieve a handle and be able to implement many types of
% functions to calculate how many iterations are needed to find when an
% estimate for pi is close enough to pi.
n = 1;
error = problem1(fHandle, n); 
while error > accuracy
    n = n + 1;
    error = problem1(fHandle, n);
end

