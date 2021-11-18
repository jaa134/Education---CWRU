% Jacob Alspaw
% jaa134

clear
fid = fopen('ages.txt', 'w');
age = input('Enter an age (negative to quit): ');
while age >= 0
    fprintf(fid, '%d\n', age);
    age = input('Enter an age (negative to quit): ');
end
fclose(fid);