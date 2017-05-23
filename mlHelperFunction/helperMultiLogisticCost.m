%   This function use a paired wised calculation
%   it need to receive the activation matrix in order to compute the cost.
%
%

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
