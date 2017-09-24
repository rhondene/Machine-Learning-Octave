%maps X (mx1) feature vector to a data matirx X_poly (m x p) containing polynomial of each feature all the wat to the p-th power

X_poly = zeros(numel(X), p);        %numel returns the number of elements in array X

for k = 1:p,
  X_poly(:,k) = X.^k;
end

    
