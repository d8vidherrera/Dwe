import numpy as np
#Calculates the total area between 2 functions f and g from point start to point end.
def area(f,g,start,end):
    dx = 0.00001
    total = 0
    for i in np.arange(start,end,dx):
        total += (abs(f(i) - g(i))) * dx
    return total