#!/usr/bin/env python3

def matrix_matrix_multiplication(A, B):

    result = [[0.0 for i in range(len(B[0]))] for j in range(len(A))]

    for i in range(len(A)):
        for j in range(len(B[0])):
            for k in range(len(A[0])):
                result[i][j] += A[i][k] * B[k][j]

    return result

def readMatrix(n, m):

    matrix = []
    for i in range(n):
        a = []
        line_num = list(map(float, input().strip().split(' ')))
        for j in range(m):
            a.append(line_num[j])
        matrix.append(a)

    return matrix


def main():
    first_line = list(map(float, input().strip().split(' ')))
    k = int(first_line[0])
    m = int(first_line[1])
    n = int(first_line[2])

    A = readMatrix(k, m)
    B = readMatrix(m, k)

    #print(A)
    #print("B\n", B)
    #print("\n")

    c = matrix_matrix_multiplication(A, B)

    for i in range(len(c)):
        for j in range(len(c[0])):
            value = c[i][j]
            if int(value) == float(value):
                print("%.0f" % c[i][j], end=" ")
            else:
                print("%.12f" % c[i][j], end=" ")
        print("\n", end="")


if __name__ == '__main__':
    main()