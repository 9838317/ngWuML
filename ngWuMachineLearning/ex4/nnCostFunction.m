function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));
    
    m                    = size(X, 1);
    n                    = size(X, 2);         

    X                    = helperDetermineDimen(X);
    Y                    = helperDetermineTheta(y)';
    Theta1               = helperDetermineTheta(Theta1, n + 1);
    Theta2               = helperDetermineTheta(Theta2, size(Theta1, 2) + 1);

    [result, activation2, activation3] = helperNNCalculateActivate(Theta1, Theta2, X, n);

    
    %the following method is actually a method of iteration. We can implement a vectorization method(next) in order to calculate it.
    %It is implemented with the help of helperLogisticCost, using iteration, it finally calculated the sum of each classification cost.

    J = 0.0;
    for i = 1:num_labels
        hOfX       = activation3(i,:);
        ycalculate = (Y == i);
        J = J + helperLogisticCost(0, 0, ycalculate, m, hOfX);
    end

  
    %this is the unregulated J with vectorization.
    [J, grad, ycalculate] = helperMultiLogisticCost(activation3, Y, m);

    %this is the regulation J
    JReg = 0.5 * lambda / m * helperMLNNRegSum(Theta1, Theta2);
    J = J + JReg;


    %disp(size(ycalculate));
    %disp(size(activation3));
    
    Y3     = ycalculate;
    error3 = activation3 - ycalculate;                               %10 * 5000



    activation2 = helperChangeDimention(activation2);
    error2 = (Theta2 * error3) .* (activation2 .* (1 - activation2));    %26 * 5000


    
    triangle1 = zeros(size(Theta1));

    disp(size(triangle1)); 
   

    X = helperChangeDimention(X);
    tempValue =   X * error2';
    triangle1 = triangle1 + tempValue(:,2:end);


    triangle2 = zeros(size(Theta2));
    tempValue = activation2 * error3';
    triangle2 = triangle2 + tempValue;

    Theta1(1,:) = 0;
    Theta2(1,:) = 0;

    triangle1 = (    triangle1 / m + lambda / m * Theta1 )' ;
    triangle2 = (    triangle2 / m + lambda / m * Theta2 )' ;

    grad = [triangle1(:) ; triangle2(:)];

end

function [J grad Youtput] = helperMultiLogisticCost(activation, Y, m)

    [d, n]     = size(activation);
    YCalculate = zeros(d, n) ;
    for i  = 1:d
        YCalculate(i,:) = (Y == i);
    end
        
    elementWiseMatrix = (-YCalculate .* log(activation) - (1 - YCalculate) .* log(1 - activation))  / m;

    J =         sum(sum(elementWiseMatrix));
    grad = 0;
    Youtput = YCalculate;

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


function [ result ] = helperMLNNRegSum( varargin )

    lenArgVec = length(varargin);

    result = 0;
    
    for i = 1:lenArgVec
        varargin{i}(1,:) = 0;
        result = result + sum(sum(varargin{i} .* varargin{i}));
    end
    
end
