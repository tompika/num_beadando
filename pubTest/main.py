def f(n):
    if n == 0:
        return 1
    else:
        return n * f(n-1)

n=int(input())
for t in range(0,n):
    print("%d"%f(int(input())))

