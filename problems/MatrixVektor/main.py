#!/usr/bin/env python3
from functools import reduce

def matrix_vector_multiplication(A, v):
    nrows = len(A)
    w = [None] * nrows
    for row in range(nrows):
        w[row] = reduce(lambda x, y: x + y, map(lambda x, y: x*y, A[row], v))

    return w


def main():

    first_line = list(map(float, input().strip().split(' ')))
    m = int(first_line[0])
    n = int(first_line[1])

    matrix = []
    for i in range(m):
        a = []
        line_num = list(map(float, input().strip().split(' ')))
        for j in line_num:
            a.append(j)
        matrix.append(a)

    #print(matrix)

    vector = list()
    for i in range(n):
        vector.append(float(input()))

    #print("Vector:", vector)

    result = matrix_vector_multiplication(matrix, vector)
    for item in result:
        print("%.12f" % item)


if __name__ == '__main__':
    main()