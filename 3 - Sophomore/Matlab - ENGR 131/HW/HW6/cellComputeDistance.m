% Jacob Alspaw
% jaa134

function cellComputeDistance
% Finds the distance between two cities
% A function that asks a user for input of two towns and then performs
% calculations to find the distance between their epicenters using cells.
map{1} = 'Datatown';
map{2} = 'Loopburg';
map{3} = 'Bitville';
x = [8.0 3.0 0.0]; % All x-coordinates
y = [9.0 4.0 0.0]; % All y-coordinates
% data gathering section
town1 = input('Enter the name of location #1: ', 's');
index = getLocation(map, town1);
if index > 0
    town1x = x(index);
    town1y = y(index);
    town2 = input('Enter the name of location #2: ', 's');
    index = getLocation(map, town2);
    if index > 0
        town2x = x(index);
        town2y = y(index);
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
    if strcmp(list{i}, name)
        location = i;
        break
    end
    i = i + 1;
end
if location == 0
    disp('ERROR: That is not a valid location.')
end
