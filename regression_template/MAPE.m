function mape_value = MAPE(actual_load,forecasted_load)
 % Mean Absolute Percentage Error (MAPE)

 
 
%to not have a devision by zero
%actual_load(actual_load==0)=1;
%mape_value=mean(abs(actual_load - forecasted_load)./actual_load)*100;

mape_value=sum(mean(abs(actual_load-forecasted_load)/actual_load))*100;


end