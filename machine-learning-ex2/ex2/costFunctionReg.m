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


h = sigmoid(X* theta);
temp1 = y'*log(h);
temp2 = (1 - y)'*log(1-h);
temp = (-temp1 - temp2)/m;
reg_cost = (lambda/(2*m)) * sum(theta(2:end).^2);
J = (temp  + reg_cost);

temp3 = (X' *(h - y))/m;
theta(1) = 0;
reg_grad = (lambda/m)*theta;
grad = temp3 + reg_grad;
% =============================================================

end
