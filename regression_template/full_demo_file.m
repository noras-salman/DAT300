close;clear;
monday=1:24;
tuseday=25:48;
wednsday=49:72;
thursday=73:96;
friday=97:120;
saturday=121:144;
sunday=145:168;


%file_forecast('_hour_basic',2,'r -',sunday,'D1 without a sliding window');
%file_forecast('_hour_basic_weekend',3,'r *',sunday,'D2');
%file_forecast('_hour_basic_prev_hour',3,'r -',wednsday,'D3');
file_forecast('_hour_basic_prev_2hours',4,'g -',monday,'D4');
