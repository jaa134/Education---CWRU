% Jacob Alspaw
% jaa134

function soundwavePlayer
% Plays a song.
% Plays a song based off a file input from the user. Will use the
% frequencies and the durations within the file as references. 

% menu options
options{1} = 'Quit';
options{2} = 'Enter values and save file';
options{3} = 'Load and play file';

% does what the user chooses from the text menu
choice = textMenu(options);
disp(' ');
while choice ~= 1
    if choice == 2
        enterAndSave;
    end
    if choice == 3
        loadAndPlay;
    end
    if choice ~= 2 && choice ~= 3
        disp('That is not allowed!');
    end
    fprintf('\n') ;
    choice = textMenu(options);
end

% subfunction to allow user to enter frequncies and durations to save to
% user specified filename
function enterAndSave
filename = input('Enter a filename: ', 's');
fid = fopen(filename, 'w');
freq = input('Enter a frequency (0 or negative to quit): ');
while freq > 0
    duration = input('Enter a duration in seconds: ');
    fprintf(fid, '%f %f\r\n', freq, duration);
    freq = input('Enter a frequency (0 or negative to quit): ');
end
fclose(fid);
disp('File saved.')

% subfunction to read a file with frequencies and durations and eventually
% play the sounds
function loadAndPlay
filename = input('Enter a filename: ', 's');
fid = fopen(filename);
if fid > 2
    % gather data from the file
    song = fscanf(fid, '%f %f', [2 inf]);
    fclose(fid);
    frequencies = song(1,:);
    durations = song(2,:);
    % creates sin waves
    step = 2 * pi / 8192;
    for i = 1:length(frequencies)
        t = 0:step:(2 * pi * durations(i));
        waves{i} = sin(frequencies(i) * t);
    end
    disp('Now playing...')
    % plays sin waves
    for i = 1:length(waves)
        sound(waves{i});
    end
else
    disp('ERROR: Could not open file.')
end
