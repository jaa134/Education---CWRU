% Jacob Alspaw
% jaa134

% Part A
time = 10;
initial = 7;
massLBS = 150;
massKG = 150 * 0.4536;
C1 = initial * exp(-30 * time / massKG)

% Part B
newMass = massKG + massKG * 0.15;
C2 = initial * exp(-30 * time / newMass)
percentDifference = (C2 - C1) / C1

