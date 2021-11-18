% Jacob Alspaw
% jaa134

function error = problem1(fHandle, n)
% A function to use many options to calculate an algorithms offset from pi.
% A function to use a handle to calculate a pi esitmate and find the
% difference form the theoretical value of pi.
estimate = fHandle(n);
error = abs(estimate - pi);