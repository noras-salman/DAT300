function prediction = forecast(X,theta,sigma,mu)


% number of desiredd prediction samples
m=size(X,1);


% number of features
num_features=size(X,2);

%intercept_term
scaled_features=[ones(m,1)];

for feature = 1:num_features
	scaled_features=[scaled_features,(X(:,feature)-mu(:,feature))/sigma(:,feature)];
end;

prediction =scaled_features *theta;

end
