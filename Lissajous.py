import matplotlib.pyplot as plt
from matplotlib import animation
import numpy as np
from math import pi

a = 1
b = 3
delta = pi/2

t = np.linspace(-2*pi,2*pi,500)
fig = plt.figure()
ax = plt.subplot()

def animate(i):
    if i < 500:
        a = b*(0.02* i)
    x = np.sin(a*t + delta)
    y = np.cos(b*t)
    ax.clear()
    plt.plot(x,y,lw = 2.5)
    return fig

anim = animation.FuncAnimation(fig,
                               animate, frames = 1000,
                               interval = 20, blit = False)
plt.show()