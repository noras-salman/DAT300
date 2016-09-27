from datetime import datetime
import matplotlib.pyplot as plt
from numpy import loadtxt

#Load data with help of numpy
data = loadtxt('winter2006-2007.txt', delimiter=';')
row1=0
col8=7
print data[row1][col8]