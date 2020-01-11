#!/usr/bin/env python3

def normInf(li):
    return max([sum(list(map(abs, e))) for e in li])

def main():

    data = []
    n = int(input())
    for i in range(n):
        data.append(list(map(float, input().strip().split(' '))))

    res = normInf(data)

    print("%.12f" % round(res, 8))

if __name__ == '__main__':
    main()