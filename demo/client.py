
import socket
import sys
import json
import matplotlib.pyplot as plt
import time
import sys


dataset_dir=['data/d1','data/d2','data/d3']
dataset=['_hour_basic','_hour_basic_prev_hour','_hour_basic_prev_6hours']
model=['model1','model2']

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

try:
  with open(str(dataset_dir[d-1])+'/'+str(dataset[d-1])) as f:
    for line in f:
      line=line.rstrip('\n')
      # Deal with data row by row
      row=line.split(',')
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
      time.sleep(5) # delays for 5 seconds

finally:
    print >>sys.stderr, 'closing socket'
    sock.close()

#  Connect to server


# send a jason array every 5 secouds and plot the current load



#  recevice the prediction for next hour and plot the next hour load