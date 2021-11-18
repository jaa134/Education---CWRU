% Jacob Alspaw
% jaa134

disp('Select a username.');
user = getString(1);
save username.txt user -ascii
disp('Select a password.');
pass = getString(6);
save password.txt pass -ascii
disp('Your account information has been saved.');