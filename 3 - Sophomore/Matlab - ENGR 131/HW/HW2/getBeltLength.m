% Jacob Alspaw
% jaa134

function length = getBeltLength(r1, r2, d)
% Returns the length of a belt around two pulleys.
theta = asin((r1 - r2) / d);
length = (2 * d * cos(theta)) + (pi * (r1 + r2)) + (2 * theta * (r1 - r2));
