function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

m = length(y); % number of training examples;
J = 0;
grad = zeros(size(theta));
h = X*theta;                        % mx1, theta is n+1xn h is predicted output
cost =  (1/(2*m))*sum( (h-y).^2);
reg_cost = lambda/(2*m) * sum( theta(2:end).^2);
J = cost+reg_cost;


grad = (1/m)* X'*(h-y);
grad(2:end) = grad(2:end) + ((lambda/m)* theta(2:end)); 
