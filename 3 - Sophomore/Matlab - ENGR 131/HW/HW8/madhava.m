% Chris Fietkiewicz. Estimates values of pi using Madhava algorithm.
function piEstimate = madhava(n)
sum = 0;
for k = 0:n
    sum = sum + (-1 / 3) ^ k / (2 * k + 1);
end
piEstimate = sum * sqrt(12);