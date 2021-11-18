%Jacob Alspaw
%jaa134

% Part A
numerator = (2125 ^ 3) + (214 ^ 3) + (30^3) + (37 ^ 2);
denominator = 82 ^ 5;
myPi = (100 - numerator / denominator) ^ 0.25;
pi - myPi


% Part B
S = 1;
R = 0.2;
r = 0.1;
theta = asin((R - r) / S);
L1 = (2 * S * cos(theta)) + (pi * (R + r)) + (2 * theta * (R - r))
L2 = (2 * S * cos(theta)) + (myPi * (R + r)) + (2 * theta * (R - r))
L2 - L1