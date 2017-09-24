function [lambda_vec, error_train, error_val] =  validationCurve(X, y, Xval, yval)
% validationcurve function generates the train and validation errors for a selected range of lambda

lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);


for i = 1:numel(lambda_vec),
  theta_train = trainLinearReg(X,y,lambda_vec(i));
  J_train = linearRegCostFunction(X,y,theta_train,0);   %do not use lambda for errors since already used to find theta_train
  J_cv = linearRegCostFunction(Xval, yval, theta_train, 0);
  
  error_train(i) = J_train;
  error_val(i) = J_cv;
end
