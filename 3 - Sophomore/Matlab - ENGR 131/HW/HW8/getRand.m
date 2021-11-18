% Jacob Alspaw
% jaa134

function values = getRand(varargin)
% A function to return a random number.
% A function to return a random number from 1 up until the number input in
% the function's argument. Second argment can be the number of random
% values returned.
if nargin == 1
    values = floor(rand * varargin{1}) + 1;
end
if nargin == 2
    values = floor(rand(1, varargin{2}) * varargin{1}) + 1;
else
    disp('Arguments not allowed!');
end