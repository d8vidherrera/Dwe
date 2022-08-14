a = int(input("Ingrese el número a: "))
b = int(input("Ingrese el número b: "))

def q(a,b):
    global resultado
    resultado = 0
    if b <= a:
        resultado == q(a-b,b)
        resultado = resultado + 3
    else:
        resultado = 0

def main():
    if a < 0 or b < 0:
        print("Error: a o b no pueden ser negativos.")
    else:
        q(a,b)
        print(f"El resultado es: {resultado}")
main()