function [X_poly] = polyFeatures(X, p)


%   this is a 1 D vector so m * 1

for i = 1:p
    X_poly(:,i) = X .^ i;
end

disp(size(X));
disp(size(X_poly));


end
