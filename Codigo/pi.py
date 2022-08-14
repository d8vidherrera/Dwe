def aprox_pi(n):
    resultado = 0
    for i in range (n):
        resultado += (-1)**i/(2*i+1)
    return 4 * resultado
pi = aprox_pi(1000000)
#print(f"{pi:.5f}")
print(pi)