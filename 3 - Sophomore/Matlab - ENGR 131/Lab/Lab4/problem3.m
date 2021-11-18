% Jacob Alspaw
% jaa134

numStudents = 0;
numGrades = 0;
sum = 0;
load grades.txt 
fprintf('Total Students: %d. Total Grades: %d. Average grade: %.1f.\n', length(grades), length(grades(grades > 0)), mean(grades(grades > 0)));