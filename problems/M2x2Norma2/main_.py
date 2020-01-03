#!/usr/bin/env python3
import math

def hypot(a, b):
    res = 0

    if abs(a) > abs(b):
        res = b / a
        res = abs(a) * math.sqrt(1 + res * res)
    elif b != 0:
        res = a/b
        res = abs(b) * math.sqrt(1 + res * res)
    else:
        res = 0.0

    return res


def matrix_norm(A, n):

    result = 0.0
    maximum = max(map(max, A))
    for row in range(len(A)):
        for m in range(len(A[row])):
            result += A[row][m]**2

    return math.sqrt(result)

def main():


    matrix = []
    for i in range(2):
        a = []
        line_num = list(map(float, input().strip().split(' ')))
        for j in line_num:
            a.append(j)
        matrix.append(a)

    print(matrix)
    print("%.12f" % matrix_norm(matrix, 2))


if __name__ == '__main__':
    main()