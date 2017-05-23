%Usually, if a data point is called a example, we usually put it as a column vector. In this case, the dimension of the vector is called D(for dimension) or r(for row)
%So the correct structure of a X is like following:
%    D/r   *   1, when there is only 1 input
%    D/r   *   k,  k for k inputs.

%This function helps to determine the structure of a matrix.
%In general, the output of the function is a matrix of D/r * m,
%    The dimension is  D/r, and
%    Data points   are m

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

    
   
