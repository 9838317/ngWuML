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
