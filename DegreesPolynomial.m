% mapFeature function creates more features by mapping  each of the original feature(X1,X2) to a certain degree of polynomials
%Returns a feature array with X1, X2, X1.^2, X2.^2, x1*X2, etc
%Note that the features have not been merged into a design matrix so its indivual feature vectors
%inputs X1 and X2 must be same size

function out = mapFeature(X1,X2)

degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree,
    for j = 0:i,
        out(:,end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end
      

