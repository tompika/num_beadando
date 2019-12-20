import numpy

def matrixnorma(A):
  mxi=0
  for sor in A:
    mxi=max(mxi,sum(abs(v) for v in sor))
  mx1=0
  for j in range(len(A)):
    mx1=max(mx1,sum(abs(A[i][j]) for i in range(len(A))))
  return mx1,mxi

def lu(A):
  A=numpy.array(A,dtype=float)
  n=len(A)
  for k in range(n):
    akk=A[k,k]
    if abs(akk)<1e-15: return None
    for j in range(k+1,n):
      A[j,k]/=akk
      A[j,k+1:]-=A[j,k]*A[k,k+1:]
  return A
