import numpy as np

A = []
try:
    n = int(input("Ingrese la cantidad de filas de la matriz A: "))
    m = int(input("Ingrese la cantidad de columnas de la matriz A: "))
except ValueError:
    print("Error: Debe ingresar un número válido. ")
for i in range(0,n):
    col = []
    for j in range(0,m):
        num = int(input(f"Ingrese el número: {i},{j}: "))
        col.append(num)
    A.append(col)

x0 = np.array([[0,0,0,0]]).T
b = np.array([[2,0,2,2]]).T
k = int(input('Ingrese la cantidad de iteraciones deseada. '))

def es_cuadrada(A):
    rows = len(A)
    for row in A:
        if len(row) != rows:
            print('Error: La matriz no es cuadrada.')
            return False
        else:
            return True
        
def vectores_equivalentes(b,x0):
    if len(b) != len(x0):
        print('Error: Los vectores b y x0 no son del mismo tamaño.')
        return False
    else:
        return True

def jacobiM(A,b,x0,k):
    x_jac = x0
    D = np.diag(np.diag(A))
    L = np.tril(A,-1)
    U = np.triu(A, 1)
    cont = 0
    while cont < k and es_cuadrada(A) == True and vectores_equivalentes(b,x0) == True:
        cont = cont + 1
        D_inv = np.linalg.inv(D)
        L_U = L + U
        L_U_x_jac = np.matmul(L_U,x_jac)
        E = b - L_U_x_jac
        x_jac = np.matmul(D_inv,E)
    print('Jacobi:')    
    print(x_jac)
    
def GaussSeidelFM(A,b,x0,k):
    x_gsf = x0
    D = np.diag(np.diag(A))
    L = np.tril(A,-1)
    U = np.triu(A, 1)
    cont = 0
    while cont < k and es_cuadrada(A) == True and vectores_equivalentes(b,x0) == True:
        cont = cont + 1
        L_D = L + D
        L_D_inv = np.linalg.inv(L_D)
        U_x_gsf = np.matmul(U,x_gsf)
        H = b - U_x_gsf
        x_gsf = np.matmul(L_D_inv,H)
    print('Gauss-Seidel hacia adelante:')
    print(x_gsf)
    
def GaussSeidelBM(A,b,x0,k):
    x_gsb = x0
    D = np.diag(np.diag(A))
    L = np.tril(A,-1)
    U = np.triu(A, 1)
    cont = 0
    while cont < k and es_cuadrada(A) == True and vectores_equivalentes(b,x0) == True:
        cont = cont + 1
        D_U = D + U
        D_U_inv = np.linalg.inv(D_U)
        L_x_gsb = np.matmul(L,x_gsb)
        M = b - L_x_gsb
        x_gsb = np.matmul(D_U_inv,M)
    print('Gauss-Seidel hacia atrás:')
    print(x_gsb)

def main():
    if es_cuadrada(A) == True and vectores_equivalentes(b,x0) == True:
        jacobiM(A,b,x0,k)
        GaussSeidelFM(A,b,x0,k)
        GaussSeidelBM(A,b,x0,k)
main()