%Sigmoid is the activation function used to determine the decision boundary in my logisitc regression model

function g = sigmoid(z)               %where z = theta*X; z can be a vector, matrix or even scalr
g = zeros(size(z));

g = 1 ./ (1+ e.^(-z));
