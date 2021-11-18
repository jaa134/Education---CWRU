% Jacob Alspaw
% jaa134

clear
x = -10:0.1:10;
y1 = polyval([1 -4 4], x);
y2 = y1 + 20 * rand(1, length(y1)) - 10;
y3 = polyval(polyfit(x, y2, 2), x);
coefficients = polyfit(x, y2, 2);
fprintf('a = %.3f, b = %.3f, c = %.3f\n', coefficients(1), coefficients(2), coefficients(3));
subplot(1, 2, 1);
plot(x, y2, 'b', x, y3, 'r');
title('Noisy Data & Estimated Curve');
legend('Noisy Data', 'Estimated Curve');
subplot(1, 2, 2);
plot(x, y1, 'r', x, y3, 'b');
title('Original Curve & Estimated Curve');
legend('Original Curve', 'Estimated Curve');
axis([0 5 -1 10]);
