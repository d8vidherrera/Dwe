import time as t

x = 10106099866009181   

'''def prime(x):
    if x == 1 or x ==0:
        return False
    for i in range(round(x**(1/2)),1,-1):
        if x % i == 0:
            return False
    return True
inicio = t.time()
print(prime(x))
final = t.time()
print(final - inicio)'''

def Prime(x):
    if x & 1 == 0:
        return True
    d= 3
    while d * d <= x:
        if x % d == 0:
            return d
        d= d + 2
    return 0
inicio = t.time()
print(Prime(x))
final = t.time()
print(final - inicio)
