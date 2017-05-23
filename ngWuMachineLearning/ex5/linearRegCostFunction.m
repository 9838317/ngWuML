function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

    m            = length(y); 
    theta        = helperDetermineTheta(theta);
    [d, trivial] = size(theta);
    X      = helperDetermineDimen(X, d);  
    Y      = helperDetermineTheta(y)';

    [J, grad] = helperLinearCostReg(X, Y, theta, lambda, m);
    grad = grad(:);

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

function [ rightMatrix ] = helperChangeDimention( XMatrix )

[r, c]      = size(XMatrix);
rightMatrix = [ones(1, c); XMatrix];

end %end of function
    
function [J, grad] = helperLinearCostReg(X, Y, theta, lambda, m)
     
    J1            = 0.5 / m *  sum(  helper1Ddistance(theta, X, Y) .* helper1Ddistance(theta, X, Y)  );
    grad          = 1.0 / m * helper1Ddistance(theta, X, Y) * X';

    theta(1)      = 0;
    J2            = 0.5 * lambda / m * sum(theta .* theta);
    J             = J1 + J2;
    grad          = grad + lambda / m * theta';

end %end of main function

function [ result ] = helper1Ddistance( theta, X, Y )

    % The aim of this file is to calculate 1D distance
    % the result is (theta' * X - Y)
    
    result = (theta' * X - Y);
    
end %end of function

