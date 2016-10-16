function mape_value = MAPE(actual_load,forecasted_load)

APE=mean(abs(actual_load-forecasted_load)/actual_load);
mape_value=sum(APE)*100;

end