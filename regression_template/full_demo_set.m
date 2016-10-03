
 %full_function_file('_hour_basic',2,'g *');
 %full_function_file('_hour_basic_weekend',3,'r *');
close;clear;
 sample_range=1:24 ; % What to plot and compare from predicted and original data (Example 1:24 only first 24 hours)
 
 
 data = load('_hour_basic');
  
 mondays=data((data(:,1)==0),:);
 mondays=mondays(:,[2,3]);
 % 0 1
 mtest01=mondays((mondays(:,1)<=6),:); 
  % 2 3
 mtest34=mondays((mondays(:,1)>6 & mondays(:,1)<=12),:);
 mtest56=mondays((mondays(:,1)>12 & mondays(:,1)<=18),:);
 
 mtest78=mondays((mondays(:,1)>18 & mondays(:,1)<=24),:);


 full_function_set(mtest01,1,'b',sample_range)
 full_function_set(mtest34,1,'r',sample_range)
 full_function_set(mtest56,1,'b',sample_range)
 full_function_set(mtest78,1,'r',sample_range)
 
 