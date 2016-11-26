close;clear;
% ===== LIST OF DAYS =============
monday=0;
tuseday=1;
wednsday=2;
thursday=3;
friday=4;
saturday=5;
sunday=6;

D1='_hour_basic';
D2='_hour_basic_prev_hour';
D3='_hour_basic_prev_6hours';
%======= INPUT HERE ==============

file_name=D1;
window_count=2;
day_to_isolate=monday;

dataset_name="D3 (Model II) 12 windows - Week";



 %+++++++++++++++++++++++++++++++++
 %file_sliding_window(file_name,window_count,day_to_isolate,dataset_name)
 
 all_mape=[];
 all_max=[];
 all_min=[];
 days=[monday:sunday];
 for day=monday:sunday

[mape,max_full,min_full]=file_sliding_window(file_name,window_count,day,dataset_name);
all_mape=[all_mape;mape];
all_max=[all_max;max_full];
all_min=[all_min;min_full];
 close;
end;

plot(days,all_max,'g','LineWidth',2)
hold on

plot(days,all_min,'r','LineWidth',2)

title(strcat('Min vs Max ',dataset_name))
xlabel('Day of the week [Monday=0,...Sunday=6]');
ylabel('Error');
legend('Max error','Min error');
axis([monday sunday 0 inf]);
figurename=strcat(dataset_name,"_min_vs_max.png");
saveas (1, figurename);


