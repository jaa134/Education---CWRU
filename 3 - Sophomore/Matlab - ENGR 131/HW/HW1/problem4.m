% Jacob Alspaw
% jaa134

a = 3;
b = 6;
c = 1;
x1 = (-b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a)
y1 = (a * x1 ^ 2) + (b * x1) + c
x1 = x1 + (1 * 10 ^ -16)
y1 = (a * x1 ^ 2) + (b * x1) + c