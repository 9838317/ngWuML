function [J, grad] = lrCostFunction(theta, X, y, lambda)
%the aim of this function is to calculate the cost according to a specific theta.
    m = length(y); % number of training examples


    theta = helperDetermineTheta(theta);
    X     = helperDetermineDimen(X);
    Y     = helperDetermineTheta(y)';

    J     = helperLogisticCostReg(theta, X, Y, m, lambda);


thetaTransposeX    	= theta' * X;
yPred   		= sigmoid(thetaTransposeX);
tempTheta = [0; theta(2:end)];
gradient = 1.0/m * (yPred - Y) * X' + lambda / m * tempTheta';
grad = gradient(:);

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

