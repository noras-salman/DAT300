# Short Term Electrical Load Forecasting Project
This project is a part of the DAT300 course project.

The dataset used could be found in the here:
<https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption>

## Structure
The structure is seperated to two directories:
- regression_template : This contain the basic linear regression code(Octave or Matlab).
- data_optimize : This contain a set of (Python) scripts to create new datasets. The directory also contain the base datasets for four winters.

## TODO
### Create Diffrent Datasets:
- (dayOfYear,weekday,minute,consumption) (OnlyWinter)
- (dayOfYear,weekday,minute,consumption_past24hours,consumption) (OnlyWinter)
#### Make three rooms into one from the dataset
    -add the coloumns to make one(Make total load)


#### HourBased:"Total Hour consumption"
It could be usefull and more accurate to predict based on a total hour consumtion instead of using a minute to minute based prediction model.
- (dayOfYear,weekday,hour,consumption_past24hours,consumption) (OnlyWinter)
- (dayOfYear,weekday,hour,past_hour,consumption_past24hours,consumption) (OnlyWinter)

#### Sliding Window
Because of the high non-linearizability nature of electric consumption .. performing a sliding window prediction model could be a good idea to experment with.
- (dayOfYear,weekday,minute,consumption_past24hoursconsumption_past24hours,consumption) (OnlyWinter)
- (dayOfYear,weekday,hour,consumption_past24hoursconsumption_past24hours,consumption) (OnlyWinter)




### Error Analysis

