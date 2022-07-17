longitud_cm = float(input("Escriba la longitud en metros: ")) * 100

tucas_A = int(longitud_cm // 150)
residuo_A = int(longitud_cm % 150)
tucas_B = int(residuo_A // 27)
residuo_B = int(residuo_A % 27)
tucas_C = int(residuo_B // 6)
residuo_C = int(residuo_B % 6)


ganancia = int(tucas_A) * 95 + int(tucas_B) * 12 + int(tucas_C) * 2


print("Este tronco genera:")
print(str(tucas_A) + " tucas de tipo A")
print(str(tucas_B) + " tucas de tipo B")
print(str(tucas_C) + " tucas de tipo C")
print("Se desechan " + str(residuo_C) + " cm de material")
print("La ganancia es de " + str(ganancia) + " dólares") 