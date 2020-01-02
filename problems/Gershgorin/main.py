#!/usr/bin/env python3

def main():

    n = int(input())
    matrix = []

    for i in range(n):  # A for loop for row entries
        a = []
        for j in range(n):  # A for loop for column entries
            a.append(int(input()))
        matrix.append(a)


if __name__ == '__main__':
    main()