
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

