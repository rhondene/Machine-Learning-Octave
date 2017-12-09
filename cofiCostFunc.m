function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X is num_movies  x num_features matrix of movie features      mxn
%        Theta is num_users  x num_features matrix of user features    jxn
%        Y is num_movies x num_users matrix of user ratings of movies  mxj
%        R is num_movies x num_users matrix, where R(i, j) = 1 if the  mxj
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

error = (X*Theta') - Y; %error = mxj 
m = sum(sum(error.*R));   %determines the number of movies that were rated, R(i,j)==1...%use sum(sum) cuz its a matrix and we want a scalar ans
J = (1/2)* sum((error.^2)(R==1));  %cost is optimised only by rated movies, Y(ij)whose R(i,j)==1

%I couldve use 2 lines of code but for learning purposes I spell things out

X_grad = (error.*R)*Theta;
Theta_grad =(error.*R)' *X;  

%%Regularised 
J = J+ (lambda/2)*(sum(sum(X.^2)) + sum(sum(Theta.^2)));  

X_grad = X_grad +((lambda)*X);  %since collab algorithm will derive its on x intercept
Theta_grad = Theta_grad + ((lambda)*Theta);
% =============================================================

%Unroll gradients to vector to be used in advanced optimaisation e.g fminc later

grad = [X_grad(:); Theta_grad(:)];

end
