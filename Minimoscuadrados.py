import matplotlib.pyplot as pl
import numpy as np
from math import sqrt

x = [1, 0, 1, 2, 5, 1, 4, 6, 2, 3, 5, 4, 6, 8, 4, 5, 7, 9, 7, 6]
y = [60, 63, 65, 70, 70, 70, 80, 90, 80, 80, 85, 89, 90, 90, 90, 90, 94, 100, 100, 100]

sigma_x = sum(list(x))
#print(f"Suma X = {sigma_x:.4f}")
sigma_y = sum(list(y))
#print(f"Suma Y = {sigma_y:.4f}")
sigma_xy = 0
sigma_x2 = 0
sigma_y2 = 0

for i in range(0,len(x)):
    mult_xy = x[i]*y[i]
    sigma_xy = sigma_xy + mult_xy
#print(f"Suma XY = {sigma_xy:.4f}")

for i in range(0,len(x)):
    mult_x2 = x[i]*x[i]
    sigma_x2 = sigma_x2 + mult_x2
print(f"Suma X^2 = {sigma_x2:.4f}")

for i in range(0,len(x)):
    mult_y2 = y[i]*y[i]
    sigma_y2 = sigma_y2 + mult_y2
#print(f"Suma Y^2 = {sigma_y2:.4f}")
      
n = len(x)
m = (n*sigma_xy-sigma_x*sigma_y)/(n*sigma_x2-(sigma_x)**2)
b = (sigma_y*sigma_x2-sigma_x*sigma_xy)/(n*sigma_x2-(sigma_x)**2)
print(f"m = {m:.4f}")
print(f"b = {b:.4f}")
r2 = (n*sigma_xy-sigma_x*sigma_y)/sqrt((n*sigma_x2-(sigma_x)**2)*(n*sigma_y2-(sigma_y)**2))
print(f"R^2 = {r2**2:.4f}")

x1 = np.arange(-2,10,0.1)
a = m*x1+b
pl.plot(x1,a,'b',label = 'Recta')
pl.plot(x,y,'ro',label = 'Nodos')
pl.xlabel('x')
pl.ylabel('y')
pl.grid(True)
pl.legend(loc=9)
pl.title('Recta de regresión lineal')
pl.show()