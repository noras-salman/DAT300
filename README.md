# Short-term electric load forecasting in households: Experiments with multiple linear regression
This project is a part of the DAT300 course project at Chalmers University of Technology.

The dataset used could be found in the here:
<https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption>

## Structure
The structure is seperated to two directories:
- regression_training : This contain the basic linear regression code(Octave or Matlab) + The Final DATSETS.
- data_optimize : This contain a set of (Python) scripts to create new datasets. The directory also contain the base datasets for four winters.
- demo: Python code for demo purpose (Client-Server setup)

## DATASETS
Final datasets constucted from 'winter2006-2007.txt' could be found in the regression_template directory and they are:
- D1: hour_basic.
- D2: hour_basic_prev_hour 
- D3: hour_basic_prev_6hours 

## Models
- Model I : Regular MPL.
- Model II: MPL with a sliding window.

#### Sliding Window
Because of the high non-linearizability nature of electric consumption .. 
performing a sliding window prediction model could be a good idea to experment with.
- Each Day has a model
- Each day has a number of windows that the forecasat is applied to.

### Error Analysis
We run the algorithm on the trained data, plot them and calculate the error using MAPE,MIN,MAX

## For future work
- Please refer to the report and read the future work section.


