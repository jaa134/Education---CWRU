% Jacob Alspaw
% jaa134

clear
fid = fopen('people.txt');
if fid > 2
    b = textscan(fid, '%s %d');
    fclose(fid);
    names = b{1};
    ages = b{2};
    for i = 1:length(names)
        fprintf('%d. %s\n', i, names{i});
    end
    selection = input('Select a name: ');
    fprintf('The age for that person is %d.\n', ages(selection));
else
    disp('Could not open the file!');
end