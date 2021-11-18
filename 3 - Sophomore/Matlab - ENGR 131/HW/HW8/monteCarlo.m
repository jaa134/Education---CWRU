% Chris Fietkiewicz. Estimates values of pi using Monte Carlo algorithm.
function piEstimate = monteCarlo(n)
in = 0; % Number of coordinates found inside unit circle
for i = 1:n
    x = rand; % Random x-coordinate
    y = rand; % Random y-coordinate
    d = sqrt(x ^ 2 + y ^ 2); % Distance from (0,0)
    if d < 1 % If inside the unit circle...
        in = in + 1; % ... increase the count
    end
    piEstimate = 4 * in / n; % "n" is the total number of coordinates
end
