% Jacob Alspaw
% jaa134

clear
fid = fopen('ages.txt');
if fid > 2
    a = fscanf(fid, '%d');
    fclose(fid);
    avg = mean(a);
    fprintf('The average age is %f\n', avg);
else
    disp('Could not load the file!');
end