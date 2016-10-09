function full_function_file(file_name,feature_numbers,plot_option,sample_range,dataset_name)

%% ============  Initialization And Load Data set


fprintf('Loading data ...\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  CHANGE THIS FOR COMPARING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Data
data = load(file_name);
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

fprintf('error_diff= %f \n',error_diff);


%plot(y(sample_range),'b')
plot(Xb(sample_range,2),y(sample_range),'b')
hold on

%plot(predict(sample_range),plot_option,'LineWidth',2)
plot(Xb(sample_range,2),predict(sample_range),plot_option,'LineWidth',2)

title(strcat('STLF using dataset ',dataset_name))
xlabel('Time of day (Hours)');
ylabel('Electric Load (Watts)');
legend('Real Data','Forecast');
axis([1 24 0 inf]);
figurename=strcat(dataset_name,".png");
saveas (1, figurename);
end
