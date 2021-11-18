% Jacob Alspaw
% jaa134

function problem4(varargin)
% A function to play a set of sounds.
% A function that will open a set of .wav files and play their contents.
for i = 1:nargin
    sound(wavread(varargin{i}))
end
