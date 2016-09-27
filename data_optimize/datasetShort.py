from datetime import datetime
import matplotlib.pyplot as plt


#This is how the dataset look like looks like:
#[0]Date;[1]Time;[2]Global_active_power;[3]Global_reactive_power;[4]Voltage;[5]Global_intensity;[6]Sub_metering_1;[7]Sub_metering_2;[8]Sub_metering_3
'''
sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
'''

# output weekDay,numofMinutes,totalLoad

value=[]
time=[]
newDataset=[]
ds_file = open('dataset_final2.txt','w')
sum=0
currentH=0
cuurentWeekDay=0

with open('winter2006-2007.txt') as f:
  for line in f:
    # Deal with data row by row
    row=line.split(';')
       

    date_object = datetime.strptime(row[0], '%d/%m/%Y')
    weekDay= date_object.weekday()  
   
   
    t=row[1]	
    (h, m, s) = t.split(':')
  
   
        
    print str(cuurentWeekDay)+ ';'+ str(currentH)+ ';'+str(sum)
    ds_file.write(str(cuurentWeekDay)+ ','+ str(currentH)+ ','+str(sum)+'\n') # python will convert \n to os.linesep
	
    currentH=int(h)
    sum=float(row[6])+float(row[7])+float(row[8])
    
    cuurentWeekDay=weekDay;

    value.append(sum)


    time.append(currentH)

ds_file.close() # you can omit in most cases as the destructor will call it  
print 'Done!'

plt.plot(time[0:48], value[0:48])
plt.show()
	