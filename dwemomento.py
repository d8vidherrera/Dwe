import numpy as np
increment = 0
f = lambda x : np.log2(1+x)
a = lambda x : x + increment
list_diff = []
list_aver = []
n = 100

def average(List):
    return sum(List)/len(List)

for j in range(0,n):
    increment += 1/(1*n)
    for i in range(0,n):
        diff = abs(f(i/n)-a(i/n))
        list_diff.append(diff)
    prom = average(list_diff)
    list_aver.append(prom)
    
best = min(list_aver)
if best in list_aver:
    print(list_aver.index(best))
print(best)