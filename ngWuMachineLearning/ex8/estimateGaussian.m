function [mu sigma2] = estimateGaussian(X)


    [m, n] = size(X);
    [mu,  sigma2] = helperMinMeanMax(X, m, n);

    sigma2 = sigma2 .^2;


end

function [ dataMean, dataStd ] = helperMinMeanMax( datasetMatrix, m, n )

    dataMean = mean(datasetMatrix);

    dataStd  = sum((datasetMatrix - dataMean) .^ 2) / m;
    dataStd  = sqrt(dataStd);

    
end


