% Jacob Alspaw
% jaa134

velocityI = input('Enter initial velocity (m/s): ');
heightI = input('Enter initial height (m): ');
timeE = input('Enter an ending time (s): ');
%time at any point
t = 0:0.1:timeE;
%the height at the above time
h = (-0.5 * 9.8 * (t .^ 2)) + (velocityI * t) + heightI;
plot(t, h)
xlabel('Time (s)')
ylabel('Height (m)')
title('Height vs. Time')
grid on
hold on
groundLvl = (-velocityI - sqrt((velocityI ^ 2) - (4 * -0.5 * 9.8 * heightI))) / (2 * -0.5 * 9.8);
plot(groundLvl, 0, 'ro')
groundLvl = (-velocityI + sqrt((velocityI ^ 2) - (4 * -0.5 * 9.8 * heightI))) / (2 * -0.5 * 9.8);
plot(groundLvl, 0, 'ro')
