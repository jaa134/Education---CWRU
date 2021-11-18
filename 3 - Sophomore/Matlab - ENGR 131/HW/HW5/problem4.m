% Jacob Alspaw
% jaa134

function problem4()
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

options = ['Quit             '; 'All temperatures '; 'Mean temperatures'];
selection = textMenu(options);
while selection ~= 1
    if selection == 2
        allT();
    elseif selection == 3
        meanT();
    end
    selection = textMenu(options);
end

function [temperatures impactE] = loadData()
values = load('energyTests.txt');
temperatures = values(1,:);
impactE = values(2:size(values(:, 1)),:);

function allT
[temperatures impactE] = loadData;
plot(temperatures, impactE, 'o-')
title('All Temperatures')
xlabel('Temperature (deg C)')
ylabel('Impact Energy (J)')

function meanT
[temperatures impactE] = loadData;
plot(temperatures, mean(impactE), 'b-')
hold on
plot(temperatures, mean(impactE), 'bo')
title('Mean Temperatures')
xlabel('Temperature (deg C)')
ylabel('Impact Energy (J)')


