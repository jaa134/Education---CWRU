% Jacob alspaw
% jaa134

choice = -1;
while choice ~= 0
    disp('0. Quit')
    disp('1. Plot ECG')
    disp('2. Get heart rate')
    choice = input('Enter your choice: ');
    if choice == 1
        filename = input('Enter a filename: ', 's');
        data = load(filename);
        times = (0:(length(data)-1)) * 0.001;
        plot(times, data)
        xlabel('Time (sec)')
        ylabel('ECG Level')
        title(filename)
    elseif choice == 2
        filename = input('Enter a filename: ', 's');
        rate = getRate1(filename);
        fprintf('The heart rate is %.1f beats per minute.\n\n', rate)
    end
end
