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
dataset_name="D1 moday 4 w";
day_to_isolate=monday;

 window_count=4;
 %+++++++++++++++++++++++++++++++++
 
file_sliding_window(file_name,window_count,day_to_isolate,dataset_name)