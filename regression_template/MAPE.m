function mape_value = MAPE(actual_load,forecasted_load)
 % Mean Absolute Percentage Error (MAPE)

temp=mean(abs(actual_load-forecasted_load)/actual_load);
mape_value=sum(temp)*100;

end