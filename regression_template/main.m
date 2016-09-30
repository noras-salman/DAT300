

%% ============  Initialization And Load Data set
%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  CHANGE THIS FOR COMPARING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Data
data = load('_hour_basic_weekend');
number_of_features=3;

%% ========================
X = data(:, 1:number_of_features);
y = data(:, number_of_features+1);
m = length(y);
x_size=size(X, 2);
%% Save this for plotting
Xb=X;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  CHANGE THIS FOR COMPARING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sample_range=1:168 ; % What to plot and compare from predicted and original data (Example 1:24 only first 24 hours)




%% ================ Part 1: Feature Scaling(Normalization) ================

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureScaling(X);

% Add intercept term to X
X = [ones(m, 1) X];

% NOTE: At prediction, make sure you do the same feature normalization.

%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Alpha value(the learning gradient step)
alpha = 0.01;
% Number of time to repeat
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(x_size+1, 1);  
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plot the convergence graph (COST FUNCTION )
%figure;
%subplot (2, 1, 1)
%plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
%xlabel('Number of iterations');
%ylabel('Cost J');


% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');


%% ================ Part 3: Predict ================
% use Xb the original data
predict = prediction(Xb,theta,sigma,mu);

% =====================PLOT AND ANALYISIS===============
error_diff=sum(y-predict);

error_arr=[y(sample_range) predict(sample_range)];

fprintf('error_diff= %f \',error_diff);


plot(y(sample_range))
hold on



plot(predict(sample_range),'r *','LineWidth',2)


fprintf('Program paused. Press enter to continue.\n');
pause;

