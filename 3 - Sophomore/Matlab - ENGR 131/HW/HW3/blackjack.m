% Jacob Alspaw
% jaa134

clear
sum = 0;
choice = 1;
while sum < 21 && choice == 1
    card = randi(10, 1);
    sum = sum + card;
    fprintf('New Card: %i\n', card);
    if sum > 21
        fprintf('Your total is %i.\nBusted!\n', sum);
        break
    end
    if sum == 21
        disp('Your win with a total of 21!\nCongratulations!');
        break
    end
    choice = input('Stand (0) or hit (1)? ');
    while choice ~= 0 && choice ~= 1
        choice = input('Stand (0) or hit (1)? ');
    end
end
if choice == 0
    fprintf('You stood up with a total of %i.\n', sum);
end