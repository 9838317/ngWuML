%the aim of this function is actually to predict the boolean value of calculation.
%in short, it equals sigmoidization. So here we refer to function helperSigmoidizec  

function p = predict(theta, X)

    m = size(X, 1); 
    
    
    X         = helperDetermineDimen(X);
    theta     = helperDetermineTheta(theta);
    pPre      = helperSigmoidize(theta, X);
    p         = pPre > 0.5;
    p         = helperDetermineTheta(p);

end %end of main function


function [sigmoidization] = helperSigmoidize (inputTheta, inputMatrix)

	sigmoidization = sigmoid(inputTheta' * inputMatrix);
	
end %end of function

    
function [outputRightMatrix] = helperDetermineDimen (inputMatrix, m)


	outputRightMatrix = inputMatrix;
	[r d] = size(inputMatrix);
	
	if nargin == 1
	    if r > d
		outputRightMatrix = inputMatrix';
	    elseif r < d
		outputRightMatrix = inputMatrix;
	    end
	end


	if nargin == 2
	    if r == m
		outputRightMatrix = inputMatrix';
	    elseif d == m
		outputRightMatrix = inputMatrix;
	    end
	end

end %end of function

function [outputRightTheta] = helperDetermineTheta (inputTheta, k)


	outputRightTheta = inputTheta;
	[r d] = size(inputTheta);
	
	if nargin == 1
	    if r == 1
		outputRightTheta = inputTheta';
	    elseif r ~= 1
		outputRightTheta = inputTheta;
	    end
	end


	if nargin == 2
	    if r == k
		outputRightTheta = inputTheta';
	    elseif d == k
		outputRightTheta = inputTheta;
	    end
	end

end %end of function
