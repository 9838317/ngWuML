%this function help to determin mean and std of the datasetMatrix
%this is a datasetMatrix with m datapoints and n dimentions.

function [ dataMean, dataStd ] = helperMinMeanMax( datasetMatrix, m, n )

    dataMean = mean(datasetMatrix);

    dataStd  = sum((datasetMatrix - dataMean) .^ 2) / m;
    dataStd  = sqrt(dataStd);

    
end
