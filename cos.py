def cos_rad(x):
    itr = 10
    ans = 0
    for i in range(0,itr):
        ans += (power(-1,i) / fact(2*i)) * (power(x,2*i))
    return ans

def power(base,exp):
    ans = 1
    for i in range(0,exp):
        ans *= base
    return ans

def fact(num):
    ans = 1
    for i in range(num,1,-1):
        ans *= i
    return ans

print(cos_rad(39))