% Jacob Alspaw
% jaa134

function piEstimate = monteCarloVectorized(numPoints)
% A function used for the estimate of pi.
% A function that implements the Monte Carlo Algorithm and vectorization to
% calculate the value of pi.
x = rand(numPoints,1);
y = rand(numPoints,1);
%calculate distances from origin
d = sqrt(x .^ 2 + y .^ 2);
%find places inside circle
numCirclePoints = find(d < 1);
piEstimate = 4 * length(numCirclePoints) / numPoints;

