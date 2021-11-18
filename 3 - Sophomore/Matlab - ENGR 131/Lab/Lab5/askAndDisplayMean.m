% Jacob Alspaw
% jaa134

function askAndDisplayMean()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
data = input('Enter an array: ');
avg = mean(data);
plot(1:length(data), data, 'bo-');
hold on
plot([1 length(data)], [avg avg], 'r');
legend('data', 'mean');
ylabel('Value');
xlabel('Index');
end

