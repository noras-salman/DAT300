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
file_name='_hour_basic';
 window_count=6;
 %+++++++++++++++++++++++++++++++++
 
%file_sliding_window(file_name,window_count,day_to_isolate,dataset_name)
file_sliding_window(file_name,window_count,day_to_isolate,dataset_name)