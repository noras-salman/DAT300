from datetime import datetime
import matplotlib.pyplot as plt
from numpy import loadtxt

#This is how the dataset look like looks like:
#[0]Date;[1]Time;[2]Global_active_power(kW);[3]Global_reactive_power;[4]Voltage;[5]Global_intensity;[6]Sub_metering_1;[7]Sub_metering_2;[8]Sub_metering_3
'''
[6] sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
[7] sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
[8] sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
'''

load_date=0
load_timestamp=1

#totalLoad
active_power=2

#interavtive load
kitchen_load=6

#back load
laundryroom_load=7
thermo_load=8

#Output we need
'''
day of week (monday=0,... sunday=6)
minutes since midnight (0-1440)

load in previous 10 minute (we will do a window that slide every 10 minutes)

'''
count=0
value=[]
history_value=[]
time_s=[]
print "Start reading file.."
with open('_hour_basic') as f:
  for line in f:
    # Deal with data row by row
    row=line.split(';')
       

    date_object = datetime.strptime(row[load_date], '%d/%m/%Y')
    weekDay= date_object.weekday()  
   
    (h, m, s) = row[load_timestamp].split(':')
    minute=(int(h) * 3600 + int(m) * 60 + int(s))/60
    try:
      sum=float(row[kitchen_load])+float(row[laundryroom_load])
      count+=1	  
    except ValueError:
      continue
    history_value.append(sum)
	
    if count<24*60: # the past 24 hours
      continue # ignore the value
	
    past24=history_value[count-24*60]
  
    #(weekDay==1 ) and
    #if  minute>=0 and minute<=720 and sum>5: #thirty minutes
    print str(weekDay)+ ';'+ str(minute)+ ';'+str(past24)+';'+str(sum)
    value.append(sum)
    time_s.append(minute)
    file_output.write(str(weekDay)+ ','+ str(minute)+ ','+str(past24)+ ','+str(sum)+'\n') # python will convert \n to os.linesep

file_output.close() # you can omit in most cases as the destructor will call it  
print 'Done!'


plt.plot(value)
plt.show()
