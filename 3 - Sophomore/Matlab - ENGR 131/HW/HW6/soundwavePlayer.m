% Jacob Alspaw
% jaa134

function soundwavePlayer
% Plays sin waves.
% A method that produces audible noises based off the fequencies of input
% frequencies for sin waves.
step = 2 * pi / 8192;
% gather data section
freq = input('Enter a frequency (0 or negative to quit): ');
index = 1;
while freq > 0
    duration = input('Enter a duration in seconds: ');
    t = 0:step:(2 * pi * duration);
    waves{index} = sin(freq * t);
    index = index + 1;
    freq = input('Enter a frequency (0 or negative to quit): ');
end
% sound section
disp('Now playing...')
for i = 1:length(waves)
    sound(waves{i})
end
disp('Finished!');
end