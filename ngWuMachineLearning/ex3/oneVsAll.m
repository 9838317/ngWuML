function [all_theta] = oneVsAll(X, y, num_labels, lambda)



    m = size(X, 1);
    n = size(X, 2);

    
    X     = helperDetermineDimen(X);
    X     = helperChangeDimention(X);
    Y     = helperDetermineTheta(y)';

    initial_theta = zeros(n + 1, 1);
    options       = optimset('GradObj', 'on', 'MaxIter', 20);


    %//the fmincg function is to generate a theta depends on the actual Y and actual X, it is a buildin optimization function that finally generate an appropriate theta.
    for i = 1:num_labels
    	eachBooleanY    = (Y == i);
    	[theta]         = fmincg (@(t)(lrCostFunction(t, X, eachBooleanY, lambda)), initial_theta, options);
    	all_theta(i,:)  = theta(:)';
    end

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

% This is to add another dimention to X. from [dimensions * datapoints] to [(dimensions + 1) * datapoints]

% The aim of this file is to add another dimention to the X. e.g, x_400 -> x_401
% The input should be a standard matrix of Dimention * m
% the result is (Dimention + 1) * datapoints

[r, c]      = size(XMatrix);
rightMatrix = [ones(1, c); XMatrix];

end %end of function
