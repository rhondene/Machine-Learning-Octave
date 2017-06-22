function plotData(X, y)
figure; hold on;  %creates a new figure 

% Assumes X is an mx2 matrix 'k+' for the positive examples and 'ko' for the negative examples

pos = find(y==1); neg = find(y==0); %find positive and negative examples
plot(X(pos,1),X(pos,2),'k+', 'LineWidth',2, 'MarkerFaceColor', 'g','MarkerSize', 7);
plot(X(neg,1),X(neg,2), 'ko', 'MarkerFaceColor','y', 'MarkerSize',7);

hold off;
end
