def root(x,y):
    t=26
    r=1
    b=2
    e=1
    while t!=0:
        print(f"Trials = {t}")
        t=t-1
        while r**x>=y:
            r=r-r/b**e
        e=e+1
        while r**x<y:
            r=r+r/b**e
        e=e+1
    print(r)
root(2,2)