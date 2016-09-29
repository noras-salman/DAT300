

%% ============  Initialization And Load Data set
%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('12-1210.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

%% Save this for plotting
Xb=X;


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
theta = zeros(3, 1);  %<<<=============UPDATE HERE IN CASE THERE IS A CHANGE IN DATA SET // TODO: MAKE IT DYNAMIC
[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

% Plot the convergence graph (COST FUNCTION )
figure;
subplot (3, 1, 1)
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
pause;

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');


%% ================ Part 3: Predict ================

% USING THE SAME DATE USED FOR TRAINING TO CALCULATE DIFFERENCE (ERROR)
weekday=Xb(:,1);
timestamp=Xb(:,2);

predict = [ones(m,1), (weekday-mu(:,1))/sigma(:,1) ,(timestamp-mu(:,2))/sigma(:,2)] *theta;

% =====================PLOT AND ANALYISIS===============
error_diff=sum(y-predict);
error_arr=[y(140:300) predict(140:300)]
fprintf('error_diff= %f \',error_diff);
subplot (3, 1, 2)
plot(y(140:300))

subplot (3, 1, 3)
plot(predict(140:300))


fprintf('Program paused. Press enter to continue.\n');
pause;

