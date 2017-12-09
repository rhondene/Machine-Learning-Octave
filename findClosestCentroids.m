function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);  %initial centroids is 3x2

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);  % 1xm

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size(X,1);   %X is 300x2, intial centroids is 3x2
 for i = 1:m,
   euc_dist = zeros(K,1);
   for k = 1:K,
     euc_dist(k) = sum((X(i,:)-centroids(k,:)).^2);   %X(i,:) = 1x2  centroids(k,:) = 1x2
   end
  [dist,idx(i)] = min(euc_dist,[],1);  %stores index of minimum centroid
   
   
   % ==========================================================
end
idx = idx;
