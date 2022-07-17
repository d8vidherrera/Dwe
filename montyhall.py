import random as random

k = int(input("Ingrese la cantidad de iteraciones a realizar: "))
casos = ["auto","cabra","cabra"]

def simulacion (k,casos):
    contador = 0
    ganadas = 0
    perdidas = 0
    for iteraciones in range(0,k):
        contador += 1
        random.shuffle(casos) # Se colocan los premios aleatoriamente detrás de las puertas
        escogencia = random.randint(0,2)
        if casos[escogencia] == "auto": 
            perdidas += 1 # El jugador eligió la puerta del auto pero cambió su opinión después
        elif casos[escogencia] == "cabra": # 
            ganadas += 1 # Primera elección fue cabra pero eligió cambiar y ganó auto
    ratio_ganadas = (ganadas*100)/k
    ratio_perdidas = (perdidas*100)/k
    print(f"Veces que se ganó el auto: {ratio_ganadas}%")
    print(f"Veces que se ganó una cabra: {ratio_perdidas}%")
simulacion(k,casos)



