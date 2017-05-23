%Aim of this function is to calculate the cost of a given theta
%cost is defined by least square. So we wrap the calculation into a function of 
%    helper1Ddistance(theta, X, Y)
%That's it.


function J = computeCost(X, y, theta)


    m = length(y);
    theta         = helperDetermineTheta(theta);
    X             = helperDetermineDimen(X);
    Y             = helperDetermineTheta(y)';

    J = 0.5 / m *  sum(helper1Ddistance(theta, X, Y) .* helper1Ddistance(theta, X, Y));

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
	    if row > col
		outputRightMatrix = inputTheta';
	    end
	end


	if nargin == 2
	    if col == dimention
		outputRightMatrix = inputTheta';
	    end
	end

end %end of function



function [ result ] = helper1Ddistance( theta, X, Y )

    % The aim of this file is to calculate 1D distance
    % the result is (theta' * X - Y)
    
    result = (theta' * X - Y);
    
end %end of function
