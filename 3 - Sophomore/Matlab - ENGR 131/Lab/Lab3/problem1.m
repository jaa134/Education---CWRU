% Jacob Alspaw
% jaa134

howMany = input('How many numbers? ');
sum = 0;
for i = 1:howMany
    sum = sum + input('Enter a number: ');
end
fprintf('The sum is: %.1f\n', sum); 