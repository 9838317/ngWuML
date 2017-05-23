%The function calculate sigmoid(z).
%It is used to map a image into another image between 0 and 1.

function g = sigmoid(z)
    g = 1 ./ (1 + exp(-z));
end
