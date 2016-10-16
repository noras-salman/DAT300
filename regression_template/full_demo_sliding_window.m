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
day_to_isolate=friday;
 
% ====== LOAD THE DATA FROM FILE 
 data = load('_hour_basic');

 %+++++++++++++++++++++++++++++++++
 
 % ====== ISOLATE day
day_of_week=data(:,1);
isolated_dataset=data((day_of_week==day_to_isolate),:);
 
% ====== DAY OF THE WEEK IN A USELESS FEATURE.. IGNORE IT
training_set=isolated_dataset(:,[2,3]);
hour=training_set(:,1);
 
 % ====== CONSTRUCT THE WINDOWS
 window1_set=training_set((hour<=6),:); 
 window2_set=training_set((hour>6 & hour<=12),:);
 window3_set=training_set((hour>12 & hour<=18),:);
 window4_set=training_set((hour>18 & hour<=24),:);


 full_hours=[];
 full_acctual=[];
 full_forecast=[];
 
 [hours,acctual_load,forecasted_load]=window_forecast(window1_set,1,1:6);
 full_hours=[full_hours;hours];
 full_acctual=[full_acctual;acctual_load];
 full_forecast=[full_forecast;forecasted_load];
 [hours,acctual_load,forecasted_load]=window_forecast(window2_set,1,7:12);
 full_hours=[full_hours;hours];
  full_acctual=[full_acctual;acctual_load];
 full_forecast=[full_forecast;forecasted_load];
 [hours,acctual_load,forecasted_load]=window_forecast(window3_set,1,13:18);
 full_hours=[full_hours;hours];
  full_acctual=[full_acctual;acctual_load];
 full_forecast=[full_forecast;forecasted_load];
 [hours,acctual_load,forecasted_load]=window_forecast(window4_set,1,19:24);
 full_hours=[full_hours;hours];
  full_acctual=[full_acctual;acctual_load];
 full_forecast=[full_forecast;forecasted_load];
 
 % Plot the original usage
% =====================PLOT AND ANALYISIS===============

mape = MAPE(full_acctual,full_forecast)


plot(full_hours,full_acctual,'b','LineWidth',2)
hold on

%plot(predict(sample_range),plot_option,'LineWidth',2)
plot(full_hours,full_forecast,'r','LineWidth',2)

title(strcat('STLF using dataset ',dataset_name))
xlabel('Time of day (Hours)');
ylabel('Electric Load (Watts)');
legend('Real Data','Forecast');
axis([1 24 0 inf]);
figurename=strcat(dataset_name,"_sliding_window_forecast.png");
saveas (1, figurename);