function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)

	prediction   = ( pval >= epsilon );

    [tpArray, fpArray, fnArray , irrelevant] = helperFScore(prediction, yval);
    tpfpfn = sum([tpArray, fpArray, fnArray ]);         
    tp = tpfpfn(1);
    fp = tpfpfn(2);
    fn = tpfpfn(3);
    prec = 1.0 * tp / (tp + fp);
    rec  = 1.0 * tp / (tp + fn);

    F1   = 2.0 * prec * rec / (prec + rec);
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end

%this function help to determin mean and std of the datasetMatrix
%this is a datasetMatrix with m datapoints and n dimentions.

function [truePositive,  falsePositive,  falseNegative, trueNagative] = helperFScore( ypred, yval )

    truePositive   = ((ypred + yval)  ==   2);
    falsePositive  = ((ypred - yval)  ==   1);
    falseNegative  = ((ypred - yval)  ==  -1);
    trueNagative   = ((ypred + yval)  ==   0);

end

