% Jacob Alspaw
% jaa134

function choice = textMenu(options)
% Creates a menu.
% A function that will take a cell array of strings and make a menu from the contents. 
for i = 1:length(options)
    fprintf('%d. %s\n', i, options{i})
end
choice = input('Enter your choice: ');