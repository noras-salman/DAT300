function [hours,acctual_load,forecasted_load]=window_forecast(data,feature_numbers,sample_range)

%% ============  Initialization And Load Data set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  CHANGE THIS FOR COMPARING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Data

number_of_features=feature_numbers;

%% ========================
X = data(:, 1:number_of_features);
y = data(:, number_of_features+1);
m = length(y);
x_size=size(X, 2);
%% Save this for plotting
Xb=X;
%% ================ Part 1: Feature Scaling(Normalization) ================

% Scale features and set them to zero mean
[X mu sigma] = featureScaling(X);

% Add intercept term to X
X = [ones(m, 1) X];

% NOTE: At prediction, make sure you do the same feature normalization.

%% ================ Part 2: Gradient Descent ================

% Alpha value(the learning gradient step)
alpha = 0.01;
% Number of time to repeat
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(x_size+1, 1);  
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

%% ================ Part 3: FORECAST ================
% use Xb the original data
predict = forecast(Xb,theta,sigma,mu);

hours=Xb(sample_range);
acctual_load=y(sample_range);
forecasted_load=predict(sample_range);



end
