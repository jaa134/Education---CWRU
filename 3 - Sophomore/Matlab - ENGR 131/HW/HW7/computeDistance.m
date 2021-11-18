% Jacob Alspaw
% jaa134

function computeDistance
% Finds the distance between two cities
% A function that asks a user for input of two towns and then performs
% calculations to find the distance between their epicenters using cells.

fid = fopen('map.txt');
if fid > 2
    % get data
    data = textscan(fid, '%s %f %f');
    fclose(fid);
    names = data{1};
    xCoord = data{2};
    yCoord = data{3};
    disp('The available locations are: ');
    for i = 1:length(names)
        fprintf('%d. %s\n', i, names{i})
    end
    % ask user
    town1 = input('Enter the name of location #1: ', 's');
    index = getLocation(names, town1);
    if index > 0
        town1x = xCoord(index);
        town1y = yCoord(index);
        town2 = input('Enter the name of location #2: ', 's');
        index = getLocation(names, town2);
        if index > 0
            town2x = xCoord(index);
            town2y = yCoord(index);
            distance = sqrt((town1x - town2x) ^ 2 + (town1y - town2y) ^ 2);
            fprintf('The distance between %s and %s is %.1f meters.\n', town1, town2, distance)
        end
    end
else
    disp('Could not open file.');
end
    
% Subfunction to get the array of names and the single name of a location
% to be searched for.
function location = getLocation(list, name)
i = 1;
location = 0;
while i <= length(list)
    if strcmp(list{i}, name)
        location = i;
        break
    end
    i = i + 1;
end
if location == 0
    disp('ERROR: That is not a valid location.')
end