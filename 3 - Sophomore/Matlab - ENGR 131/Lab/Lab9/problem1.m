% Jacob Alspaw
% jaa134
frequencies = input('Enter an array of frequencies: ');
times = 0:0.1:2*pi;
for i = 1:length(frequencies)
    subplot(length(frequencies), 1, i)
    y = sin(frequencies(i) * times);
    plot(times, y)
    title(['Frequency: ', num2str(frequencies(i)), ' vs. Time'])
end