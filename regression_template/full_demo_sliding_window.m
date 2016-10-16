close;clear;
% ===== LIST OF DAYS =============
monday=0;
tuseday=1;
wednsday=2;
thursday=3;
friday=4;
saturday=5;
sunday=6;


%======= INPUT HERE ==============
%+++++++++++++++++++++++++++++++++
dataset_name="D1";
day_to_isolate=saturday;
 
% ====== LOAD THE DATA FROM FILE 
 data = load('_hour_basic');
 window_count=6;
 %+++++++++++++++++++++++++++++++++
 
 % ====== ISOLATE day
day_of_week=data(:,1);
isolated_dataset=data((day_of_week==day_to_isolate),:);
isolated_dataset_size=size(isolated_dataset, 2);

% ====== DAY OF THE WEEK IN A USELESS FEATURE.. IGNORE IT
training_set=isolated_dataset(:,2:isolated_dataset_size);
training_set_size=size(training_set, 2);
features_cout=training_set_size-1;

hour=training_set(:,1);
  window_size=24/window_count;
  
  
   full_hours=[];
 full_acctual=[];
 full_forecast=[];
 
 
 for w=1:window_count
 
 lower_hour=w*window_size-window_size;


 higer_hour=w*window_size;
 
  window_set=training_set((hour>lower_hour & hour<=higer_hour),:);
 
 [hours,acctual_load,forecasted_load]=single_window_forecast(window_set,features_cout,lower_hour+1:higer_hour);
 full_hours=[full_hours;hours];
 full_acctual=[full_acctual;acctual_load];
 full_forecast=[full_forecast;forecasted_load];
 
 end;

 % Plot the original usage
% =====================PLOT AND ANALYISIS===============

mape = MAPE(full_acctual,full_forecast)


plot(full_hours,full_acctual,'b','LineWidth',2)
hold on

%plot(predict(sample_range),plot_option,'LineWidth',2)
plot(full_hours,full_forecast,'r','LineWidth',2)

title(strcat('Sliding window STLF using dataset ',dataset_name))
xlabel('Time of day (Hours)');
ylabel('Electric Load (Watts)');
legend('Real Data','Forecast');
axis([1 24 0 inf]);
figurename=strcat(dataset_name,"_sliding_window_forecast.png");
saveas (1, figurename);