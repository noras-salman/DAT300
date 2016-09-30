# Short Term Electrical Load Forecasting Project
This project is a part of the DAT300 course project.

The dataset used could be found in the here:
<https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption>

## Structure
The structure is seperated to two directories:
- regression_template : This contain the basic linear regression code(Octave or Matlab) + The Final DATSETS.
- data_optimize : This contain a set of (Python) scripts to create new datasets. The directory also contain the base datasets for four winters.


## DATASETS
Final datasets could be found in the regression_template directory and they are:
- hour_basic : (weekday,hour,total_load) constucted from 'winter2006-2007.txt'

## TODO

#### HourBased:"Total Hour load"
It could be usefull "consedering the time-frame for the project" to predict based on a total hour consumtion instead of using a minute to minute based prediction model.
- hour_basic : (weekday,hour,total_load)   "**COMPLETED**"
- hour_weekend : (weekday,hour,weekend,total_load) : adds extra feature "weekend" is a value that state if its a weekday or weekend

- hour_basic_prev_hour : (weekday,hour,previous_hour,total_load) : adds extra feature "previous_hour"
- hour_basic_prev_hour2 : (weekday,hour,previous_hour,previous_secound_hour,total_load) : adds extra feature "previous_secound_hour"

#### Sliding Window
Because of the high non-linearizability nature of electric consumption .. 
performing a sliding window prediction model could be a good idea to experment with.
-Each Day has a model
-Each 2 or 3 hours has a model for this day

### Error Analysis
We run the algorithm on the trained data, plot them and calculate the error
