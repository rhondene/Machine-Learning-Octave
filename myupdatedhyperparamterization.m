function [C, sigma] = myupdatedhyperparamterization(X, y, Xval, yval)
C = [0.01 0.03 0.1 0.3 1 3 10 30 100];
sigma = [0.01 0.03 0.1 0.3 1 3 10 30 100];
%error_min = inf; 

fprintf('Optimizing best values for C and sigma.... \n');
in_error = zeros(numel(C),1);   %1-d column vector
out_error = zeros(numel(sigma),2); 

for i=1:numel(sigma), %#ok<*NOCOL>
  for j=numel(C), 
    model = svmTrain(X, y, C(j), @(x1, x2) gaussianKernel(x1, x2, sigma(i)));
    in_error(j)= mean(double((svmPredict(model, Xval)) ~= yval));  %stores error rate for each inner run
  end
  %(in_error);
  [out_error(i,1) out_error(i,2) ] =  min(in_error,[],1);   %2nd col stores index of C
  %out_error(i,3) = i; %stores index of sigma
end

disp(out_error); 
[min_error idx] = min(out_error(:,1),[],1) 
sigma = sigma(idx); 
C = C(out_error(idx,2));  %returns index of C that gave min_error
    

