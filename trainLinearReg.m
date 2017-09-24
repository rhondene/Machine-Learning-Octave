%uses advanced optimisation to determine theta---NOT MY ORIGINAL CODE

function [theta] = trainLinearReg(X, y, lambda)

initial_theta = zeros(size(X, 2), 1);
costFunction = @(t) linearRegCostFunction(X, y, t, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 200, 'GradObj', 'on');

% Minimize using fmincg
theta = fmincg(costFunction, initial_theta, options);

end
