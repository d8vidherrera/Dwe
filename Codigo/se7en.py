n = 10000000
start = 0
list = []
digitsum = 0

for i in range(start,n):
    if i % 7 == 0:
        for digit in str(i):
            digitsum += int(digit)
            if digitsum == 7:
                list.append(i)
print(list)