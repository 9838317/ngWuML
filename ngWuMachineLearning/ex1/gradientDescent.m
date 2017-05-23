%The aim of this function is to calculate the cost of each theta as well as updating theta.
%Using vectorization, it is easy to calculate the gradient without iteration.
%    Assuming we get Distance1D, so
%        (Distance1D * X_1';) results in the sum of X_1. Similarily,
%        (Distance1D * X_2';) results in the sum of X_2
%                ...
%        (Distance1D * X_D';) results in the sum of X_D
%    With vectorization, It can be written as:
%
%        Gradient = (Distance1D * X') / m;

%    Thus the updating of theta could be written as 
    
%        theta = theta - alpha * Gradient; 

function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

    m     = length(y); 

    X     = helperDetermineDimen(X);
 

    theta = helperDetermineTheta(theta);
    Y     = helperDetermineTheta(y)';

    for iter = 1:num_iters

        gradients = 1.0 / m * (helper1Ddistance(theta, X, Y) * X');
        gradients = helperDetermineTheta(gradients);
        J_history(iter) = computeCost(X, y, theta);
        theta = theta - 1.0 * alpha * gradients; 
    
    end

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


