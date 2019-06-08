import numpy as np
import matplotlib.pyplot as plt
import math

# First type of panel plot in Python
x=np.arange(0,100,0.01)
y=np.sin(x)

fig, ax = plt.subplots(2, 3, sharex='col', sharey='row')
# axes are in a two-dimensional array, indexed by [row, col]
titles=["a","b","c","d","e","f"]
print(titles[5])
col =['g','r','k','b','rp','go']
for i in range(2):
    for j in range(3):
        ax[i, j].text(0.2, 0.8, titles[j+i*3],fontsize=16, ha='center')
        ax[i,j].plot(x,y,col[j+i*3]);              

fig.savefig("PanelPlot1.pdf")

# Second type of panel plot in Python

grid = plt.GridSpec(2, 5, wspace=0.4, hspace=0.3)
plt.subplot(grid[0, 2:])
plt.plot(x,y,'r');                    
plt.subplot(grid[0, 0])
plt.plot(x,y,'r');
y=np.random.rand(len(x))
plt.subplot(grid[1, 2:])
plt.plot(x,y,'k');
plt.subplot(grid[1, 0:1]);
# Create some normally distributed data
mean = [0, 0]
cov = [[1, 1], [1, 2]]
x, y = np.random.multivariate_normal(mean, cov, 10000).T
plt.hist2d(x, y, bins=30, cmap='Blues')
cb = plt.colorbar()
cb.set_label('counts in bin')


fig.savefig("PanelPlot2.pdf")
#Third type of panel plot in Python

# Create some normally distributed data
mean = [0, 0]
cov = [[1, 1], [1, 2]]
x, y = np.random.multivariate_normal(mean, cov, 3000).T

# Set up the axes with gridspec
fig = plt.figure(figsize=(6, 6))
grid = plt.GridSpec(4, 4, hspace=0.2, wspace=0.2)
main_ax = fig.add_subplot(grid[:-1, 1:])
y_hist = fig.add_subplot(grid[:-1, 0], xticklabels=[], sharey=main_ax)
x_hist = fig.add_subplot(grid[-1, 1:], yticklabels=[], sharex=main_ax)

# scatter points on the main axes
main_ax.plot(x, y, 'ok', markersize=3, alpha=0.2)

# histogram on the attached axes
x_hist.hist(x, 40, histtype='stepfilled',
            orientation='vertical', color='gray')
#x_hist.text(0.01, 0.8, "b )",fontsize=16, ha='center',
#            bbox=dict(facecolor='none',edgecolor='black',boxstyle='square'))
x_hist.invert_yaxis()

y_hist.hist(y, 40, histtype='stepfilled',
            orientation='horizontal', color='gray')
y_hist.invert_xaxis()

fig.savefig("PanelPlot3.pdf")
