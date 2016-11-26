close;clear;

%=======================  TEST DATA RANGE ==================================
monday=1:24;
tuseday=25:48;
wednsday=49:72;
thursday=73:96;
friday=97:120;
saturday=121:144;
sunday=145:168;

%=======================  D1 ==============================================
%file_forecast('_hour_basic',2,'r -',monday,'D1 (Model I) - Monday');

%=======================  D2 ==============================================
%file_forecast('_hour_basic_prev_hour',3,'r -',monday,'D2 (Model I) - Monday');

%=======================  D3 ==============================================
file_forecast('_hour_basic_prev_6hours',8,'r -',thursday,'D3 (Model I) - thursday');
