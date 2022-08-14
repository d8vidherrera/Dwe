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

def Prime(n):
    if n & 1 == 0:
        return 2
    d= 3
    while d * d <= n:
        if n % d == 0:
            return d
        d= d + 2
    return 0

print(list(map(Prime,[i for i in range(100)])))