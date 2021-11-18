% Jacob Alspaw
% jaa134

numStudents = 0;
numGrades = 0;
avgGrades = 0;
sum = 0;
load grades.txt 
for i = 1:length(grades)
    numStudents = numStudents + 1;
    if grades(i) > 0
        numGrades = numGrades + 1;
        sum = sum + grades(i);
    end
end
avgGrades = sum / numGrades;
fprintf('Total Students: %d. Total Grades: %d. Average grade: %.1f.\n', numStudents, numGrades, avgGrades);
    
    