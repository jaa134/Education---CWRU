% Jacob Alspaw
% jaa134

function pic = grayscale1(filename)
% GRAYSCALE1 Make an image into grayscale
%    Receives a filename and returns a converted 3D array, using a loop.
pic = imread(filename); % Load the image
[rows cols colors]  = size(pic);
for row = 1:rows
    for col = 1:cols
        pic(row, col, :) = mean(pic(row, col, :));
    end
end
image(pic)
