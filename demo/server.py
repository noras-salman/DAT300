
import socket
import sys
import json
import matplotlib.pyplot as plt
from numpy import loadtxt


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
                if m==2:
                  w=row[0]
                  row.pop(0)
                datadir=dataset_dir[d-1]+'/'+model[m-1]+'/'
                theta=[]
                mu=[]
                sigma=[]
                with open(datadir+'theta', 'r') as f:
                  first_line = f.readline()
                  theta=first_line.split(',')
                with open(datadir+'mu', 'r') as f:
                  first_line = f.readline()
                  mu=first_line.split(',')
                with open(datadir+'sigma', 'r') as f:
                  first_line = f.readline()
                  sigma=first_line.split(',')
                #Normailize
                features=[1]
                for i in range(0, len(row)-1):
                  features.append((float(row[i])-float(mu[i]))/float(sigma[i]))
				  #Do the calculation
                predection=0;
                for i in range(0, len(row)-1):
                  predection=predection+float(row[i])*float(theta[i])
				  #send the forecast
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

#



