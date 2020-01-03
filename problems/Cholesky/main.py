#!/usr/bin/env python3

import math


def transpose(mat, tr, N):
    for i in range(N):
        for j in range(N):
            tr[i][j] = mat[j][i]

def isSymmetric(mat, N):

    tr = [[0 for j in range(len(mat[0]))] for i in range(len(mat))]

    transpose(mat, tr, N)

    for i in range(N):
        for j in range(N):
            if (mat[i][j] != tr[i][j]):
                return False
    return True

def cholesky_felbontas(matrix, n):

    lower = [[0 for x in range(n + 1)]
             for y in range(n + 1)];

    for i in range(n):
        for j in range(i + 1):
            sum1 = 0

            if (j == i):
                for k in range(j):
                    sum1 += pow(lower[j][k], 2)
                    try:
                        lower[j][j] = int(math.sqrt(matrix[j][j] - sum1))
                    except ValueError:
                        if not isSymmetric(matrix, n):
                            lower = "fail"

            else:

                for k in range(j):
                    sum1 += (lower[i][k] * lower[j][k])
                if (lower[j][j] > 0):
                    lower[i][j] = int((matrix[i][j] - sum1) /
                                      lower[j][j])


        return lower

def main():

    n = int(input())

    matrix = []
    for i in range(n):
        line = list(map(float, input().strip().split(' ')))
        for j in range(n-1 - i):
            line.append(float(0.0))

        matrix.append(line)

    #print(matrix)
    res = cholesky_felbontas(matrix, n)

    if sum(map(sum, res)) == 0:
        print("fail")
    else:
        for i in range(n):
            for j in range(n):
                print("%.12f" % res[i][j], end=" ")
            print("\n", end="")

    #print(matrix)


if __name__ == '__main__':
    main()