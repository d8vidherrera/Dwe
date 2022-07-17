from numba import njit
import numpy as np
import time as t
time = t.time()
@njit
def is_prime(n):
  for i in range(2,n):
    if (n%i) == 0:
      return False
  return True
listita = []
l = [_ for _ in range(1,100001)]
l2 = list(map(is_prime, l))
def count_primes(l2):
    for i in l2:
        if i == True:
            listita.append(i)
    #print(f'Prob = {(len(listita) - 1)/len(l)}')
    #print(f'Log = {1/(np.log(len(l)))}')
    #print(f'Diff = {len(listita)/len(l) - 1/(np.log(len(l)))}')
    print(f'Number of primes: {len(listita) - 1}')
count_primes(l2)
print(f'Time: {t.time()-time}s')