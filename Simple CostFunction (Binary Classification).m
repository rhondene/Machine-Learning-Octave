% Recall that the cost function reports how well the selected parameters fits the hypothesis to the training data, i.e
%How well the predicted value, aka the hypothesis, matches the actual output y

m = length(y)                %number of training examples or instances. y is mx1 vector 
J = 0;                        %value of cost function 
grad = zeros(size(theta));   %gradient descent stores the partial derivatives of the theta, grad should be same nx1 as theta

h = sigmoid(X*theta);         % h is hypothesis (predicted values) see readme for sigmoid function definition
cost =  (-y.*log(h))-((1-y).*log(1-h)); 
J = 1/m*sum(cost);

%calculate the gradients of theta with respect to cost function (non-vectorised)

for i = 1:m,
  grad = grad +( h(i)-y(i))*X(i,:)';
end;

