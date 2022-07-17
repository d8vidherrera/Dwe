import numpy as np

f = lambda x : 3*x**2-1
df = lambda x : 6*x

def newton(x,trol,imax):
    xn = x
    c = 0
    xn = x - f(x)/df(x)
    while abs(xn - x) >= trol and c <= imax:
        x = xn
        xn = x - f(x)/df(x)
        c += 1
    return xn
print(newton(1,0.0001,500))