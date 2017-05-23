function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y); 
grad = zeros(size(theta));

    theta = helperDetermineTheta(theta);
    X     = helperDetermineDimen(X);
    Y     = helperDetermineTheta(y)';

    [J, grad]     = helperLogisticCostReg(theta, X, Y, m, lambda);



end %end of main function


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



function [sigmoidization] = helperSigmoidize (inputTheta, inputMatrix)

	sigmoidization = sigmoid(inputTheta' * inputMatrix);
	
end %end of function


function [ cost, derivative ] = helperLogisticCostReg( theta, X, Y, m, lambda)

    % the result is sum(-Y * log(hOfX) - (1 - Y) * log(1 - hOfX)) / m + labmda / (2 * m) + theta. * theta.
    hOfX = sigmoid(theta' * X);
    theta(1) = 0;
    cost = 1.0 * (-Y * log(hOfX)' - (1 - Y) * log(1 - hOfX)') / m + 0.5 * lambda / m * theta' * theta;
     
    thetaForDerivative = [0;theta(2:end)];

    %finally derivative is a column vector;
    derivative = 1.0 / m * (hOfX - Y) * X' + (lambda / m * thetaForDerivative)';
    

end %end of function
