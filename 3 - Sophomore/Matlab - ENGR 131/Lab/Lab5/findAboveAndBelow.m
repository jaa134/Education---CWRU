% Jacob Alspaw
% jaa134

function findAboveAndBelow(a)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

avg = mean(a);
above = a(a > avg)
below = a(a < avg)

end

