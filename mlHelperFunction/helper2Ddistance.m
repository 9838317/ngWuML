function [ result ] = helper2Ddistance( X1, X2 )

    % The aim of this file is to calculate 1D distance
    % the result is (theta' * X - Y)
    
    result = sum(  (X1 - X2) .* (X1 - X2)  , 2);
    
end %end of function
