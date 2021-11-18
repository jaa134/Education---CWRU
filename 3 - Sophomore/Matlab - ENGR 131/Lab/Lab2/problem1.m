% Jacob Alspaw
% jaa134

load months.txt;
load temps.txt;
plot(months(1, :), temps(1, :), 'bo-');
title('Average High Temperature For Cleveland, OH');
xlabel('Month (#)');
ylabel('Temperature (F)');
set(gca,'XTick', 4:5:6:7:8:9);