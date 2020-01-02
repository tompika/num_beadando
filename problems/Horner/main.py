
def poly_naive(A, x):
    p = 0
    for i, a in enumerate(A):
        p += (x ** i) * a
    return p

def main():

    n = int(input())
    v = list(map(float, input().strip().split(' ')))
    m = int(input())
    w = list(map(float, input().strip().split(' ')))

    res = poly_naive(v)


    print("%.12f" % round(res, 8))

if __name__ == '__main__':
    main()