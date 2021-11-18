% Jacob Alspaw
% jaa134

function pic = grayscale2(filename)
% GRAYSCALE2 Make an image into grayscale
%    Receives a filename and returns a converted 3D array, with vecorization.
pic = imread(filename);
doubleVals = double(pic);
grayscale = (doubleVals(:,:,1) + doubleVals(:,:,2) + doubleVals(:,:,3)) / 3;
pic(:,:,1) = grayscale;
pic(:,:,2) = grayscale;
pic(:,:,3) = grayscale;
image(pic)