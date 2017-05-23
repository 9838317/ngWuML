%usually, considering a theta, we usually put it as a column vector. In this case, the dimension of theta is written as D(for dimension)/r(for row)
%so the right structure of a theta is like following:
%  D/r   *   1, when there is only 1 possibility
%  D/r   *   k,  k for k possibilities.


%This function helps to determine the structure of theta.
%in general, the dimension of theta is as following,
%    The dimension is  D/r * 1, or
%    The dimension is  D/r * k.

%most of the case, we consider it as a 1 possibility theta. When argument m is specified, then it's with k possibilities.

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

    
   
