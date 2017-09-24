%Generates the train and cross validation set errors needed  to plot a learning curve as a function of training size
% 'X' 'y' are from training set ....Xval yval are from cross validation set

m = size(X, 1);     %number of training examples
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i=1:m,
  theta_train = trainLinearReg(X(1:i,:), y(1:i), lambda);  %compute theta from training set
  J_train = linearRegCostFunction(X(1:i,:), y(1:i), theta_train, 0);  %compute training error
  J_cv = linearRegCostFunction(Xval, yval, theta_train, 0);           %compute cross_validation error
  
  error_train(i) = J_train;
  error_val(i) = J_cv; 
end

