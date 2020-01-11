#!/usr/bin/env python3


def norm1(input):
    return max([sum(list(map(abs, e))) for e in zip(*input)])

def main():

    data = []
    n = int(input())
    for i in range(n):
        data.append(list(map(float, input().strip().split(' '))))

    res = norm1(data)
    print("%.12f" % round(res, 8))


if __name__ == '__main__':
    main()