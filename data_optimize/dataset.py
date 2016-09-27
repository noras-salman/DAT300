from datetime import datetime
import matplotlib.pyplot as plt


#this is how it looks like
#[0]Date;[1]Time;[2]Global_active_power;[3]Global_reactive_power;[4]Voltage;[5]Global_intensity;[6]Sub_metering_1;[7]Sub_metering_2;[8]Sub_metering_3
value=[]
time=[]
newDataset=[]
ds_file = open('dataset_final.txt','w')

with open('winter2006-2007.txt') as f:
  for line in f:

    #print line
   
    row=line.split(';')

	
    date_object = datetime.strptime(row[0], '%d/%m/%Y')
    dayYear= date_object.weekday()
    print dayYear
    t=row[1]	
    (h, m, s) = t.split(':')
    ts = int(h) * 60 + int(m) * 1
    
    try:
      sum=float(row[6])+float(row[7])+float(row[8])
    except ValueError:
      continue # skip to next
    value.append(sum)
    #newDataset.append=([dayYear,time,sum])
    print str(dayYear)+ ';'+ str(ts)+ ';'+str(sum)
    ds_file.write(str(dayYear)+ ';'+ str(ts)+ ';'+str(sum)+'\n') # python will convert \n to os.linesep
    time.append(ts)
ds_file.close() # you can omit in most cases as the destructor will call it  
print 'Done!'

	
plt.plot(time, value)
plt.show()
	