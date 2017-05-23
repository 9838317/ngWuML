%The aim of this function is to sigmoidize a theta T x.
%It is to wrap sigmoid.m into a denser function
%actually it is almost the same as sigmoid, but sigmoid receive arg of arg = theta' * X while this receive args = [theta, X] 


function [sigmoidization] = helperSigmoidize (inputTheta, inputMatrix)

	sigmoidization = sigmoid(inputTheta' * inputMatrix);
	
end %end of function

    
   
