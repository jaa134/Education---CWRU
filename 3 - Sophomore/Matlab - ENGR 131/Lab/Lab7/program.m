fid = fopen('grades.txt');
a = fscanf(fid, '%d')
fclose(fid);
fid = fopen('grades.txt');
b = textscan(fid, '%d')
fclose(fid);
