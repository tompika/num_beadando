#!/usr/bin/env python3


def norm1(input):
    return max([sum(list(map(abs, e))) for e in zip(*input)])

def normInf(li):
    return max([sum(list(map(abs, e))) for e in li])

def inv_mat(A):

    n = len(A)
    R = [[0.0 for i in range(n * 2)] for j in range(n)]

    # matrix copy
    for i in range(n):
        for j in range(n):
            R[i][j] = A[i][j]

    # place the identity matrix
    for i in range(n):
        for j in range(n, n * 2):
            if i == (j - n):
                R[i][j] = 1

    # inverse
    for i in range(n):
        while R[i][i] == 0:
            R[i], R[i + 2] = R[i + 2], R[i]
        t = R[i][i]
        for j in range(i, 2 * n):
            R[i][j] = R[i][j] / t
        for j in range(n):
            if i != j:
                t = R[j][i]
                for k in range(2 * n):
                    R[j][k] -= t * R[i][k];

    # remove the identity
    for i in range(n * n):
        R[int(i / n)].pop(0)

    return R

def main():
    A = []
    n = int(input())
    for i in range(n):
        A.append(list(map(float, input().strip().split(' '))))

    A_inv = inv_mat(A)
    res_inf = normInf(A) * normInf(A_inv)
    res_one = norm1(A) * norm1(A_inv)
    print("%.12f %.12f" % (round(res_inf, 12), round(res_one, 12)))


if __name__ == '__main__':
    main()
