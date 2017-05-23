function [error_train, error_val] = learningCurve(X, y, Xval, yval, lambda)

    m = size(X, 1);

    %since all the things are in a messy, here we just follow the size of the problem
    %the X's dimension is changed so we just need to get its size correct.
    [m, d] = size(X);

for i = 1:m
    Xtrain          = X(1:i, :);
    Ytrain          = y(1:i);
    [theta]         = trainLinearReg(Xtrain, Ytrain, lambda);
    error_train(i)  = linearRegCostFunction(Xtrain, Ytrain, theta, 0);    %Here it requires us to use labmda = 0, since no regulation term
    error_val(i)    = linearRegCostFunction(Xval, yval, theta, 0);        %Here it requires us to use labmda = 0, since no regulation term
end

end
