 
function [X_norm, mu, sigma] = featureNormalize(X)   

%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when  working with learning algorithms, especially for polynmoial features which span a wide range


  m = size(X_norm,1) 
    std(X_norm);
    mu = mean(X_norm);             %1xn+1
    sd = std(X_norm);              %1xn+1  %standard deviation 
    sigma = X_norm ./sd;
    size(X_norm,2);  #number of columns which is features
    n =size(X_norm,2)
    %mean normalisation for each feature
    for j=1:n,
      X_norm(:,j) = (X_norm(:,j) - mu(j)) ./ sigma(j);
    endfor
    
    X = X_norm



end
