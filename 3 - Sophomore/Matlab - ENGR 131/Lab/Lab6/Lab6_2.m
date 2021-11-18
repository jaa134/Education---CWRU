% Jacob Alspaw
% jaa134
clear
day = input('Which day (0 to quit)? ');
% input part
while day ~= 0
    data{day} = input('Enter the data: ');
    day = input('Which day (0 to quit)? ');
end
% display part
for i = 1:length(data)
    fprintf('The average for day #%d was %f.\n', i, mean(data{i}))
end