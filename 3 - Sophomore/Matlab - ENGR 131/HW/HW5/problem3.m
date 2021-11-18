% Jacob Alspaw
% jaa134

function problem3()
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

loggedIn = 0;
selection = -1;
while selection ~= 1
    if ~loggedIn
        disp('You are currently logged out.')
        selection = textMenu(['Quit '; 'Login']);
        if selection == 2
            loggedIn = login;
        end
    else
        disp('You are currently logged in.')
        selection = textMenu(['Quit  '; 'Logout']);
        if selection == 2
            loggedIn = 0;
            disp(' ');
        end
    end
end
disp(' ');

function loggenIn = login()
username = input('Enter username: ', 's');
password = input('Enter password: ', 's');
if strcmp(username, 'chris') && strcmp(password, 'engr131')
    disp('Login successful!')
    disp(' ');
    loggenIn = 1;
else
    disp('ERROR: login information does not match our records.')
    disp(' ');
    loggenIn = 0;
end

