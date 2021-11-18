% Jacob Alspaw
% jaa134

clear all
testNums = input('Enter an array to start the fun: ');
x1vals = 0.05:0.1:0.95;
x2vals = -4:8/9:4;
for i = 1:length(testNums)
    subplot(length(testNums), 2, 2 * (i - 1) + 1);
    randVals = [ ];
    for j = 1:testNums(i)
        randVals = [randVals rand];
    end
    hist(randVals, x1vals);
    title(['rand, Trials = ' num2str(testNums(i))]);
    xlabel('Random Value');
    ylabel('Quantity');;
    subplot(length(testNums), 2, 2 * i);
    randnVals = [ ];
    for j = 1:testNums(i)
        randnVals = [randnVals randn];
    end
    hist(randnVals, x2vals);
    title(['randn, Trials = ' num2str(testNums(i))]);
    xlabel('Random Value');
    ylabel('Quantity');
end
