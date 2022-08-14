import numpy as np
resultado = 0 
n = int(input("Ingrese el número n: "))
for k in range(0,n):
    resultado = resultado + 1/np.math.factorial(k)
print(resultado)