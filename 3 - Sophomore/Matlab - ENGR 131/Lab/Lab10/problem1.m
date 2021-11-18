% Jacob Alspaw
% jaa134

clear
x = -10:0.1:10;
y1 = polyval([1 -4 4], x);
y2 = y1 + 20 * rand(1, length(y1)) - 10;
plot(x, y1, x, y2, 'g');
legend('No noise', 'With noise');
set(gca, 'XTick', [-10 -5 0 5 10]); 
