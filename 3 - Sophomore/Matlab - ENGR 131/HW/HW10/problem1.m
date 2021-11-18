% Jacob Alspaw
% jaa134

v1 = input('Enter velocity of vehicle #1: ');
d1 = input('Enter initial distance of vehicle #1: ');
v2 = input('Enter velocity of vehicle #2: ');
d2 = input('Enter initial distance of vehicle #2: ');

syms d t
eqn1 = (v1 * t) + d1 == d;
eqn2 = (v2 * t) + d2 == d;
[dSol, tSol] = solve([eqn1, eqn2], [d, t]);
if isempty(dSol) || isempty(tSol)
    d = 0:10;
else
    d = double(tSol) - 10 : double(tSol) + 10;
end
line1 = polyval([v1 d1], d);
line2 = polyval([v2 d2], d);
plot(d, line1, 'b', d, line2, 'g');
xlabel('Time');
ylabel('Distance');
legend('Vehicle 1', 'Vehicle 2', 'Location', 'Northwest');
if isempty(dSol) || isempty(tSol)
    title('No Solution');
else
    hold on
    plot(double(tSol), double(dSol), 'ro');
    title(sprintf('time = %f, distance = %f', double(tSol), double(dSol)));
end
