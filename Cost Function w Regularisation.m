%This code incorporates regularisation into the cost function, a techniqe used to reduce overfitting or high variancce
%in the model

function [J, grad] =  costFunctionReg( theta, X,y, lambda)

m = length(y);                                     %number of training examples; y is mx1

J=0;
grad = zeros(size(theta));

z = X*theta;
h = sigmoid(z);                                      % h is hypothesis or predicted value
n = length(theta);

%cost = -y' *log(h) - (1-y')*log(h);        or 
cost = (-1/m) * sum(y.* log(h) + (1-y).*log(1-h));  
reg_cost = (lambda/(2*m)) * sum( (theta(2:n).^2 ) ;   % bias unit of theta is NOT regularised
J = cost+ reg_cost;

reg_grad = (lambda/m) * [0; theta(2:end)];            % theta(1) is not regularised so 0 is used to make dimensions add up back to
                                                      %--be the same nX1 vector as grad, multiplying zero has no effect
for i =1:m,
  grad = grad + (h(i) - y(i) )* X(i,:);
end;
grad = (1/m)*grad + reg_grad; 
