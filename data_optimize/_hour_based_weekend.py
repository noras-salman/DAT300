from datetime import datetime


##################################
##          DATASET 	        ##
##################################
'''
This is how the dataset look like looks like:
---------------------------------------------
[0]Date;[1]Time;[2]Global_active_power(kW);[3]Global_reactive_power;[4]Voltage;[5]Global_intensity;[6]Sub_metering_1;[7]Sub_metering_2;[8]Sub_metering_3
Where:
[6] sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
[7] sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
[8] sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
'''

##################################
##          VARIABLES	        ##
##################################

hour_based=1  # (hour_based=1 : Total_load is the total load in an hour (scound_column range = 1->24), hour_based=0: Total_load is load in one minute (scound_column range = 1->1440))

#input and output files
output_file_name='_hour_basic_weekend'
input_file='winter2006-2007.txt'

# define costum accept condition for a record (for example : only mondays and hour=12) this is done in the script part but this is just a reminder
accept_condition=1 # 
# if day_of_week in weekend then add 2 else 1
##################################
##          CONSTANTS	        ##
##################################
load_date=0
load_timestamp=1

#totalLoad
active_power=2

#interavtive load
kitchen_load=6

#back load
laundryroom_load=7
thermo_load=8

#weekend
weekend=[5,6]
weekday=[0,1,2,3,4]


# Vlaues for ploting
value=[]  
time_s=[]

active_count=0
total_count=0
error_count=0

hour_load=0
current_hour=999
##################################
##         	  SCRIPT	        ##
##################################
file_output = open(output_file_name,'w')  # The new out put file
print " [*] New file created as '"+output_file_name+"' .."

print " [*] Start reading file.."
with open(input_file) as f:
  for line in f:
    # Deal with data row by row
    row=line.split(';')
    total_count+=1   

    date_object = datetime.strptime(row[load_date], '%d/%m/%Y')
    day_of_week= date_object.weekday()  
   
    (hour, m, s) = row[load_timestamp].split(':')
    minute=(int(hour) * 3600 + int(m) * 60 + int(s))/60 # convert time to minutes
    
    try:
      sum=float(row[kitchen_load])+float(row[laundryroom_load])+float(row[thermo_load])   # the sum of values (total load)
    except ValueError:
      error_count+=1
      print " [*] ValueError ( "+str(error_count)+" ) at record , Date : '"+row[load_date]+"' , Time : '"+row[load_timestamp]+"' .."
      continue  

	  
    if  accept_condition: #condition of feautre selection
    
      if hour_based:	  #<---------------- (((Rule here))
	    #Make a total consumtion for an hour
        if current_hour==999:
          current_hour=int(hour)

        if current_hour==int(hour):
          hour_load+=sum
          continue
        else:
          active_count+=1
          weekend_marker=1
          if day_of_week in weekend:
            weekend_marker=2
          file_output.write(str(day_of_week)+ ','+ str(current_hour+1)+','+ str(weekend_marker)+ ','+str(hour_load)+'\n') # The final ourput (add +1 the current hour to avoid zero value)
          current_hour=int(hour)
          hour_load=sum       


file_output.close() # you can omit in most cases as the destructor will call it  

print ' [*] Done! '
print '----------------------------'
print 'Records Added: '+str(active_count)
print 'Total Records: '+str(total_count)
print 'Error Count  : '+str(error_count)
