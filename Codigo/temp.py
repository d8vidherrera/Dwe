#with open('C:\\Users\herre\OneDrive\Escritorio\Dwe\Padron\PADRON_COMPLETO.txt', 'r') as f:
#    txt = f.read().replace(' ', '')
#
#with open('C:\\Users\herre\OneDrive\Escritorio\Dwe\Padron\PADRON_COMPLETO.txt', 'w') as f:
#    f.write(txt)

lista = []
archivo = open('C:\\Users\herre\OneDrive\Escritorio\Dwe\Padron\PADRON_COMPLETO.txt', 'r')

c = 0
for i in archivo:
    for j in i:
        if 'TRUJILLO' in i and c < 1:
            lista.append(i)
print(lista)