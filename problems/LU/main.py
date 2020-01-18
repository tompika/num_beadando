#!/usr/bin/env python3

def print_matrix(data):

    for i in range(len(data)):
        for j in range(len(data[0])):
            print("%.12f" % data[i][j], end=" ")
        print("\n", end="")


def lu_decomposition(A):

    for i in range(len(A)):
        for j in range(i + 1, len(A)):
            LUresult = (A[j][i] / A[i][i]) * -1
            for k in range(i, len(A)):
                A[j][k] = A[j][k] + (LUresult * A[i][k])
            A[j][i] = LUresult * -1
    return A


def main():
    matrix = []
    n = int(input())

    for i in range(n):
        matrix.append(list(map(float, input().strip().split(' '))))


    try:
        res = lu_decomposition(matrix)
    except ZeroDivisionError as e:
        print("fail")
    else:
        print_matrix(res)


if __name__ == '__main__':
    main()