% Jacob Alspaw
% jaa134

function structComputeDistance
% Finds the distance between two cities
% A function that asks a user for input of two towns and then performs
% calculations to find the distance between their epicenters using structs.
map(1) = struct('name', 'Datatown', 'x', 8.0, 'y', 9.0);
map(2) = struct('name', 'Loopburg', 'x', 3.0, 'y', 4.0);
map(3) = struct('name', 'Bitville', 'x', 0.0, 'y', 0.0);

town1 = input('Enter the name of location #1: ', 's');
index = getLocation(map, town1);
if index > 0
    town1x = map(index).x;
    town1y = map(index).y;
    town2 = input('Enter the name of location #2: ', 's');
    index = getLocation(map, town2);
    if index > 0
        town2x = map(index).x;
        town2y = map(index).y;
        distance = sqrt((town1x - town2x) ^ 2 + (town1y - town2y) ^ 2);
        fprintf('The distance between %s and %s is %.1f meters.\n', town1, town2, distance)
    end
end

% Subfunction to get the array of names and the single name of a location
% to be searched for.
function location = getLocation(list, name)
i = 1;
location = 0;
while i <= length(list)
    if strcmp(list(i).name, name)
        location = i;
        break
    end
    i = i + 1;
end
if location == 0
    disp('ERROR: That is not a valid location.')
end

