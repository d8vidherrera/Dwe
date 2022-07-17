positivos = []
negativos = []
numeros = []

for i in range(0,10):
    numeros.append(float(input("Ingrese un número: ")))
print(numeros)

for elemento in numeros:
    if elemento <0:
        negativos.append(elemento)
    else:
        positivos.append(elemento)
print(f"Positivos: \n{positivos}")
print(f"Negativos: \n{negativos}")