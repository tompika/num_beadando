#!/usr/bin/env python3

def main():

    d = int(input())
    v = list(map(float, input().strip().split(' ')))
    w = list(map(float, input().strip().split(' ')))
    data = []

    for i in range(d):
        data.append(v[i] * w[i])
    res = sum(data)

    print("%.12f" % round(res, 8))

if __name__ == '__main__':
    main()