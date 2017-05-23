function [ rightMatrix ] = helperChangeDimention( XMatrix )

% This is to add another dimention to X. from [dimensions * datapoints] to [(dimensions + 1) * datapoints]

% The aim of this file is to add another dimention to the X. e.g, x_400 -> x_401
% The input should be a standard matrix of Dimention * m
% the result is (Dimention + 1) * datapoints

[r, c]      = size(XMatrix);
rightMatrix = [ones(1, c); XMatrix];

end %end of function
