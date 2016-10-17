close;clear;
monday=1:24;
tuseday=25:48;
wednsday=49:72;
thursday=73:96;
friday=97:120;
saturday=121:144;
sunday=145:168;


file_forecast('_hour_basic',2,'r -',wednsday,'D1_full(wednsday)without a sliding window');
close;
file_forecast('_hour_basic_prev_hour',3,'r -',wednsday,'D2_full(wednsday) without a sliding window');
close;
file_forecast('_hour_basic_prev_6hours',8,'r -',wednsday,'D3_full(wednsday) without a sliding window');
