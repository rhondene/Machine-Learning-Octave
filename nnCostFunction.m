function [J grad] = nnCostFunction(nn_params,input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

 %Part 1: Feedforward the neural network and return the cost in the variable J.
a1 = [ones(m,1), X];  %column of ones for bias unit
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 =  [ones(size(a2,1),1), a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);
h= a3;  %h is hypothesis/predicition

yVec = zeros(m,num_labels);  %num_labels = k classes   5000x10

for i =1:m,
  yVec(i,y(i)) = 1;         %substitutes a column of ones in y(m,k) to 1
end

J = 1/m* sum(sum((-1*yVec .* log(h))-((1-yVec).*log(1-h) )));

reg_cost = (lambda/(2*m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));
J = J+reg_cost;

%Back Propagation Implementation to Compute gradients 
   

for b = 1:m,
   %1.foward prop for each row (training example)
    %2. calculate error
    %3.accumulate error %
    
  %input layer, l= 1
  a1 = [1; X(b,:)'];  %for each bth row or instance  in X, adds bias unit 1
  
  %hidden layer where l=2
  
  z2 = Theta1 * a1;
  a2 = [1; sigmoid(z2)];
  
  z3 = Theta2 *a2;
  a3 = sigmoid(z3);
                                %compares row logical array and then transvers to column vector
  yy = ([1:num_labels] == y(b))';  %it is  encoding the logical array for the real number y(b)? 
  
  D3 = a3-yy;
  D2 =  (Theta2' * D3) .* [1;sigmoidGradient(z2)];
  D2 = D2(2:end);                 %remove bias row
  
  Theta1_grad = Theta1_grad + D2 * a1';   %accumulator update stores the gradients(partial derivative)
  Theta2_grad = Theta2_grad + D3 * a2';
  
end

%Regularise Gradients for j=2:n)

Theta1_grad = (1/m) * Theta1_grad + (lambda/m) *[zeros(size(Theta1,1), 1), Theta1(:,2:end)];
Theta2_grad = (1/m)* Theta2_grad+ (lambda/m) * [zeros(size(Theta2, 1), 1), Theta2(:,2:end)];

%Unroll gradients to vector to be used in advanced optimaisation later
grad  =  [Theta1_grad(:); Theta
