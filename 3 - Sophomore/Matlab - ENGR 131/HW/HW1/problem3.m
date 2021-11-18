% Jacob Alspaw
% jaa134
format long;
initial = 10;
rate = 0.05;

% Part A
b1A = initial + initial * rate;
b2A = b1A + b1A * rate;
b3A = b2A + b2A * rate;
b4A = b3A + b3A * rate;
b5A = b4A + b4A * rate;
balance1 = b5A

% Part B
b1B = initial * (1 + rate);
b2B = b1B * (1 + rate);
b3B = b2B * (1 + rate);
b4B = b3B * (1 + rate);
b5B = b4B * (1 + rate);
balance2 = b5B

% Part C
balance3 = initial * (1 + rate) ^ 5