function [antiSigmoid] = helperAntiSigmoid (sigValue)

	antiSigmoid = log(1 ./ sigValue -1);
	
end %end of function

     
