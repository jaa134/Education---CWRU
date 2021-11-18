% Jacob Alspaw
% jaa134

function problem5(varargin)
% A function to play a set of sounds.
% A function that will open a set of .wav files and play their contents,
% but in a fashion that will be careful of not creating an IO error. 
for i = 1:nargin
    fid = fopen([varargin{i} '.wav']);
    if fid ~= -1
        fclose(fid);
        sound(wavread(varargin{i}))
    else
        fprintf('ERROR: %s.wav not found.\n', varargin{i})
    end
end