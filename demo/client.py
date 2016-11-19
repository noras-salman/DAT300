
import socket
import sys
import json
import matplotlib.pyplot as plt
import time
import sys

def numToWeekday(n):
  weekdays=['Monday','Tuesday','Wednsday','Thursday','Friday','Saturday','Sunday']
  return weekdays[n-1]

speed=0.5 #in secounds
  
dataset_dir=['data/d1','data/d2','data/d3']
dataset=['_hour_basic','_hour_basic_prev_hour','_hour_basic_prev_6hours']


if len(sys.argv)<3:
  print 'USAGE:   client.py [dataset] [model]'
  sys.exit(0)
else:
  d=int(sys.argv[1])
  m=int(sys.argv[2])
  if m==2:
    if len(sys.argv)<4:
      print 'USAGE:   client.py [dataset] 2 [windows]'
      sys.exit(0)
    else:
      w=int(sys.argv[3])

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect the socket to the port where the server is listening
server_address = ('localhost', 10000)
print >>sys.stderr, 'connecting to %s port %s' % server_address
sock.connect(server_address)

fig = plt.figure()
ax = fig.gca()
fig.show()
xyv=[]
yv=[]
xpv=[]
pv=[]
plt.clf()
try:
  with open(str(dataset_dir[d-1])+'/'+str(dataset[d-1])) as f:
    for line in f:
      line=line.rstrip('\n')
      # Deal with data row by row
      row=line.split(',')
      x=int(row[1])
      if x==1:
        plt.cla()
        ax = fig.gca()
        xtext=ax.set_xlabel('Time (Hour)')
        ytext=ax.set_ylabel('Time (Watts)')
        ax.set_title(numToWeekday(int(row[0])))
        xyv=[]
        yv=[]
        xpv=[]
        pv=[]
        
      xyv.append(x)
      print row[len(row)-1]
      y=float(row[len(row)-1])
      yv.append(y)
      ax.plot(x, y, 'bo')
      ax.plot(xyv, yv, 'b',label='Actual Load')
      print xyv
      print yv
      fig.canvas.draw()
      # Send data
      if m!=2:
        row=[str(d)] + [str(m)]+ row
      else:
        row=[d] + [m]+ [w]+row
      message = json.dumps(row)
      print >>sys.stderr, 'sending "%s"' % message
      sock.sendall(message)
    
      data = sock.recv(1024)
      print >>sys.stderr, 'received "%s"' % data
      xpv.append(x+1)
      pv.append(float(data))
      ax.plot(x+1, float(data), 'ro')
      ax.plot(xpv, pv,'r',label='Forecast')
      if x==1:
        legend = ax.legend()
      fig.canvas.draw()
      time.sleep(speed) # delays for 5 seconds

finally:
    print >>sys.stderr, 'closing socket'
    sock.close()
    #fig.close()

#  Connect to server


# send a jason array every 5 secouds and plot the current load



#  recevice the prediction for next hour and plot the next hour load