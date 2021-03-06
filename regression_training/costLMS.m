function J = costLMS(X, y, theta)
% Calculate cost for linear regression with multiple variables
%   J = costLMS(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% number of training examples
m = length(y); 

%Cost function based on LMS (Least Mean Square )
 J=sum(((X*theta)-y).^2)/(2*m);

end
