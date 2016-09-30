function predict = prediction(X,theta,sigma,mu)


% number of desiredd prediction samples
m=size(X,1);
% number of features
num_features=size(X,2);


constuctedX=[ones(m,1)];

for feature = 1:num_features
	constuctedX=[constuctedX,(X(:,feature)-mu(:,feature))/sigma(:,feature)];
end;

predict =constuctedX *theta;


end
