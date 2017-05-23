function p = predict(Theta1, Theta2, X)

    m = size(X, 1);
    n = size(X, 2);
    num_labels        = size(Theta2, 1);

    X                 = helperDetermineDimen(X, n);
    X                 = helperChangeDimention(X);

    [d, m]            = size(X);
    Theta1            = helperDetermineTheta(Theta1, d);

    sigmoidizedMatrix = helperSigmoidize(Theta1, X);
    sigmoidizedMatrix = helperChangeDimention(sigmoidizedMatrix);

    [d, m]            = size(sigmoidizedMatrix);
    Theta2            = helperDetermineTheta(Theta2, d);

    sigmoidizedMatrix = helperSigmoidize(Theta2, sigmoidizedMatrix);


    [temp ,p] = max(sigmoidizedMatrix);

end

function [outputRightMatrix] = helperDetermineDimen (inputMatrix, dimension)


	outputRightMatrix     = inputMatrix;
	[row col]             = size(inputMatrix);
	
	if nargin == 1
	    if row > col
		outputRightMatrix = inputMatrix';
	    end
	end


	if nargin == 2
	    if col == dimension
		outputRightMatrix = inputMatrix';
	    end
	end

end %end of function

function [ rightMatrix ] = helperChangeDimention( XMatrix )

% This is to add another dimension to X. from [dimensions * datapoints] to [(dimensions + 1) * datapoints]

% The aim of this file is to add another dimension to the X. e.g, x_400 -> x_401
% The input should be a standard matrix of dimension * m
% the result is (dimension + 1) * datapoints

[r, c]      = size(XMatrix);
rightMatrix = [ones(1, c); XMatrix];

end %end of function


function [sigmoidization] = helperSigmoidize (inputTheta, inputMatrix)

	sigmoidization = sigmoid(inputTheta' * inputMatrix);
	
end %end of function


function [outputRightTheta] = helperDetermineTheta (inputTheta, dimension)


	outputRightTheta = inputTheta;
	[row col]        = size(inputTheta);

	if nargin == 1
	    if row < col
		outputRightTheta = inputTheta';
	    end
	end


	if nargin == 2
	    if col == dimension
		outputRightTheta = inputTheta';
	    end
	end

end %end of function
