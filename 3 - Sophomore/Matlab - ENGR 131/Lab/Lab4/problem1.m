% Jacob Alspaw
% jaa134

newGrade = 1;
num = 1;
grades = [];
while newGrade >= 0
    fprintf('Ready for the grade for student #%i\n', num);
    newGrade = input('Enter 0 for no grade or negative to quit: ');
    if newGrade > 0
        grades = [grades newGrade];
    end
    if newGrade == 0
        grades = [grades -1];
    end
    num = num + 1;
end
save grades.txt grades -ascii
disp('The file grades.txt has been saved.');