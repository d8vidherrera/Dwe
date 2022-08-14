import random as rand
import time as t
time = t.time()
k = 5000000

def test():
    win, loss = 0, 0
    for i in range(0,k):
        a = rand.uniform(0,1)
        b = rand.uniform(0,1-a)
        c = 1-a-b
        if (a + b) > c and (b + c) > a and (a + c) > b:
            win += 1
        else:
            loss += 1
    print(f'{100*win/k}%')
    print(f'A + B + C: {a+b+c}')
test()
print(f'Time : {t.time()-time}')
