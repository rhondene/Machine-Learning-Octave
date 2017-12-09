function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


                    %my code from scratch
%for c = 1:K,
%  cluster = zeros(1,n); %stores the Xi (1xn) assigned to cluster K; i realise the potential prob with extra row of zeros 
%  for i = 1:m,    
%    if idx(i) == c,     
%      cluster = [cluster;X(i,:)]; %1xn
%    end
%  end
  
%  ck = size(cluster,1);
%  centroids(c,:) = mean(cluster);  %Uk is equal to mean of all data points in cluster

   
for i = 1:K,
  xi = X(idx==i,:);  %?? kinda but not quite....
  ck = size(xi,1);
  centroids(i,:) = (1/ck)*sum(xi);
end

  
      






% =============================================================


end

