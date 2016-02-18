function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
n = length(grad);
constrainItem = 0;
for i = 1:m
	J += -y(i)*log(sigmoid(theta'*X(i,:)'))-(1-y(i))*log(1-sigmoid(theta'*X(i,:)'));
end
for i = 2:n
	constrainItem += theta(i)^2;
end
J = J/m + constrainItem*lambda/2/m;


for i = 1:n
	for j = 1:m
		grad(i) += (sigmoid(theta'*X(j,:)')-y(j))*X(j,i);
	end
	if i==1
		grad(i) = grad(i)/m;
	else
		grad(i) = grad(i)/m + lambda*theta(i)/m;
	end
end





% =============================================================

end
