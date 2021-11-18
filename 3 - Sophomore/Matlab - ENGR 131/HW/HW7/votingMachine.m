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

if count > 0
    % saving to file section
    fid = fopen('votes.txt', 'w');
    for i = 1:length(votes)
        fprintf(fid, '%d\t%s\r\n', votes(i).id, votes(i).candidate);
    end
    fclose(fid);
    disp('All votes saved!');
else
    disp('There were no votes to save!');
end
