function [ result, varargout ] = helperNNCalculateActivate(varargin)
%  This function accept varargin to finally calculate the output of a neural network. 
%        the structure of varargin is like following:
%            varargin  == (theta1, theta2, ..., thetak, X, dimentionOfX).
%  So if everything can be smooth, then 
%  the final result will be the calculated activated matrix of Y_pred
%
%
% 
    lengthOfArgs    = length(varargin);
    numberOfThetas  = lengthOfArgs - 2;

    d               = varargin{lengthOfArgs};
    X               = varargin{lengthOfArgs - 1};
    X               = helperDetermineDimen(X, d);
    Xcalculate      = X;
    for i = 1:numberOfThetas
        Xcalculate  = helperChangeDimention(Xcalculate);
        [d, m]      = size(Xcalculate);
        varargin{i} = helperDetermineTheta(varargin{i}, d);
        Xcalculate  = helperSigmoidize(varargin{i},Xcalculate);
        varargout{i}= Xcalculate;
    end
    result = Xcalculate;
end


function [outputRightMatrix] = helperDetermineDimen (inputMatrix, dimention)


	outputRightMatrix     = inputMatrix;
	[row col]             = size(inputMatrix);
	
	if nargin == 1
	    if row > col
		outputRightMatrix = inputMatrix';
	    end
	end


	if nargin == 2
	    if col == dimention
		outputRightMatrix = inputMatrix';
	    end
	end

end %end of function

function [outputRightTheta] = helperDetermineTheta (inputTheta, dimention)


	outputRightTheta = inputTheta;
	[row col]        = size(inputTheta);

	if nargin == 1
	    if row < col
		outputRightTheta = inputTheta';
	    end
	end


	if nargin == 2
	    if col == dimention
		outputRightTheta = inputTheta';
	    end
	end

end %end of function


function [ result ] = helper1Ddistance( theta, X, Y )

    % The aim of this file is to calculate 1D distance
    % the result is (theta' * X - Y)
    
    result = (theta' * X - Y);
    
end %end of function

function [ cost ] = helperLogisticCost(theta, X, Y, m)

    % the result is sum(-Y * log(hOfX) - (1 - Y) * log(1 - hOfX)) / m.

    hOfX = sigmoid(theta' * X);
    cost = 1.0 * (-Y * log(hOfX)' - (1 - Y) * log(1 - hOfX)') / m;
    
end 

function [ cost ] = helperLogisticCostReg( theta, X, Y, m, lambda)

    % the result is sum(-Y * log(hOfX) - (1 - Y) * log(1 - hOfX)) / m + labmda / (2 * m) + theta. * theta.
    hOfX = sigmoid(theta' * X);
    theta(1) = 0;
    cost = 1.0 * (-Y * log(hOfX)' - (1 - Y) * log(1 - hOfX)') / m + 0.5 * lambda / m * theta' * theta;
    
end %end of function

function [sigmoidization] = helperSigmoidize (inputTheta, inputMatrix)

	sigmoidization = sigmoid(inputTheta' * inputMatrix);
	
end %end of function

function [ rightMatrix ] = helperChangeDimention( XMatrix )

% This is to add another dimention to X. from [dimensions * datapoints] to [(dimensions + 1) * datapoints]

% The aim of this file is to add another dimention to the X. e.g, x_400 -> x_401
% The input should be a standard matrix of Dimention * m
% the result is (Dimention + 1) * datapoints

[r, c]      = size(XMatrix);
rightMatrix = [ones(1, c); XMatrix];

end %end of function
