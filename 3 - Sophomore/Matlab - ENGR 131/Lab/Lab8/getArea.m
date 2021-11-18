% Jacob Alspaw
% jaa134
function area = getArea(varargin)
% A function to return an area.
% A function to calculate the area of a square, rectangle, or box using
% one, two, or three parameters respectively. If the number of parameters
% is not equal to 1, 2, or 3, then the function will say use is not
% supported.
if nargin == 1
    disp('The area of your square is: ');
    area = varargin{1} * varargin{1};
end
if nargin == 2
    disp('The area of your rectangle is: ');
    area = varargin{1} * varargin{2};
end
if nargin == 3
    disp('The area of your box is: ');
    area = varargin{1} * varargin{2} * varargin{3};
end
if nargin ==0 || nargin > 3
    disp('That is not valid at all!');
end