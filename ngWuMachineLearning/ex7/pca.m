function [U, S] = pca(X)



[m, n] = size(X);


U = zeros(n);
S = zeros(n);


covar = X' * X / m;
% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%
[U, S, V] = svd(covar);






% =========================================================================

end
