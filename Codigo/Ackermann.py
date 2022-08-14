import sys
from numba import jit
limit = 4500
sys.setrecursionlimit(limit)

while True:
    try:
        m = int(input("Ingrese el número m: "))
    except ValueError:
        print("Error: m debe ser un número entero.")
    try:
        n = int(input("Ingrese el número n: "))
    except ValueError:
        print("Error: n debe ser un número entero.")
    break

@jit(nopython = True)
def A(m,n):
    if m == 0:
        return n + 1
    elif m > 0 and n == 0:
        return A(m-1,1)
    else:
        return A(m-1,A(m,n-1))

def main():
    if m < 0 or n < 0:
        print("Error: m y n deben ser enteros positivos.")
    else:
        A(m,n)
        print(f"Resultado: {A(m,n)}")
main()