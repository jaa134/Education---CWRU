% Jacob Alspaw
% jaa134

clear
count = 0;
secretID = 123456789;
% data input section
id = input('Enter your ID: ');
while id ~= secretID
    candidate = input('Enter the candidate name: ', 's');
    count = count + 1;
    votes(count) = struct('id', id, 'candidate', candidate);
    id = input('Enter your ID: ');
end
% display section
for i = 1:length(votes)
    fprintf('%d     %s\n', votes(i).id, votes(i).candidate)
end