import numpy as np
f = lambda x : np.log2(1+x) # f(x) = log_2(1+x)
a = lambda x : x + increment # f(x) = x + C
increment = 0 # Incremento
start = 0 # Inicio
List_diff = [] # Lista de las diferencias
List_aver = [] #Lista para los promedios
limit = 0.1
step_size = 0.1

steps = (limit / step_size) * (1 / step_size) 

def average(List):
    Sum = 0
    for i in range(0,len(List)):
        Sum += List[i]
    return Sum / len(List)
        
for i in range(0,int(steps)):
    if List_diff == []:
        for j in np.arange(0,limit,step_size):
            increment += j
            for k in np.arange(0,1,step_size):
                diff = abs(f(k) - a(k))
                List_diff.append(diff)
    elif List_diff != []:
        List_aver.append(average(List_diff))
        List_diff = []
        increment = 0
print(List_aver)