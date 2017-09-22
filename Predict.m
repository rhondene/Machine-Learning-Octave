%Predicts whether the label is 0 or 1 using learned logistic regression parameters
%Predicts if X was labelled correctly using a threhold of 0.5 i.e.  is if h >=0.5, then predict =1(true)


function p = predict(theta,X)
m = size(X,1);              %number of training examples = size of a row in X
p = zeros(m,1);

z = theta*X;
p = sigmoid(z) >=0.5;       % p is binary - 0 if false(below threshold) or 1 if true (above threshold)
