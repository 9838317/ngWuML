function [C, sigma] = dataset3Params(X, y, Xval, yval)



Cset     = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; 
lengCset     = length(Cset);
sigmaset = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; 
lengSigmaSet = length(sigmaset);

bestAccuracy   = 0;
C              =  0.01;
sigma          = 0.01;

for i = 1:lengCset
    for j = 1:lengSigmaSet
        Ctest       = Cset(i);
        sigmaTest   = sigmaset(j);
        model       = svmTrain(X, y, Ctest, @(x1, x2) gaussianKernel(x1, x2, sigmaTest)); 
        predictions = svmPredict(model, Xval);
        acuracy     = mean(double(predictions == yval));

        if acuracy  > bestAccuracy, 
          bestAccuracy = acuracy;
          C     = Cset(i);
          sigma = sigmaset(j);

        end
    end
end



end
