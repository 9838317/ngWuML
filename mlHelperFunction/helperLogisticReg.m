function [ cost, derivative ] = helperLogisticCostReg( theta, X, Y, m, lambda)

    % the result is sum(-Y * log(hOfX) - (1 - Y) * log(1 - hOfX)) / m + labmda / (2 * m) + theta. * theta.
    hOfX = sigmoid(theta' * X);
    theta(1) = 0;
    cost = 1.0 * (-Y * log(hOfX)' - (1 - Y) * log(1 - hOfX)') / m + 0.5 * lambda / m * theta' * theta;
     
    thetaForDerivative = [0;thetaForDerivative(2:end)];

    %finally derivative is a column vector;
    derivative = 1.0 / m * (hOfX - Y) * X' + (lambda / m * thetaForDerivative)';
    

end %end of function
