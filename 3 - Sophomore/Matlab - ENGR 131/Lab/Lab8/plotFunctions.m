% Jacob Alspaw
% jaa134
function plotFunctions(fHandle1, fHandle2)
% A function to plot handle's values
% A function to plot a handle's vlaue and then make a graph from the two
% resultant vectors. One function will be blue and the next will be red.
xvals = 0:0.01:6;
y1vals = fHandle1(xvals);
y2vals = fHandle2(xvals);
plot(xvals, y1vals, 'b')
hold
plot(xvals, y2vals, 'r')
set(gca, 'YTick', -1:0.5:1)
xlabel('x')
ylabel('y')
legend(func2str(fHandle1), func2str(fHandle2))
