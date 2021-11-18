% Jacob Alspaw
% jaa134

r1 = input('Enter radius of pulley #1: ');
r2 = input('Enter radius of pulley #2: ');
r3 = input('Enter radius of pulley #3: ');
S1 = input('Enter the distance between pulleys #1 and #2: ');
S2 = input('Enter the distance between pulleys #2 and #3: ');
if (r1 > 0 && r2 > 0 && r3 > 0 && S1 > (r1 + r2) && S2 > (r2 + r3))
    beltLength = getBeltLength(r1, r2, S1) + getBeltLength(r2, r3, S2);
    fprintf('Total belt length is %.2f meters.\n', beltLength)
else
    disp('Error: Invalid Value.')
end