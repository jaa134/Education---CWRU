% Jacob Alspaw
% jaa134

clear
deltaT = input('Enter time step: ');
stop = input('Enter simulation stop time: ');
C = 0.6;
h0 = 1;
v0 = 0;
t = 0;
while t < stop
    h0 = h0 + (v0 * deltaT);
    v0 = v0 - (9.8 * deltaT);
    if h0 <= 0
        h0 = -h0;
        v0 = -v0 * C;
    end
    t = t + deltaT;
    plot(t, h0, 'o');
    xlabel('Time (sec)');
    ylabel('Height (m)');
    title('C = 0.6');
    axis([0 stop 0 1]);
    pause(0.015);
end
