import numpy as np

f = lambda x : (x-3)**3 -3
df = lambda x : 3*(x**2) - 18*x + 27
    
def newton(x,trol,imax):
    c = 0
    xn = x - (f(x) / df(x))
    
    while abs(xn - x) > trol or c < imax:
        x = xn
        xn = x - f(x)/df(x)
        c += 1
        print(xn)
    return xn

print(newton(3.2,0.01,30))