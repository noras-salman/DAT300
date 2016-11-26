function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%   gradientDescent Performs gradient descent to learn theta
%   theta = gradientDescent(x, y, theta, alpha, num_iters) updates theta by taking num_iters gradient steps with learning rate alpha


	% number of training examples
	m = length(y); 

	% The cost function history (Usefull to plot and choose the iteration and training gradient step)
	J_history = zeros(num_iters, 1);



	for iter = 1:num_iters
		for i=1:length(theta)
			grad(i)=alpha*sum((X*theta-y).*X(:,i))/m;
		end;
		theta=theta-grad';
		% Save the cost J in every iteration    
		J_history(iter) = costLMS(X, y, theta);

	end

end
