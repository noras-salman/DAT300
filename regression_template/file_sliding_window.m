function [mape,max_full,min_full]=file_sliding_window(file_name,window_count,day_to_isolate,dataset_name)


 
% ====== LOAD THE DATA FROM FILE 
 data = load(file_name);

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
	 [hours,acctual_load,forecasted_load]=single_window_forecast(window_set,features_cout,1:window_size);
	 full_hours=[full_hours;hours];
	 full_acctual=[full_acctual;acctual_load];
	 full_forecast=[full_forecast;forecasted_load];
 
 end;

% =====================PLOT AND ANALYISIS===============

mape = MAPE(full_acctual,full_forecast)
max_full = max(abs(full_acctual-full_forecast))
min_full = min(abs(full_acctual-full_forecast))

plot(full_hours,full_acctual,'b','LineWidth',2)
hold on


plot(full_hours,full_forecast,'r','LineWidth',2)

title(strcat('Sliding window STLF using dataset ',dataset_name))
xlabel('Time of day (Hours)');
ylabel('Electric Load (Watts)');
legend('Real Data','Forecast');
axis([1 24 0 inf]);
figurename=strcat(dataset_name,"_sliding_window_forecast.png");
saveas (1, figurename);

end;