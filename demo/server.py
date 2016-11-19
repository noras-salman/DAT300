#!/usr/bin/python
import socket
import sys
import json
import matplotlib.pyplot as plt
from numpy import loadtxt
from itertools import islice

def getWindow(hour):
  if windows==1:
    return 1
  else:
    window_size=int(24/window_count);       
    rangei=list(range(1,window_count+1))
    for w in rangei:	
	  lower_hour=w*window_count-window_count;
	  higer_hour=w*window_count;
	  if hour>lower_hour and hour<=higer_hour:
	    return w

def predict(xvals):
  theta=[]             
  with open(datadir+'theta', 'r') as f:              
    first_line = f.readline()
    first_line =first_line.rstrip('\n')
    theta=first_line.split(',')
  predection=0;
  
  features=normalize(xvals)
  
  for i in range(0, len(features)):
   
    predection=predection+float(features[i])*float(theta[i])
  return predection

def normalize(xvals):
  mu=[]
  sigma=[]

  with open(datadir+'mu', 'r') as f:
    first_line = f.readline()
    first_line =first_line.rstrip('\n')
    mu=first_line.split(',')
  with open(datadir+'sigma', 'r') as f:
    first_line = f.readline()
    first_line =first_line.rstrip('\n')
    sigma=first_line.split(',')
  features=[1]
  for i in range(0, len(xvals)-1): #skip the last one because its the actual load
    features.append((float(xvals[i])-float(mu[i]))/float(sigma[i]))
  return features;

dataset_dir=['data/d1','data/d2','data/d3']
model=['model1','model2']


### Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ('localhost', 10000)
print >>sys.stderr, 'starting up on %s port %s' % server_address
sock.bind(server_address)

# Listen for incoming connections
sock.listen(1)

while True:
    # Wait for a connection
    print >>sys.stderr, 'waiting for a connection'
    connection, client_address = sock.accept()
	
    try:
        print >>sys.stderr, 'connection from', client_address

        # Receive the data in small chunks and retransmit it
        while True:
            data = connection.recv(1024)
            print >>sys.stderr, 'received "%s"' % data
            if data:
                row=json.loads(data)
                d=int(row[0])
                row.pop(0)
                m=int(row[0])
                row.pop(0)
                window_count=1
                if m==2:
                  window_count=int(row[0])
                  row.pop(0)
                xvals=row #only x values left
                datadir=dataset_dir[d-1]+'/'+model[m-1]+'/'

                predection=predict(xvals)

				  #send the forecast (should be a string buffer)
                connection.sendall(str(predection))
            else:
                print >>sys.stderr, 'no more data from', client_address
                break
            
    finally:
        # Clean up the connection
        connection.close()


# Prepare for connections



# Recivce json array of the X values



# Send one value



# Predict Solve the hypotesis




# take an array solve and send
# normalize


