#!/usr/bin/env python3

def horner(poly, n, x):
    result = poly[0]

    for i in range(1, n):
        result = result * x + poly[i]

    return result

def main():

    n = int(input())
    v = list(map(float, input().strip().split(' ')))
    m = int(input())
    x_list = list()
    for i in range(0, m):
        x_list.append(float(input()))

    for x in x_list:
        res = horner(v, len(v), x)
        print("%.12f" % res)

if __name__ == '__main__':
    main()