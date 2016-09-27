function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% Make sure you have the right sizes
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

%  First, compute the mean of the feature and subtract it from the dataset, mean value in mu. 
mu=mean(X);

% Next, compute the standard deviation of each feature and divide each feature by it's standard deviation, storing the standard deviation in sigma. 
sigma=std(X,1,1);

% We need to perform the normalization separately for each feature (each column is a feature). 
       
for i=1:1:size(X, 2)
   X_norm(:,i)=(X(:,i)-mu(:,i))/sigma(:,i);
end;


end
