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


function [J, grad] = helperLinearCost(X, y, theta, lambda, n)

    m = length(y);
    theta         = helperDetermineTheta(theta, n);
    X             = helperDetermineDimen(X, n);
    Y             = helperDetermineTheta(y)';
    J1 = 0.5 / m *  sum(  helper1Ddistance(theta, X, Y) .* helper1Ddistance(theta, X, Y)  );
    grad = 1.0 / m * helper1Ddistance(theta, X, Y) * X';

    theta(1)     = 0;
    J2 = 0.5 * lambda / m * sum(theta .* theta);
    J = J1 + J2;
    grad = grad + lambda / m * theta';

end %end of main function













function [ result ] = helper1Ddistance( theta, X, Y )

    % The aim of this file is to calculate 1D distance
    % the result is (theta' * X - Y)
    
    result = (theta' * X - Y);
    
end %end of function





































function [J grad] = helperMultiLogisticCost(activation, Y, m)

    [d, n]     = size(activation);
    YCalculate = zeros(d, n) ;
    for i  = 1:d
        YCalculate(i,:) = (Y == i);
    end
        
    elementWiseMatrix = (-YCalculate .* log(activation) - (1 - YCalculate) .* log(1 - activation))  / m;

    J =         sum(sum(elementWiseMatrix));
    grad = 0;

end

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




function [sigmoidization] = helperSigmoidize (inputTheta, inputMatrix)

	sigmoidization = sigmoid(inputTheta' * inputMatrix);
	
end %end of function


function [ cost, derivative ] = helperLogisticCost(theta, X, Y, m, hOfX)



    % the result is sum(-Y * log(hOfX) - (1 - Y) * log(1 - hOfX)) / m.

    if nargin == 4
    	hOfX = sigmoid(theta' * X);
    end

    if nargin == 5
    	hOfX = hOfX;
    end

    %finally derivative is a column vector;
    derivative = 1.0 / m * (hOfX - Y) * X';
    cost = 1.0 * (-Y * log(hOfX)' - (1 - Y) * log(1 - hOfX)') / m;
    
end 

%this function easily sums all the (parameters[i] .* parameters[i])

%this function easily sums all the (parameters[i] .* parameters[i])

function [ result ] = helperMLNNRegSum( varargin )

    lenArgVec = length(varargin);

    result = 0;
    
    for i = 1:lenArgVec
        varargin{i}(1,:) = 0;
        result = result + sum(sum(varargin{i} .* varargin{i}));
    end
    
end


