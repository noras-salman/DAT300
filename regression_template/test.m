
 %full_function_file('_hour_basic',2,'g *');
 %full_function_file('_hour_basic_weekend',3,'r *');

 sample_range=1:24 ; % What to plot and compare from predicted and original data (Example 1:24 only first 24 hours)
 
 
 data = load('_hour_basic');
  
 mondays=data((data(:,1)==0),:);
 mondays=mondays(:,[2,3]);
 

 mondays1_12=mondays((mondays(:,1)<=12),:);
 
  mondays1_6=mondays1_12((mondays1_12(:,1)<=6),:);
   full_function_set(mondays1_6,1,'r *',sample_range)
  
  
  mondays6_12=mondays1_12((mondays1_12(:,1)>6),:);
  full_function_set(mondays6_12,1,'r *',sample_range)
 
 
 
 
 mondays13_24=mondays((mondays(:,1)>=13),:);
 
 
 mondays13_18=mondays13_24((mondays13_24(:,1)<=18),:);
  full_function_set(mondays13_18,1,'g *',sample_range)
 mondays18_24=mondays13_24((mondays13_24(:,1)>18),:);
 
 
 
 full_function_set(mondays18_24,1,'g *',sample_range)
 
 