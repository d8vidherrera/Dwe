import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d

a = np.array([1,2,3])
b = np.array([3,1,2])


def projection(u,v):
    proj = np.dot(np.dot(u,v)/np.dot(v,v),v)
    return proj
dwe = projection(a,b).tolist()

print(f'Projection vector : {dwe}')

a , b = a.tolist(), b.tolist()

fig = plt.figure()
ax = plt.axes(projection = '3d')

ax.set_xlim([0,5])
ax.set_ylim([0,5])
ax.set_zlim([0,5])

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

ax.quiver(0,0,0,a[0],a[1],a[2],color = 'r')
ax.quiver(0,0,0,b[0],b[1],b[2],color = 'b')
ax.quiver(0,0,0,dwe[0],dwe[1],dwe[2],color='g')
plt.show()