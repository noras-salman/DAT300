function mape_value = MAPE(actual_load,forecasted_load)
 % Mean Absolute Percentage Error (MAPE)
 % Computes the performance of the forecasting model
 
APE=mean(abs(actual_load-forecasted_load)/actual_load);
mape_value=sum(APE)*100;

end