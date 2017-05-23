%this function help to determin mean and std of the datasetMatrix
%this is a datasetMatrix with m datapoints and n dimentions.

function [truePositive,  falsePositive,  falseNegative, trueNagative] = helperFScore( ypred, yval )

    truePositive   = ((ypred + yval)  ==   2);
    falsePositive  = ((ypred - yval)  ==   1);
    falseNegative  = ((ypred - yval)  ==  -1);
    trueNagative   = ((ypred + yval)  ==   0);

end
