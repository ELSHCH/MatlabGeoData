import matplotlib.pyplot as plt
import csv
import os

x  = []
y1 = []
y2 = []

#f = plt.figure()
with open('windLH20182019.txt','r') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    row_count = sum(1 for row1 in csv_reader)
    csvfile.seek(0) # move to begining of csv file
    for row in csv_reader:
          x.append(int(row[0]))
          y1.append(float(row[1]))
          y2.append(float(row[2]))
#ax1 = f.add_axes([],xticklabels,ylim(0,30))
#ax1.plot(x,y1)
#ax1.xlabel('date')
#ax1.ylabel('Wind speed, m/s')
#ax1.title('WIND DATA LIGHTHOUSE (2018-2019)')
        
fig, axs = plt.subplots(2, 1)
for tick in axs[0].get_xticklabels():
    tick.set_rotation(55)
axs[0].plot(x,y1)    
axs[0].set_xlabel('date')
axs[0].set_xlim(x[0], x[row_count-1])
axs[0].set_ylim(0,40)
axs[0].set_ylabel('Wind speed, m/s')

for tick in axs[1].get_xticklabels():
    tick.set_rotation(55)
axs[1].set_ylabel('Wind direction, deg')
axs[1].set_xlabel('date')
axs[1].set_xlim(x[0], x[row_count-1])
axs[1].set_ylim(0,40)
axs[1].plot(x,y2)   
fig.align_xlabels()

#ax2 = f.add_axes([],xticklabels, ylim=(0, 400))
#ax2.plot(x,y2)
#ax2.xlabel('date')
#ax2.ylabel('Wind direction, deg')
#ax2.show()


fig.savefig("windLH20182019.pdf")
